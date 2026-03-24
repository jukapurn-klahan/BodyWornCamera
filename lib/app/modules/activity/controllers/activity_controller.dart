import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../flutter_flow/flutter_flow_animations_pin.dart';

class ActivityController extends GetxController {
  //TODO: Implement ActivityController

  final count = 0.obs;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void onInit() {
    super.onInit();
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
