import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:local_auth/local_auth.dart';

import 'package:body_camera/utils/storage_utils.dart';
import '../../../../flutter_flow/flutter_flow_animations_pin.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class PinCodeController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = <String, AnimationInfo>{};
  final LocalAuthentication _localAuth = LocalAuthentication();
  Worker? _biometricAvailabilityWorker;
  bool _hasAutoTriggeredBiometric = false;
  bool _hasExplicitAllowBiometricArgument = false;
  String? _savedPinCode;
  Rx<String> createPin = ''.obs;
  Rx<bool> pinMatch = true.obs;
  Rx<int> wrongInputCount = 0.obs;
  RxBool isBiometricAvailable = false.obs;
  RxBool isFaceIdAvailable = false.obs;
  RxBool isAuthenticatingBiometric = false.obs;
  RxBool isPinStateReady = false.obs;
  RxBool hasSavedPinCode = false.obs;
  RxBool allowBiometricOnEntry = true.obs;
  RxBool requireCurrentPinBeforeReset = false.obs;

  Rx<TextEditingController> pinCodeController = TextEditingController().obs;
  Rx<FocusNode> pinCodeFocusNode = FocusNode().obs;
  Rx<String?> Function(BuildContext, String?)? pinCodeControllerValidator;
  RxBool isNewPassword = false.obs;
  RxBool isOpenProfile = false.obs;

  void setNewPassword(bool value) {
    isNewPassword.value = value;
    wrongInputCount.value = 0;
  }

  void setOpenProfile(bool value) {
    isOpenProfile.value = value;
  }

  void setRequireCurrentPinBeforeReset(bool value) {
    requireCurrentPinBeforeReset.value = value;
    if (value) {
      isNewPassword.value = false;
      createPin.value = '';
      pinMatch.value = true;
      wrongInputCount.value = 0;
    }
  }

  bool get isConfirmingCurrentPinBeforeReset =>
      requireCurrentPinBeforeReset.value && !isNewPassword.value;

  @override
  void onInit() {
    super.onInit();

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 1400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 1400.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 900.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 900.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
    });
    _initializePinFlow();
  }

  @override
  void onClose() {
    _biometricAvailabilityWorker?.dispose();
    pinCodeController.value.dispose();
    pinCodeFocusNode.value.dispose();
    super.onClose();
  }

  Future<void> savePinCode(String pin) async {
    await StorageUtils.setPinCode(pin);
    _savedPinCode = pin;
    hasSavedPinCode.value = true;
  }

  String get titleText {
    if (!isPinStateReady.value) {
      return 'กำลังเตรียม PIN';
    }
    if (isConfirmingCurrentPinBeforeReset) {
      return 'ยืนยันรหัส PIN เดิม';
    }
    if (isNewPassword.value) {
      return createPin.value.isEmpty
          ? 'กรุณากำหนด PIN ของคุณ'
          : 'ยืนยัน PIN ของคุณอีกครั้ง';
    }
    return 'ใส่รหัส PIN เพื่อดำเนินการต่อ';
  }

  String get helperText {
    if (!isPinStateReady.value) {
      return 'กรุณารอสักครู่';
    }
    if (!pinMatch.value) {
      if (isConfirmingCurrentPinBeforeReset) {
        return 'รหัส PIN เดิมไม่ถูกต้อง กรุณาลองใหม่';
      }
      return isNewPassword.value
          ? 'รหัส PIN ไม่ตรงกัน กรุณากำหนดใหม่อีกครั้ง'
          : 'รหัส PIN ไม่ถูกต้อง กรุณาลองใหม่';
    }
    if (isConfirmingCurrentPinBeforeReset) {
      return 'กรอกรหัส PIN ปัจจุบันก่อนตั้งรหัสใหม่';
    }
    if (isNewPassword.value) {
      return createPin.value.isEmpty
          ? 'รหัสนี้จะถูกเก็บไว้ในเครื่องสำหรับการเข้าใช้งานครั้งถัดไป'
          : 'กรอกรหัส PIN เดิมอีกครั้งเพื่อยืนยัน';
    }
    return '';
  }

  bool get showErrorState => !pinMatch.value;
  bool get canUseBiometricAuth =>
      isPinStateReady.value &&
      hasSavedPinCode.value &&
      allowBiometricOnEntry.value &&
      !isNewPassword.value &&
      isBiometricAvailable.value;

  Future<void> _initializePinFlow() async {
    _applyArguments();
    if (!_hasExplicitAllowBiometricArgument) {
      allowBiometricOnEntry.value = await StorageUtils.isBiometricEnabled();
    }
    _savedPinCode = await StorageUtils.getPinCode();
    hasSavedPinCode.value = _savedPinCode != null && _savedPinCode!.isNotEmpty;

    if (!hasSavedPinCode.value) {
      requireCurrentPinBeforeReset.value = false;
      isNewPassword.value = true;
    }

    await _loadBiometricAvailability();
    _biometricAvailabilityWorker = ever<bool>(
      isBiometricAvailable,
      (_) => _tryAutoAuthenticateBiometric(),
    );
    isPinStateReady.value = true;
    _tryAutoAuthenticateBiometric();
  }

  void _applyArguments() {
    final data = Get.arguments;
    if (data is Map) {
      final isNewPasswordArg = data['isNewPassword'];
      final isOpenProfileArg = data['isOpenProfile'];
      final allowBiometricArg = data['allowBiometric'];
      final requireCurrentPinBeforeResetArg =
          data['requireCurrentPinBeforeReset'];

      if (isNewPasswordArg is bool) {
        setNewPassword(isNewPasswordArg);
      }
      if (isOpenProfileArg is bool) {
        setOpenProfile(isOpenProfileArg);
      }
      if (requireCurrentPinBeforeResetArg is bool) {
        setRequireCurrentPinBeforeReset(requireCurrentPinBeforeResetArg);
      }
      if (data.containsKey('allowBiometric')) {
        _hasExplicitAllowBiometricArgument = true;
      }
      if (allowBiometricArg is bool) {
        allowBiometricOnEntry.value = allowBiometricArg;
      }
    }
  }

  Future<void> checkCreatePin(String pinCode) async {
    if (createPin.isEmpty) {
      createPin.value = pinCode;
      pinMatch.value = true;
      pinCodeController.value.text = '';
      return;
    }

    if (createPin.value != pinCode) {
      createPin.value = '';
      pinMatch.value = false;
      pinCodeController.value.clear();
      Get.snackbar(
        'ยืนยัน PIN ไม่สำเร็จ',
        'รหัส PIN ไม่ตรงกัน กรุณากำหนดใหม่อีกครั้ง',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    await savePinCode(pinCode);
    createPin.value = '';
    pinMatch.value = true;
    pinCodeController.value.clear();
    isNewPassword.value = false;
    await _completePinFlow();
  }

  Future<void> checkPin(String pinCode) async {
    final cachedPinCode = _savedPinCode ?? await StorageUtils.getPinCode();
    if (cachedPinCode == null || cachedPinCode.isEmpty) {
      hasSavedPinCode.value = false;
      isNewPassword.value = true;
      createPin.value = '';
      pinMatch.value = true;
      pinCodeController.value.clear();
      return;
    }

    if (cachedPinCode == pinCode) {
      wrongInputCount.value = 0;
      pinMatch.value = true;
      pinCodeController.value.clear();
      if (isConfirmingCurrentPinBeforeReset) {
        _startCreateNewPinFlow();
        return;
      }
      await _completePinFlow();
      return;
    }

    wrongInputCount.value++;
    pinMatch.value = false;
    pinCodeController.value.clear();
    Get.snackbar(
      'PIN ไม่ถูกต้อง',
      'กรุณาลองใหม่อีกครั้ง',
      backgroundColor: Colors.redAccent,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void _startCreateNewPinFlow() {
    requireCurrentPinBeforeReset.value = false;
    isNewPassword.value = true;
    createPin.value = '';
    pinMatch.value = true;
    wrongInputCount.value = 0;
    pinCodeController.value.clear();
  }

  Future<void> _completePinFlow() async {
    if (isOpenProfile.value) {
      Get.back(result: true);
      return;
    }
    Get.offAllNamed(Routes.BOTTOM_NAVIGATORS);
  }

  Future<void> _loadBiometricAvailability() async {
    try {
      final isSupported = await _localAuth.isDeviceSupported();
      final canCheckBiometrics = await _localAuth.canCheckBiometrics;
      final availableBiometrics = await _localAuth.getAvailableBiometrics();
      final hasFaceId = availableBiometrics.contains(BiometricType.face);
      final hasFingerprint = availableBiometrics.contains(
        BiometricType.fingerprint,
      );
      final hasGenericBiometric = availableBiometrics.any(
        (type) =>
            type == BiometricType.strong ||
            type == BiometricType.weak ||
            type == BiometricType.iris,
      );
      isFaceIdAvailable.value = hasFaceId;
      isBiometricAvailable.value =
          isSupported &&
          canCheckBiometrics &&
          (hasFaceId || hasFingerprint || hasGenericBiometric);
    } on PlatformException {
      isBiometricAvailable.value = false;
      isFaceIdAvailable.value = false;
    }
  }

  void _tryAutoAuthenticateBiometric() {
    if (_hasAutoTriggeredBiometric) {
      return;
    }
    if (!canUseBiometricAuth) {
      return;
    }
    _hasAutoTriggeredBiometric = true;
    Future.delayed(
      const Duration(milliseconds: 250),
      authenticateWithBiometric,
    );
  }

  Future<void> authenticateWithBiometric() async {
    if (isAuthenticatingBiometric.value) {
      return;
    }
    if (!canUseBiometricAuth) {
      return;
    }
    final authLabel = isFaceIdAvailable.value ? 'Face ID' : 'Fingerprint';
    final authReason = isFaceIdAvailable.value
        ? 'ยืนยันตัวตนด้วย Face ID เพื่อเข้าสู่ระบบ'
        : 'ยืนยันตัวตนด้วยลายนิ้วมือเพื่อเข้าสู่ระบบ';
    try {
      isAuthenticatingBiometric.value = true;
      final didAuthenticate = await _localAuth.authenticate(
        localizedReason: authReason,
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
          useErrorDialogs: true,
        ),
      );
      if (didAuthenticate) {
        await _completePinFlow();
      }
    } on PlatformException catch (error) {
      final message = error.message ?? 'ไม่สามารถยืนยันตัวตนได้';
      Get.snackbar(authLabel, message, snackPosition: SnackPosition.BOTTOM);
    } finally {
      isAuthenticatingBiometric.value = false;
    }
  }

  void enterPIN(int index) {
    if (!isPinStateReady.value || pinCodeController.value.text.length >= 6) {
      return;
    }

    if (!pinMatch.value && pinCodeController.value.text.isEmpty) {
      pinMatch.value = true;
    }

    pinCodeController.value.text += '$index';

    if (pinCodeController.value.text.length == 6) {
      final pinCode = pinCodeController.value.text;
      if (isNewPassword.value) {
        checkCreatePin(pinCode);
      } else {
        checkPin(pinCode);
      }
    }
  }

  void deletePIN() {
    if (pinCodeController.value.text.isNotEmpty) {
      pinCodeController.value.text = pinCodeController.value.text.substring(
        0,
        pinCodeController.value.text.length - 1,
      );
      pinMatch.value = true;
    }
  }
}
