import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryCameraController extends GetxController with GetTickerProviderStateMixin {
  //TODO: Implement HistoryCameraController
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final count = 0.obs;
  int get tabBarCurrentIndex => tabBarController1 != null ? tabBarController1!.index : 0;
  int get tabBarPreviousIndex => tabBarController1 != null ? tabBarController1!.previousIndex : 0;
  Rx<TextEditingController> textControllerDate = TextEditingController().obs;
  Rx<TextEditingController> textControllerMonth = TextEditingController().obs;
  Rx<TextEditingController> textControllerYear = TextEditingController().obs;

  late TabController tabBarController1;
  late TabController tabBarController2;
  @override
  void onInit() {
    super.onInit();

    tabBarController1 = TabController(vsync: this, length: 2, initialIndex: 0);
    tabBarController2 = TabController(vsync: this, length: 2, initialIndex: 0);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
