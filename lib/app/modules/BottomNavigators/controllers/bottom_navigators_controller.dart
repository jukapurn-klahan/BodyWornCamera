import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigatorsController extends GetxController {
  final navBottomSelectedIndex = 0.obs;
  //TODO: Implement BottomNavigatorsController
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final pageContontroller = PageController(initialPage: 0, keepPage: true).obs;

  final count = 0.obs;
  final house_id = 0.obs;
  @override
  void onInit() {
    super.onInit();



   // DosaveData();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    //await AtlasAIGetxcontroller().sendLoginSuccessEvent();
  }



  @override
  void onClose() {
    pageContontroller.value.dispose();
    super.onClose();
  }

  void navigationBottomTapped(int index) {
    navBottomSelectedIndex.value = index;
    pageContontroller.value.jumpToPage(index);
  }
}
