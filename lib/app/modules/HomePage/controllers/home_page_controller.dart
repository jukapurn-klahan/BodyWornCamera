import 'dart:typed_data';

import 'package:body_camera/app/routes/app_pages.dart';
import 'package:body_camera/fcm/notification_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  //TODO: Implement HomePageController
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final count = 0.obs;
  final cameraPreviewByIndex = <int, Uint8List>{}.obs;

  void increment() => count.value++;

  Future<void> openCamera(int cameraIndex) async {
    final result = await Get.toNamed(
      Routes.CAMERA,
      arguments: {'cameraIndex': cameraIndex},
    );

    if (result is! Map) {
      return;
    }

    final resultCameraIndex = result['cameraIndex'];
    final previewBytes = result['previewBytes'];
    if (resultCameraIndex is int &&
        previewBytes is Uint8List &&
        previewBytes.isNotEmpty) {
      cameraPreviewByIndex[resultCameraIndex] = previewBytes;
    }
  }

  Future<void> showTestNotification() async {
    await NotificationServices.instance.showTestNotification(
      title: 'แจ้งเตือนการตรวจจับ',
      body: '',
    );
  }
}
