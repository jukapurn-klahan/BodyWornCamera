import 'dart:typed_data';
import 'dart:developer';

import 'package:body_camera/fcm/notification_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/home_page_view.dart';

class HomePageController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final searchText = ''.obs;
  final selectedFilter = CameraFilterType.all.obs;

  final cameras = <CameraItem>[
    CameraItem(index: 0, name: 'Camera 1', location: 'จุดติดตั้ง 1', isOnline: true),
    // CameraItem(index: 1, name: 'Camera 2', location: 'จุดติดตั้ง 2', isOnline: true),
    // CameraItem(index: 2, name: 'Camera 3', location: 'จุดติดตั้ง 3', isOnline: true),
    // CameraItem(index: 3, name: 'Camera 4', location: 'จุดติดตั้ง 4', isOnline: true),
    // CameraItem(index: 4, name: 'Camera 5', location: 'จุดติดตั้ง 5', isOnline: false),
    // CameraItem(index: 5, name: 'Camera 6', location: 'จุดติดตั้ง 6', isOnline: true),
  ].obs;

  /// สมมุติว่าคุณมีของเดิมอยู่แล้ว
  final RxList<Uint8List?> cameraPreviewByIndex = List<Uint8List?>.filled(20, null).obs;

  @override
  Future<void> onReady() async {
    super.onReady();
    await _loadMainPageTokens();
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
        return e.name.toLowerCase().contains(searchText.value) || e.location.toLowerCase().contains(searchText.value);
      });
    }

    return items.toList();
  }

  void openCamera(int index) {
    // เขียน logic เดิมของคุณ
  }

  Future<void> _loadMainPageTokens() async {
    await NotificationServices.instance.initNotifications();

    try {
      await NotificationServices.instance.getCurrentFcmToken();
    } catch (error, stackTrace) {
      log('Failed to load FCM token on main page.', name: 'HomePageController', error: error, stackTrace: stackTrace);
    }

    try {
      await NotificationServices.getAccessToken();
    } catch (error, stackTrace) {
      log('Failed to load access token on main page.', name: 'HomePageController', error: error, stackTrace: stackTrace);
    }
  }
}
