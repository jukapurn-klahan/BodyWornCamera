import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../utils/config.dart';
import '../../../../utils/storage_utils.dart';

class EditpasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final unfocusNode = FocusNode();

  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final username = ''.obs;
  final currentPassword = ''.obs;
  final newPassword = ''.obs;
  final confirmPassword = ''.obs;

  final obscureCurrentPassword = true.obs;
  final obscureNewPassword = true.obs;
  final obscureConfirmPassword = true.obs;
  final canValidateCurrentPassword = false.obs;

  String _storedCurrentPassword = '';

  @override
  void onInit() {
    super.onInit();
    currentPasswordController.addListener(_onCurrentPasswordChanged);
    newPasswordController.addListener(_onNewPasswordChanged);
    confirmPasswordController.addListener(_onConfirmPasswordChanged);
    _loadSessionContext();
  }

  Future<void> _loadSessionContext() async {
    username.value = await GetData.getUsernameValue();

    final rememberEnabled = await StorageUtils.isRememberLoginEnabled();
    final rememberedPassword = await StorageUtils.getRememberedPassword() ?? '';

    if (rememberEnabled && rememberedPassword.isNotEmpty) {
      _storedCurrentPassword = rememberedPassword;
      canValidateCurrentPassword.value = true;
    }
  }

  void _onCurrentPasswordChanged() {
    currentPassword.value = currentPasswordController.text;
  }

  void _onNewPasswordChanged() {
    newPassword.value = newPasswordController.text;
  }

  void _onConfirmPasswordChanged() {
    confirmPassword.value = confirmPasswordController.text;
  }

  void toggleCurrentPasswordVisibility() {
    obscureCurrentPassword.value = !obscureCurrentPassword.value;
  }

  void toggleNewPasswordVisibility() {
    obscureNewPassword.value = !obscureNewPassword.value;
  }

  void toggleConfirmPasswordVisibility() {
    obscureConfirmPassword.value = !obscureConfirmPassword.value;
  }

  bool get hasMinLength => newPassword.value.length >= 6;

  bool get hasUppercase => RegExp(r'[A-Z]').hasMatch(newPassword.value);

  bool get hasLowercase => RegExp(r'[a-z]').hasMatch(newPassword.value);

  bool get hasDigit => RegExp(r'\d').hasMatch(newPassword.value);

  bool get hasSpecialCharacter =>
      RegExp(r'[!@#\$&*]').hasMatch(newPassword.value);

  bool get isPasswordCompliant =>
      hasMinLength &&
      hasUppercase &&
      hasLowercase &&
      hasDigit &&
      hasSpecialCharacter;

  bool get isCurrentPasswordAccepted {
    if (currentPassword.value.isEmpty) {
      return false;
    }

    if (!canValidateCurrentPassword.value) {
      return true;
    }

    return currentPassword.value == _storedCurrentPassword;
  }

  bool get isNewPasswordDifferentFromCurrent =>
      newPassword.value.isNotEmpty &&
      newPassword.value != currentPassword.value;

  bool get passwordsMatch =>
      newPassword.value.isNotEmpty &&
      confirmPassword.value.isNotEmpty &&
      newPassword.value == confirmPassword.value;

  bool get canSubmit =>
      currentPassword.value.isNotEmpty &&
      newPassword.value.isNotEmpty &&
      confirmPassword.value.isNotEmpty &&
      isCurrentPasswordAccepted &&
      isPasswordCompliant &&
      isNewPasswordDifferentFromCurrent &&
      passwordsMatch;

  String get currentPasswordMessage {
    if (currentPassword.value.isEmpty) {
      return canValidateCurrentPassword.value
          ? 'กรอกรหัสผ่านปัจจุบันเพื่อยืนยันก่อนตั้งรหัสผ่านใหม่'
          : 'ไม่พบรหัสผ่านที่บันทึกไว้ในเครื่อง จึงตรวจสอบได้เฉพาะความครบถ้วนของข้อมูล';
    }

    if (!canValidateCurrentPassword.value) {
      return 'ระบบยังไม่สามารถเทียบรหัสผ่านปัจจุบันกับข้อมูลในเครื่องได้';
    }

    return isCurrentPasswordAccepted
        ? 'รหัสผ่านปัจจุบันตรงกับข้อมูลที่บันทึกไว้ในเครื่อง'
        : 'รหัสผ่านปัจจุบันไม่ตรงกับข้อมูลที่บันทึกไว้ในเครื่อง';
  }

  String? validateCurrentPassword(String? value) {
    if ((value ?? '').isEmpty) {
      return 'กรุณากรอกรหัสผ่านปัจจุบัน';
    }

    if (canValidateCurrentPassword.value && !isCurrentPasswordAccepted) {
      return 'รหัสผ่านปัจจุบันไม่ถูกต้อง';
    }

    return null;
  }

  String? validateNewPassword(String? value) {
    if ((value ?? '').isEmpty) {
      return 'กรุณากรอกรหัสผ่านใหม่';
    }

    if (!isPasswordCompliant) {
      return 'รหัสผ่านใหม่ยังไม่ผ่านเงื่อนไขความปลอดภัย';
    }

    if (!isNewPasswordDifferentFromCurrent) {
      return 'รหัสผ่านใหม่ต้องไม่ซ้ำกับรหัสผ่านปัจจุบัน';
    }

    return null;
  }

  String? validateConfirmPassword(String? value) {
    if ((value ?? '').isEmpty) {
      return 'กรุณายืนยันรหัสผ่านใหม่';
    }

    if (!passwordsMatch) {
      return 'รหัสผ่านใหม่และการยืนยันรหัสผ่านไม่ตรงกัน';
    }

    return null;
  }

  Future<void> submit() async {
    Get.focusScope?.unfocus();
    unfocusNode.unfocus();

    final isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) {
      Get.snackbar(
        'ข้อมูลไม่ครบถ้วน',
        'กรุณาตรวจสอบรหัสผ่านอีกครั้ง',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // TODO: Wire this form to the backend password update endpoint when available.
    Get.snackbar(
      'ตรวจสอบข้อมูลเรียบร้อย',
      'ฟอร์มพร้อมใช้งานแล้ว แต่โปรเจกต์นี้ยังไม่พบ API สำหรับเปลี่ยนรหัสผ่าน',
      backgroundColor: Colors.orangeAccent,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  @override
  void onClose() {
    currentPasswordController.removeListener(_onCurrentPasswordChanged);
    newPasswordController.removeListener(_onNewPasswordChanged);
    confirmPasswordController.removeListener(_onConfirmPasswordChanged);

    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    unfocusNode.dispose();
    super.onClose();
  }
}
