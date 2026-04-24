import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_screenshot_plus/flutter_native_screenshot_plus.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:video_player/video_player.dart';

class CameraController extends GetxController with GetTickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final webViewCaptureKey = GlobalKey();
  static const Duration playerInitializeTimeout = Duration(seconds: 30);
  static const String streamUserAgent =
      'Mozilla/5.0 (Linux; Android 14; BodyWornCam) AppleWebKit/537.36 '
      '(KHTML, like Gecko) Chrome/123.0.0.0 Mobile Safari/537.36';
  static const Map<String, String> streamHttpHeaders = {
    HttpHeaders.acceptHeader:
        'application/vnd.apple.mpegurl,application/x-mpegURL,*/*',
    HttpHeaders.userAgentHeader: streamUserAgent,
  };
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
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;
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
  String _deviceCode = '1000067';
  String _activeCameraStreamUrl = _cameraStreamUrl;

  void toggleMic() => isMicOn.toggle();
  void toggleLight() => isLightOn.toggle();
  void togglePrivacy() => isPrivacyMode.toggle();
  void toggleAlarm() => isAlarmOn.toggle();
  final count = 0.obs;

  void increment() => count.value++;

  static VideoFormat? resolveVideoFormatHint(String streamUrl) {
    final normalizedUrl = streamUrl.toLowerCase();
    if (normalizedUrl.contains('.m3u8')) {
      return VideoFormat.hls;
    }
    if (normalizedUrl.contains('.mpd')) {
      return VideoFormat.dash;
    }
    return null;
  }

  static List<VideoViewType> resolveVideoViewTypes() {
    if (GetPlatform.isAndroid) {
      return const [VideoViewType.textureView, VideoViewType.platformView];
    }
    return const [VideoViewType.textureView];
  }

  static Future<VideoPlayerController> createStreamPlayer(
    String streamUrl,
  ) async {
    final uri = Uri.parse(streamUrl);
    final formatHint = resolveVideoFormatHint(streamUrl);
    Object? lastError;
    StackTrace? lastStackTrace;

    for (final viewType in resolveVideoViewTypes()) {
      final player = VideoPlayerController.networkUrl(
        uri,
        formatHint: formatHint,
        httpHeaders: streamHttpHeaders,
        viewType: viewType,
      );

      try {
        log('Trying video player init with viewType=$viewType url=$streamUrl');
        await player.initialize().timeout(playerInitializeTimeout);
        return player;
      } catch (error, stackTrace) {
        lastError = error;
        lastStackTrace = stackTrace;
        log(
          'Video player init failed with viewType=$viewType: $error',
          stackTrace: stackTrace,
        );
        await player.dispose();
      }
    }

    if (lastError != null) {
      Error.throwWithStackTrace(lastError, lastStackTrace!);
    }
    throw StateError('Unable to initialize video player for $streamUrl');
  }

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

      final deviceCodeArg = args['deviceCode'];
      if (deviceCodeArg is String && deviceCodeArg.trim().isNotEmpty) {
        _deviceCode = deviceCodeArg.trim();
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
      await _disposePlayerControllers();

      final player = await createStreamPlayer(resolvedStreamUrl);

      final aspectRatio = player.value.aspectRatio > 0
          ? player.value.aspectRatio
          : 16 / 9;
      final chewie = ChewieController(
        videoPlayerController: player,
        aspectRatio: aspectRatio,
        autoPlay: true,
        looping: false,
        showControls: false,
        allowFullScreen: false,
        allowMuting: false,
        allowPlaybackSpeedChanging: false,
        showOptions: false,
        isLive: true,
        materialProgressColors: ChewieProgressColors(
          playedColor: Colors.white,
          handleColor: Colors.white,
          bufferedColor: Colors.white38,
          backgroundColor: Colors.white24,
        ),
      );

      videoPlayerController = player;
      chewieController = chewie;
      isOffline.value = false;
      isPlayerReady.value = true;
    } on TimeoutException catch (error, stackTrace) {
      log(
        'Initialize video player timed out after '
        '${playerInitializeTimeout.inSeconds}s for $resolvedStreamUrl: $error',
        stackTrace: stackTrace,
      );
      await _disposePlayerControllers();
      isOffline.value = true;
      isPlayerReady.value = false;
    } catch (error, stackTrace) {
      log('Initialize video player failed: $error', stackTrace: stackTrace);
      await _disposePlayerControllers();
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
      //   request.write(jsonEncode({'User': 'true', 'deviceCode': _deviceCode, 'channelId': '$_deviceCode\$1\$0\$0'}));
      request.write(
        jsonEncode({
          'deviceCode': _deviceCode,
          'channelId': '$_deviceCode\$1\$0\$0',
        }),
      );

      log('request: $request');

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
        final data = decoded['data'];
        final status = data is Map<String, dynamic> ? data['status'] : null;
        final url = data is Map<String, dynamic>
            ? data['video_url'] ?? decoded['video_url']
            : decoded['video_url'];
        if (url is String && url.trim().isNotEmpty) {
          if (status != null && status != 1) {
            log('Fetch stream api returned non-ready status: $status');
          }
          return url.trim();
        }
      }

      log('Fetch stream api failed: invalid payload body=$body');
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
    if (!isPlayerReady.value || isOffline.value) {
      return null;
    }

    final previewContext = webViewCaptureKey.currentContext;
    if (previewContext == null) {
      return null;
    }
    final previewBounds = _resolvePreviewCaptureBounds(previewContext);
    if (previewBounds == null) {
      return null;
    }

    try {
      await Future.delayed(const Duration(milliseconds: 120));
      final screenshotPath = await FlutterNativeScreenshotPlus()
          .takeScreenshot()
          .timeout(const Duration(seconds: 3));
      if (screenshotPath == null || screenshotPath.isEmpty) {
        return null;
      }

      final screenshotFile = File(screenshotPath);
      if (!await screenshotFile.exists()) {
        return null;
      }

      final bytes = await screenshotFile.readAsBytes();
      unawaited(screenshotFile.delete().catchError((_) => screenshotFile));
      return _cropScreenshotToPreview(previewBounds, bytes);
    } catch (error, stackTrace) {
      log('capturePreviewFrame failed: $error', stackTrace: stackTrace);
      return null;
    }
  }

  _PreviewCaptureBounds? _resolvePreviewCaptureBounds(
    BuildContext previewContext,
  ) {
    final renderObject = previewContext.findRenderObject();
    if (renderObject is! RenderBox || !renderObject.hasSize) {
      return null;
    }

    final view = View.of(previewContext);
    final logicalWidth = view.physicalSize.width / view.devicePixelRatio;
    final logicalHeight = view.physicalSize.height / view.devicePixelRatio;
    if (logicalWidth <= 0 || logicalHeight <= 0) {
      return null;
    }

    return _PreviewCaptureBounds(
      topLeft: renderObject.localToGlobal(Offset.zero),
      size: renderObject.size,
      logicalScreenSize: Size(logicalWidth, logicalHeight),
    );
  }

  Uint8List? _cropScreenshotToPreview(
    _PreviewCaptureBounds previewBounds,
    Uint8List screenshotBytes,
  ) {
    final source = img.decodeImage(screenshotBytes);
    if (source == null || source.width <= 0 || source.height <= 0) {
      return null;
    }

    final scaleX = source.width / previewBounds.logicalScreenSize.width;
    final scaleY = source.height / previewBounds.logicalScreenSize.height;

    final x = (previewBounds.topLeft.dx * scaleX).round().clamp(
      0,
      source.width - 1,
    );
    final y = (previewBounds.topLeft.dy * scaleY).round().clamp(
      0,
      source.height - 1,
    );
    final width = (previewBounds.size.width * scaleX).round().clamp(
      1,
      source.width - x,
    );
    final height = (previewBounds.size.height * scaleY).round().clamp(
      1,
      source.height - y,
    );

    final cropped = img.copyCrop(
      source,
      x: x,
      y: y,
      width: width,
      height: height,
    );
    return Uint8List.fromList(img.encodeJpg(cropped, quality: 84));
  }

  Future<void> pausePreview() async {
    final player = videoPlayerController;
    if (player == null) {
      return;
    }

    try {
      if (player.value.isInitialized && player.value.isPlaying) {
        await player.pause();
      }
    } catch (error, stackTrace) {
      log('pausePreview failed: $error', stackTrace: stackTrace);
    }
  }

  Future<void> resumePreview() async {
    final player = videoPlayerController;
    if (player == null) {
      return;
    }

    try {
      if (player.value.isInitialized && !player.value.isPlaying) {
        await player.play();
      }
    } catch (error, stackTrace) {
      log('resumePreview failed: $error', stackTrace: stackTrace);
    }
  }

  Future<void> _disposePlayerControllers() async {
    chewieController?.dispose();
    chewieController = null;

    final player = videoPlayerController;
    videoPlayerController = null;
    if (player != null) {
      await player.dispose();
    }
  }

  @override
  void onClose() {
    unawaited(_disposePlayerControllers());
    super.onClose();
  }
}

class _PreviewCaptureBounds {
  const _PreviewCaptureBounds({
    required this.topLeft,
    required this.size,
    required this.logicalScreenSize,
  });

  final Offset topLeft;
  final Size size;
  final Size logicalScreenSize;
}
