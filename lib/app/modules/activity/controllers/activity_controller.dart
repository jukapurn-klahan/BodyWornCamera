import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../flutter_flow/flutter_flow_animations_pin.dart';
import '../../../../widgets/global_widget.dart';

class ActivityController extends GetxController {
  final count = 0.obs;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = <String, AnimationInfo>{};
  final searchQuery = ''.obs;
  final selectedPriority = DropDownPriority.allPriorityFilter.obs;
  final selectedDate = Rxn<DateTime>();

  late final FocusNode textFieldFocusNode;
  late final TextEditingController textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  String get allPriorityFilter => DropDownPriority.allPriorityFilter;

  @override
  void onInit() {
    textFieldFocusNode = FocusNode();
    textController = TextEditingController();
    textController.addListener(_handleSearchChanged);
    super.onInit();
  }

  @override
  void onClose() {
    textController
      ..removeListener(_handleSearchChanged)
      ..dispose();
    textFieldFocusNode.dispose();
    super.onClose();
  }

  void updatePriorityFilter(String? value) {
    selectedPriority.value = value ?? allPriorityFilter;
  }

  void updateDateFilter(DateTime? value) {
    selectedDate.value = value == null ? null : DateTime(value.year, value.month, value.day);
  }

  void clearDateFilter() {
    selectedDate.value = null;
  }

  void _handleSearchChanged() {
    searchQuery.value = textController.text.trim();
  }

  void increment() => count.value++;
}
