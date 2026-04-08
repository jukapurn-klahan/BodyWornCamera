import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotiListController extends GetxController
    with GetTickerProviderStateMixin {
  //TODO: Implement NotiListController
  static const List<String> tabLabels = <String>[
    'ทั้งหมด',
    'กิจกรรม/ภารกิจ',
    'Detect Camera',
  ];

  final scaffoldKey = GlobalKey<ScaffoldState>();
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    tabBarController = TabController(
      vsync: this,
      length: tabLabels.length,
      initialIndex: 0,
    );
  }

  @override
  void onClose() {
    tabBarController?.dispose();
    super.onClose();
  }

  void increment() => count.value++;
}
