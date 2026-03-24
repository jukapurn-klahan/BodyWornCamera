import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:get/get.dart';

class CameraController extends GetxController with GetTickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final webViewCaptureKey = GlobalKey();
  static const String _streamApiUrl = String.fromEnvironment(
    'CAMERA_STREAM_API_URL',
    defaultValue: 'http://www.centrecities.com:3007/api/v1/stream',
  );
  static const String _cameraWebUrl = String.fromEnvironment(
    'CAMERA_WEB_URL',
    defaultValue: 'http://192.168.1.54:5001/video_feed',
  );
  static const String _cameraStreamUrl = String.fromEnvironment(
    'CAMERA_STREAM_URL',
    defaultValue: '',
  );
  String get cameraWebUrl => _cameraWebUrl;
  String get cameraStreamUrl => _activeCameraStreamUrl;
  String get cameraTitle => _cameraTitle;
  VlcPlayerController? vlc;
  late TabController tabBarController;
  final isPlayerReady = false.obs;
  final isOffline = false.obs;
  var isMicOn = false.obs;
  var isLightOn = false.obs;
  var isPrivacyMode = false.obs;
  var isAlarmOn = true.obs;
  var isCapturingSnapshot = false.obs;
  var lastSnapshotPath = RxnString();
  int cameraIndex = 0;
  bool _isClosingWithPreview = false;
  String _cameraTitle = 'กล้อง 1';
  String _activeCameraStreamUrl = _cameraStreamUrl;

  void toggleMic() => isMicOn.toggle();
  void toggleLight() => isLightOn.toggle();
  void togglePrivacy() => isPrivacyMode.toggle();
  void toggleAlarm() => isAlarmOn.toggle();
  final count = 0.obs;

  void increment() => count.value++;

  @override
  void onInit() {
    super.onInit();
    log('onInit');

    final args = Get.arguments;
    if (args is Map) {
      final cameraIndexArg = args['cameraIndex'];
      if (cameraIndexArg is int && cameraIndexArg >= 0) {
        cameraIndex = cameraIndexArg;
      }

      final cameraTitleArg = args['cameraTitle'];
      if (cameraTitleArg is String && cameraTitleArg.trim().isNotEmpty) {
        _cameraTitle = cameraTitleArg.trim();
      } else {
        _cameraTitle = 'กล้อง ${cameraIndex + 1}';
      }

      final streamUrlArg = args['cameraStreamUrl'];
      if (streamUrlArg is String && streamUrlArg.trim().isNotEmpty) {
        _activeCameraStreamUrl = streamUrlArg.trim();
      }
    } else {
      _cameraTitle = 'กล้อง ${cameraIndex + 1}';
    }

    tabBarController = TabController(vsync: this, length: 2, initialIndex: 0);
    unawaited(_initializePlayer());
  }

  Future<void> _initializePlayer() async {
    final streamUrlFromApi = await _fetchStreamUrlFromApi();
    if (streamUrlFromApi != null) {
      _activeCameraStreamUrl = streamUrlFromApi;
    }

    final resolvedStreamUrl = _activeCameraStreamUrl.trim();
    if (resolvedStreamUrl.isEmpty) {
      log('No stream URL available. Camera is OFFLINE.');
      isOffline.value = true;
      isPlayerReady.value = false;
      return;
    }

    try {
      vlc = VlcPlayerController.network(
        resolvedStreamUrl,
        autoPlay: true,
        options: VlcPlayerOptions(),
      );
      isOffline.value = false;
      isPlayerReady.value = true;
    } catch (error, stackTrace) {
      log('Initialize VLC failed: $error', stackTrace: stackTrace);
      isOffline.value = true;
      isPlayerReady.value = false;
    }
  }

  Future<String?> _fetchStreamUrlFromApi() async {
    final httpClient = HttpClient();
    try {
      final request = await httpClient
          .postUrl(Uri.parse(_streamApiUrl))
          .timeout(const Duration(seconds: 8));
      request.headers.set(HttpHeaders.acceptHeader, 'application/json');
      request.headers.set(
        HttpHeaders.contentTypeHeader,
        'application/json;charset=UTF-8',
      );
      request.write(
        jsonEncode({
          'User': 'true',
          'deviceCode': '1000093',
          'channelId': '1000093\$1\$0\$0',
        }),
      );

      final response = await request.close().timeout(
        const Duration(seconds: 8),
      );
      if (response.statusCode != HttpStatus.ok) {
        log('Fetch stream api failed: status=${response.statusCode}');
        return null;
      }

      final body = await response.transform(utf8.decoder).join();
      final decoded = jsonDecode(body);
      if (decoded is Map<String, dynamic>) {
        final url = decoded['video_url'];
        if (url is String && url.trim().isNotEmpty) {
          return url.trim();
        }
      }

      log('Fetch stream api failed: invalid payload');
      return null;
    } catch (error, stackTrace) {
      log('Fetch stream api failed: $error', stackTrace: stackTrace);
      return null;
    } finally {
      httpClient.close(force: true);
    }
  }

  Future<void> closeWithPreview() async {
    if (_isClosingWithPreview) {
      return;
    }
    _isClosingWithPreview = true;
    final previewBytes = await capturePreviewFrame();
    Get.back(
      result: {'cameraIndex': cameraIndex, 'previewBytes': previewBytes},
    );
  }

  Future<Uint8List?> capturePreviewFrame() async {
    final player = vlc;
    if (player == null || !isPlayerReady.value) {
      return null;
    }

    try {
      for (var attempt = 0; attempt < 3; attempt++) {
        final playingState = player.value.playingState;
        final isPlaying =
            playingState == PlayingState.playing ||
            playingState == PlayingState.recording;
        if (isPlaying) {
          final bytes = await player.takeSnapshot();
          if (bytes != null && bytes.isNotEmpty) {
            return bytes;
          }
        }
        await Future<void>.delayed(const Duration(milliseconds: 180));
      }
    } catch (error, stackTrace) {
      log('capturePreviewFrame failed: $error', stackTrace: stackTrace);
    }
    return null;
  }

  @override
  void onClose() {
    vlc?.dispose();
    super.onClose();
  }
}
