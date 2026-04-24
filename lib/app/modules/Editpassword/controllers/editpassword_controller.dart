import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../widgets/popup_showdialog.dart';
import '../../../services/user_api_service.dart';
import '../../../../utils/config.dart';
import '../../../../utils/storage_utils.dart';

class EditpasswordController extends GetxController {
  EditpasswordController({UserApiService? userApiService}) : _userApiService = userApiService ?? UserApiService();

  final UserApiService _userApiService;
  final formKey = GlobalKey<FormState>();
  final currentPasswordFieldKey = GlobalKey<FormFieldState<String>>();
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
  final isSubmittingChangePassword = false.obs;
  final currentPasswordErrorText = ''.obs;
  final canValidateCurrentPassword = false.obs;
  final isCurrentPasswordVerified = false.obs;

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

    final rememberedPassword = await StorageUtils.getRememberedPassword() ?? '';
    final rememberedUsername = (await StorageUtils.getRememberedUsername())?.trim() ?? '';
    final currentUsername = username.value.trim();
    final isSameRememberedUser = rememberedUsername.isEmpty || currentUsername.isEmpty || rememberedUsername == currentUsername;

    if (rememberedPassword.isNotEmpty && isSameRememberedUser) {
      _storedCurrentPassword = rememberedPassword;
      canValidateCurrentPassword.value = true;
      _handleCurrentPasswordChanged();
      return;
    }

    _storedCurrentPassword = '';
    canValidateCurrentPassword.value = false;
    _handleCurrentPasswordChanged();
  }

  void _onCurrentPasswordChanged() {
    _handleCurrentPasswordChanged();
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

  bool get hasMinLength => newPassword.value.length >= 8;

  bool get hasUppercase => RegExp(r'[A-Z]').hasMatch(newPassword.value);

  bool get hasLowercase => RegExp(r'[a-z]').hasMatch(newPassword.value);

  bool get hasDigit => RegExp(r'\d').hasMatch(newPassword.value);

  bool get hasSpecialCharacter => RegExp(r'[!@#\$&*]').hasMatch(newPassword.value);

  bool get isPasswordCompliant => hasMinLength && hasUppercase && hasLowercase && hasDigit && hasSpecialCharacter;

  bool get isCurrentPasswordAccepted {
    return currentPassword.value.isNotEmpty &&
        currentPasswordErrorText.value.isEmpty &&
        _canValidateCurrentPasswordLocally &&
        isCurrentPasswordVerified.value;
  }

  bool get isNewPasswordDifferentFromCurrent => newPassword.value.isNotEmpty && newPassword.value != currentPassword.value;

  bool get passwordsMatch => newPassword.value.isNotEmpty && confirmPassword.value.isNotEmpty && newPassword.value == confirmPassword.value;

  bool get canSubmit =>
      currentPassword.value.isNotEmpty &&
      newPassword.value.isNotEmpty &&
      confirmPassword.value.isNotEmpty &&
      !isSubmittingChangePassword.value &&
      isCurrentPasswordAccepted &&
      isPasswordCompliant &&
      isNewPasswordDifferentFromCurrent &&
      passwordsMatch;

  String get currentPasswordMessage {
    if (currentPassword.value.isEmpty) {
      return 'กรอกรหัสผ่านปัจจุบันเพื่อยืนยันก่อนตั้งรหัสผ่านใหม่';
    }

    return _canValidateCurrentPasswordLocally
        ? 'ระบบจะตรวจสอบรหัสผ่านปัจจุบันจาก remembered password'
        : 'ไม่พบ remembered password สำหรับตรวจสอบรหัสผ่านปัจจุบัน';
  }

  String? validateCurrentPassword(String? value) {
    if ((value ?? '').isEmpty) {
      return 'กรุณากรอกรหัสผ่านปัจจุบัน';
    }

    if (currentPasswordErrorText.value.isNotEmpty) {
      return currentPasswordErrorText.value;
    }

    if (!_canValidateCurrentPasswordLocally) {
      return 'ไม่พบ remembered password สำหรับตรวจสอบรหัสผ่านปัจจุบัน';
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

  Future<void> submit(BuildContext context) async {
    if (isSubmittingChangePassword.value) {
      return;
    }

    Get.focusScope?.unfocus();
    unfocusNode.unfocus();

    final isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }

    if (!isCurrentPasswordAccepted) {
      currentPasswordErrorText.value = _canValidateCurrentPasswordLocally
          ? 'รหัสผ่านปัจจุบันไม่ถูกต้อง กรุณาลองใหม่'
          : 'ไม่พบ remembered password สำหรับตรวจสอบรหัสผ่านปัจจุบัน';
      _validateCurrentPasswordField(force: true);
      return;
    }

    try {
      isSubmittingChangePassword.value = true;
      await _userApiService.changePassword(oldPassword: currentPassword.value, newPassword: newPassword.value);
      await _syncRememberedPasswordAfterSuccess();

      isSubmittingChangePassword.value = false;
      if (!context.mounted) {
        return;
      }
      PopupDialogShow.showSuccessDialog(context);
      await Future.delayed(const Duration(milliseconds: 2000));

      Get.back();
      Get.back(result: true);
    } on UserApiException catch (error) {
      if (_isCurrentPasswordRejected(error)) {
        currentPasswordErrorText.value = 'รหัสผ่านปัจจุบันไม่ถูกต้อง กรุณาลองใหม่';
        formKey.currentState?.validate();
        return;
      }

      if (!context.mounted) {
        return;
      }
      PopupDialogShow.showErrorDialog(context, 'Error', 'ไม่สามารถบันทึกข้อมูลได้');
    } catch (_) {
      if (!context.mounted) {
        return;
      }
      PopupDialogShow.showErrorDialog(context, 'Error', 'ไม่สามารถเชื่อมต่อเซิร์ฟเวอร์ได้ กรุณาลองใหม่อีกครั้ง');
    } finally {
      if (isSubmittingChangePassword.value) {
        isSubmittingChangePassword.value = false;
      }
    }
  }

  Future<void> _syncRememberedPasswordAfterSuccess() async {
    final rememberEnabled = await StorageUtils.isRememberLoginEnabled();
    if (!rememberEnabled) {
      return;
    }

    final rememberedUsername = (await StorageUtils.getRememberedUsername())?.trim() ?? '';
    final currentUsername = username.value.trim();
    if (rememberedUsername.isNotEmpty && currentUsername.isNotEmpty && rememberedUsername != currentUsername) {
      return;
    }

    await StorageUtils.setRememberedPassword(newPassword.value);
  }

  void _handleCurrentPasswordChanged() {
    final value = currentPasswordController.text;
    currentPassword.value = value;
    isCurrentPasswordVerified.value = false;

    currentPasswordErrorText.value = '';

    if (value.isEmpty) {
      _validateCurrentPasswordField();
      return;
    }

    if (!_canValidateCurrentPasswordLocally) {
      currentPasswordErrorText.value = 'ไม่พบ remembered password สำหรับตรวจสอบรหัสผ่านปัจจุบัน';
      _validateCurrentPasswordField();
      return;
    }

    if (!_isCurrentPasswordPotentialLocalMatch(value)) {
      currentPasswordErrorText.value = 'รหัสผ่านปัจจุบันไม่ถูกต้อง กรุณาลองใหม่';
      _validateCurrentPasswordField();
      return;
    }

    if (value != _storedCurrentPassword) {
      _validateCurrentPasswordField();
      return;
    }

    isCurrentPasswordVerified.value = true;
    _validateCurrentPasswordField();
  }

  void _validateCurrentPasswordField({bool force = false}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final fieldState = currentPasswordFieldKey.currentState;
      if (fieldState == null || (!force && !fieldState.hasInteractedByUser)) {
        return;
      }

      fieldState.validate();
    });
  }

  bool get _canValidateCurrentPasswordLocally {
    return canValidateCurrentPassword.value && _storedCurrentPassword.isNotEmpty;
  }

  bool _isCurrentPasswordPotentialLocalMatch(String value) {
    if (!_canValidateCurrentPasswordLocally) {
      return true;
    }

    return _storedCurrentPassword.startsWith(value);
  }

  bool _isCurrentPasswordRejected(UserApiException error) {
    final statusCode = error.statusCode;
    final message = error.message.toLowerCase();
    final messageIndicatesCurrentPassword =
        message.contains('oldpassword') ||
        message.contains('old password') ||
        message.contains('current password') ||
        message.contains('incorrect password') ||
        message.contains('invalid password') ||
        message.contains('wrong password') ||
        message.contains('รหัสผ่านปัจจุบัน') ||
        message.contains('รหัสผ่านเดิม') ||
        message.contains('รหัสผ่านไม่ถูกต้อง');

    return messageIndicatesCurrentPassword || statusCode == 400 || statusCode == 401 || statusCode == 403;
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
    _userApiService.dispose();
    super.onClose();
  }
}
