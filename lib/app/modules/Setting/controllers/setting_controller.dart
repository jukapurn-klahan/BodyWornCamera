import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  //TODO: Implement MeController
  final scaffoldKey = GlobalKey<ScaffoldState>();
  RxBool switchValue1 = true.obs;
  RxBool switchValue2 = true.obs;
  RxBool switchValue3 = true.obs;
  RxBool switchValue4 = true.obs;
  RxBool switchValue5 = true.obs;
  RxString StaffName = ''.obs;
  final count = 0.obs;
  final visit_status = false.obs;
  final authencode_status = false.obs;
  final speech_text = false.obs;

  @override
  void onInit() {
    super.onInit();
    // switchValue1.value = true;
    // switchValue2.value = true;
    // switchValue3.value = true;
    // switchValue4.value = true;
    StaffName.value = 'นายทดสอบ ระบบ';
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    // visit_status.value = await CvFunction().prefread('visit_status', bool) ?? true;
    // authencode_status.value = await CvFunction().prefread('authencode_status', bool) ?? true;
    // speech_text.value = await CvFunction().prefread('speech_text', bool) ?? true;
    // switchValue2.value = authencode_status.value;
    // switchValue4.value = visit_status.value;
    // log('speech_text.value : ${speech_text.value}');

    switchValue5.value = speech_text.value;
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
