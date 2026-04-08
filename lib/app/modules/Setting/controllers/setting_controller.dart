import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_session_utils.dart';
import '../../../../utils/storage_utils.dart';
import '../../../routes/app_pages.dart';

class SettingController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  RxBool switchValue1 = true.obs;
  RxBool switchValue2 = false.obs;
  RxBool switchValue3 = true.obs;
  RxBool switchValue4 = true.obs;
  RxBool switchValue5 = true.obs;
  RxBool isUpdatingBiometricToggle = false.obs;
  RxString staffName = ''.obs;
  final count = 0.obs;
  final visitStatus = false.obs;
  final authencodeStatus = false.obs;
  final speechText = false.obs;
  final isLoggingOut = false.obs;

  @override
  void onInit() {
    super.onInit();
    // switchValue1.value = true;
    // switchValue2.value = true;
    // switchValue3.value = true;
    // switchValue4.value = true;
    staffName.value = 'นายทดสอบ ระบบ';
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    // visitStatus.value = await CvFunction().prefread('visit_status', bool) ?? true;
    // authencodeStatus.value = await CvFunction().prefread('authencode_status', bool) ?? true;
    // speechText.value = await CvFunction().prefread('speech_text', bool) ?? true;
    switchValue2.value = await StorageUtils.isBiometricEnabled();
    // switchValue4.value = visitStatus.value;
    // log('speechText.value : ${speechText.value}');

    switchValue5.value = speechText.value;
  }

  Future<void> onBiometricToggleChanged(bool newValue) async {
    if (isUpdatingBiometricToggle.value) {
      return;
    }

    isUpdatingBiometricToggle.value = true;
    try {
      final result = await Get.toNamed(
        Routes.PINCODE,
        arguments: {
          'isNewPassword': false,
          'isOpenProfile': true,
          'allowBiometric': false,
        },
      );
      final isConfirmed = result == true;
      if (!isConfirmed) {
        return;
      }

      switchValue2.value = newValue;
      await StorageUtils.setBiometricEnabled(newValue);
    } finally {
      isUpdatingBiometricToggle.value = false;
    }
  }

  Future<void> logout() async {
    if (isLoggingOut.value) {
      return;
    }

    try {
      isLoggingOut.value = true;
      await AppSessionUtils.clearForLogout();
      await Get.offAllNamed(Routes.LOGIN);
    } catch (_) {
      Get.snackbar(
        'ออกจากระบบไม่สำเร็จ',
        'ไม่สามารถล้างข้อมูลผู้ใช้งานได้ กรุณาลองใหม่อีกครั้ง',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoggingOut.value = false;
    }
  }

  void increment() => count.value++;
}
