import 'package:body_camera/flutter_flow/flutter_flow_animations.dart';
import 'package:body_camera/app/routes/app_pages.dart';
import 'package:body_camera/app/services/user_api_service.dart';
import 'package:body_camera/utils/config.dart';
import 'package:body_camera/utils/cv_function.dart';
import 'package:body_camera/utils/storage_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  LoginController({UserApiService? userApiService})
    : _userApiService = userApiService ?? UserApiService();

  final UserApiService _userApiService;
  final animationsMap = <String, AnimationInfo>{};
  RxBool obscurePassword = true.obs;
  RxBool canSubmitLogin = false.obs;
  RxBool isSubmittingLogin = false.obs;
  RxBool rememberPassword = false.obs;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final unfocusNode = FocusNode();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  String? Function(BuildContext, String?)? passwordControllerValidator;

  @override
  void onInit() {
    super.onInit();
    usernameController.addListener(_updateCanSubmitLogin);
    passwordController.addListener(_updateCanSubmitLogin);
    _updateCanSubmitLogin();
    _loadRememberedLogin();

    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effects: [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.ms,
            duration: 1000.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.ms,
            duration: 1000.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 100.ms,
            duration: 1000.ms,
            begin: Offset(-0.000, 0),
            end: Offset(0, 0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effects: [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.ms,
            duration: 400.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.ms,
            duration: 400.ms,
            begin: Offset(60.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 200.ms,
            duration: 400.ms,
            begin: Offset(-0.349, 0),
            end: Offset(0, 0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effects: [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.ms,
            duration: 400.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.ms,
            duration: 400.ms,
            begin: Offset(60.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 200.ms,
            duration: 400.ms,
            begin: Offset(-0.349, 0),
            end: Offset(0, 0),
          ),
        ],
      ),
    });
  }

  void togglePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  Future<void> toggleRememberPassword() async {
    if (!canSubmitLogin.value) {
      return;
    }

    final newValue = !rememberPassword.value;
    rememberPassword.value = newValue;

    if (!newValue) {
      await StorageUtils.clearRememberedLogin();
    }
  }

  void _updateCanSubmitLogin() {
    canSubmitLogin.value =
        usernameController.text.trim().isNotEmpty &&
        passwordController.text.isNotEmpty;
  }

  Future<void> login() async {
    if (isSubmittingLogin.value) {
      return;
    }

    Get.focusScope?.unfocus();
    unfocusNode.unfocus();
    final username = usernameController.text.trim();
    final password = passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      Get.snackbar(
        'แจ้งเตือน',
        'กรุณากรอกชื่อผู้ใช้งานและรหัสผ่าน',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    try {
      isSubmittingLogin.value = true;
      final deviceId = await _resolveDeviceId();
      final loginResponse = await _userApiService.login(
        username: username,
        password: password,
        deviceId: deviceId,
      );
      final shouldForceNewPin = await _shouldForceNewPinSetup(
        loginResponse.userInfo.username,
      );
      debugPrint(
        'Login success: ${loginResponse.userInfo.username} (${loginResponse.userInfo.userId})',
      );
      debugPrint(
        'Decoded accessToken timing: iat=${loginResponse.iat}, exp=${loginResponse.exp}',
      );
      if (rememberPassword.value) {
        await StorageUtils.saveRememberedLogin(
          username: username,
          password: password,
        );
      } else {
        await StorageUtils.clearRememberedLogin();
      }
      await GetData.saveAuthenticatedSession(
        accessTokenValue: loginResponse.accessToken,
        refreshTokenValue: loginResponse.refreshToken,
        user: loginResponse.userInfo,
      );
      if (shouldForceNewPin) {
        await StorageUtils.clearPinCode();
      } else {
        await StorageUtils.setPinCodeOwnerUsername(
          loginResponse.userInfo.username,
        );
      }
      await _loadRoleMasterData();
      Get.offAllNamed(
        Routes.PINCODE,
        arguments: {
          'allowBiometric': false,
          if (shouldForceNewPin) 'isNewPassword': true,
        },
      );
    } on UserApiException catch (error) {
      Get.snackbar(
        'เข้าสู่ระบบไม่สำเร็จ',
        error.message,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (_) {
      Get.snackbar(
        'เชื่อมต่อไม่สำเร็จ',
        'ไม่สามารถเชื่อมต่อเซิร์ฟเวอร์ได้',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isSubmittingLogin.value = false;
    }
  }

  Future<String> _resolveDeviceId() async {
    try {
      return await cv_func.getDeviceId();
    } catch (error) {
      debugPrint('Failed to resolve device id: $error');
      return '';
    }
  }

  Future<void> _loadRoleMasterData() async {
    try {
      final roles = await _userApiService.getRoles();

      await StorageUtils.saveRoleMasterData(roles);
      debugPrint('Loaded role master data: ${roles.length} items');
    } catch (error) {
      debugPrint('Failed to load role master data: $error');
    }
  }

  Future<void> _loadRememberedLogin() async {
    final shouldRemember = await StorageUtils.isRememberLoginEnabled();
    final rememberedUsername = await StorageUtils.getRememberedUsername() ?? '';
    final rememberedPassword = await StorageUtils.getRememberedPassword() ?? '';
    final preservedUsername = await GetData.getUsernameValue();
    final resolvedUsername = rememberedUsername.isNotEmpty
        ? rememberedUsername
        : preservedUsername;

    if (resolvedUsername.isNotEmpty) {
      usernameController.text = resolvedUsername;
    }
    if (shouldRemember) {
      rememberPassword.value = true;
      passwordController.text = rememberedPassword;
    }
    _updateCanSubmitLogin();
  }

  Future<bool> _shouldForceNewPinSetup(String nextUsername) async {
    final normalizedNextUsername = nextUsername.trim();
    if (normalizedNextUsername.isEmpty) {
      return false;
    }

    final hasPinCode = await StorageUtils.hasPinCode();
    if (!hasPinCode) {
      return false;
    }

    final pinCodeOwnerUsername =
        await StorageUtils.getPinCodeOwnerUsername() ??
        (await GetData.getUsernameValue()).trim();

    if (pinCodeOwnerUsername.isEmpty) {
      return false;
    }

    return pinCodeOwnerUsername != normalizedNextUsername;
  }

  @override
  void onClose() {
    usernameController.removeListener(_updateCanSubmitLogin);
    passwordController.removeListener(_updateCanSubmitLogin);
    usernameController.dispose();
    passwordController.dispose();
    unfocusNode.dispose();
    _userApiService.dispose();
    super.onClose();
  }
}
