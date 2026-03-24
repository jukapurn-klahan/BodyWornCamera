import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotiListController extends GetxController with GetTickerProviderStateMixin {
  //TODO: Implement NotiListController
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TabController? tabBarController;
  int get tabBarCurrentIndex => tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex => tabBarController != null ? tabBarController!.previousIndex : 0;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    tabBarController = TabController(vsync: this, length: 3, initialIndex: 0);
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
