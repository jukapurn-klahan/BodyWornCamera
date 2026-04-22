import 'dart:typed_data';
import 'dart:developer';

import 'package:body_camera/app/routes/app_pages.dart';
import 'package:body_camera/app/services/user_api_service.dart';
import 'package:body_camera/fcm/notification_services.dart';
import 'package:body_camera/utils/app_session_utils.dart';
import 'package:body_camera/utils/config.dart';
import 'package:body_camera/utils/storage_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/home_page_view.dart';

class HomePageController extends GetxController {
  HomePageController({UserApiService? userApiService})
    : _userApiService = userApiService ?? UserApiService();

  final UserApiService _userApiService;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final searchText = ''.obs;
  final selectedFilter = CameraFilterType.all.obs;
  final usernameValue = ''.obs;
  final roleName = ''.obs;
  final isLoadingCameras = true.obs;

  final cameras = <CameraItem>[
    CameraItem(
      index: 0,
      name: 'Camera 1',
      location: 'จุดติดตั้ง 1',
      isOnline: true,
      deviceCode: '1000093',
    ),
    // CameraItem(index: 1, name: 'Camera 2', location: 'จุดติดตั้ง 2', isOnline: true, deviceCode: '1000094'),
    // CameraItem(index: 2, name: 'Camera 3', location: 'จุดติดตั้ง 3', isOnline: true, deviceCode: '1000095'),
    // CameraItem(index: 3, name: 'Camera 4', location: 'จุดติดตั้ง 4', isOnline: true, deviceCode: '1000096'),
    // CameraItem(index: 4, name: 'Camera 5', location: 'จุดติดตั้ง 5', isOnline: false, deviceCode: '1000097'),
    // CameraItem(index: 5, name: 'Camera 6', location: 'จุดติดตั้ง 6', isOnline: true, deviceCode: '1000098'),
  ].obs;

  /// สมมุติว่าคุณมีของเดิมอยู่แล้ว
  final RxList<Uint8List?> cameraPreviewByIndex = List<Uint8List?>.filled(
    20,
    null,
  ).obs;

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      await _loadMainPageTokens();
      await _loadProfileData();
    } finally {
     isLoadingCameras.value = false;
    }
  }

  void changeFilter(CameraFilterType type) {
    selectedFilter.value = type;
  }

  void onSearchChanged(String value) {
    searchText.value = value.trim().toLowerCase();
  }

  List<CameraItem> get filteredCameras {
    Iterable<CameraItem> items = cameras;

    if (selectedFilter.value == CameraFilterType.online) {
      items = items.where((e) => e.isOnline);
    } else if (selectedFilter.value == CameraFilterType.offline) {
      items = items.where((e) => !e.isOnline);
    }

    if (searchText.value.isNotEmpty) {
      items = items.where((e) {
        return e.name.toLowerCase().contains(searchText.value) ||
            e.location.toLowerCase().contains(searchText.value);
      });
    }

    return items.toList();
  }

  Future<void> openCamera(CameraItem camera) async {
    final result = await Get.toNamed(
      Routes.CAMERA,
      arguments: {
        'cameraIndex': camera.index,
        'cameraTitle': camera.name,
        'deviceCode': camera.deviceCode,
      },
    );

    if (result is! Map) {
      return;
    }

    final cameraIndex = result['cameraIndex'];
    final previewBytes = result['previewBytes'];
    if (cameraIndex is! int ||
        cameraIndex < 0 ||
        cameraIndex >= cameraPreviewByIndex.length) {
      return;
    }

    cameraPreviewByIndex[cameraIndex] = previewBytes is Uint8List
        ? previewBytes
        : null;
  }

  Future<void> _loadMainPageTokens() async {
    await NotificationServices.instance.initNotifications();
    if (!NotificationServices.supportsRemoteMessaging) {
      return;
    }

    try {
      await NotificationServices.instance.getCurrentFcmToken();
    } catch (error, stackTrace) {
      log(
        'Failed to load FCM token on main page.',
        name: 'HomePageController',
        error: error,
        stackTrace: stackTrace,
      );
    }

    try {
      await AppSessionUtils.getValidAccessToken();
    } catch (error, stackTrace) {
      log(
        'Failed to prepare app access token on main page.',
        name: 'HomePageController',
        error: error,
        stackTrace: stackTrace,
      );
    }

    try {
      await NotificationServices.getAccessToken();
    } catch (error, stackTrace) {
      log(
        'Failed to load access token on main page.',
        name: 'HomePageController',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> _loadProfileData() async {
    final storedUsername = await GetData.getUsernameValue();
    final storedRoleId = await GetData.getRoleIdValue();

    usernameValue.value = storedUsername;

    if (storedRoleId <= 0) {
      roleName.value = '';
      return;
    }

    var resolvedRole = await StorageUtils.getRoleMasterDataById(storedRoleId);
    if (resolvedRole == null) {
      try {
        final roles = await _userApiService.getRoles();
        await StorageUtils.saveRoleMasterData(roles);
        for (final role in roles) {
          if (role.roleId == storedRoleId) {
            resolvedRole = role;
            break;
          }
        }
      } catch (_) {
        // Keep the home page usable even if role master data cannot be refreshed.
      }
    }

    roleName.value = resolvedRole?.roleName.trim() ?? '';
  }

  @override
  void onClose() {
    _userApiService.dispose();
    super.onClose();
  }
}
