import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:local_auth/local_auth.dart';

import '../../../../flutter_flow/flutter_flow_animations_pin.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class PinCodeController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = <String, AnimationInfo>{};
  final LocalAuthentication _localAuth = LocalAuthentication();
  Worker? _biometricAvailabilityWorker;
  bool _hasAutoTriggeredBiometric = false;
  Rx<String> createPin = ''.obs;
  Rx<bool> pinMatch = true.obs;
  Rx<int> wrongInputCount = 0.obs;
  Rx<bool> isCorrect = false.obs;
  RxBool isBiometricAvailable = false.obs;
  RxBool isFaceIdAvailable = false.obs;
  RxBool isAuthenticatingBiometric = false.obs;

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
    _biometricAvailabilityWorker = ever<bool>(
      isBiometricAvailable,
      (_) => _tryAutoAuthenticateBiometric(),
    );
    _loadBiometricAvailability();
  }

  @override
  void onReady() {
    super.onReady();
    _tryAutoAuthenticateBiometric();
  }

  @override
  void onClose() {
    _biometricAvailabilityWorker?.dispose();
    super.onClose();
  }

  Future<void> savePinCode(String pin) async {
    //  await CvFunction().prefwrite('user_pin_code', EHPApi.encryptWithAES("This 32 char key have 256 bits..", pin).base64, String);
    //await _personalInformationGetxController.setUserLogin();
  }

  checkCreatePin(String pinCode) async {
    //CreatePin
    if (createPin.isEmpty) {
      createPin.value = pinCode;
      pinCodeController.value.text = '';
    } else {
      // pinMatch.value = (createPin.value != pinCode) ? false : true;
      // if (pinMatch.value) {
      //   pinCode = createPin.value;
      //   savePinCode(pinCode);
      //   await CvFunction().showSuccessDialog();
      //   if (_personalInformationGetxController.isChangePass.value) {
      //     _personalInformationGetxController.isChangePass.value = false;
      //     Get.back();
      //   } else {
      //     CvFunction().showLoadingPinDialog();

      //     // await _personalInformationGetxController.getPersonalChronicData();
      //     await CvFunction().hideLoadingDialog();
      //     await Get.offAllNamed(Routes.HOME);
      //   }
      // } else {
      //   pinCodeController.value.clear();
      // }
    }

    // setState(() {});
  }

  checkPin(String pinCode) async {
    // pinpref = EHPApi.encryptWithAES("This 32 char key have 256 bits..", pinCode ?? '').base64;
    // final pinMD5 = await CvFunction().prefread('user_pin_code', String);

    // log('Pin login ${pinMD5}');
    // log('Pin login Enter ${pinpref}');

    // if (pinpref == pinMD5) {
    //   // log('Pin login Enter ${pinpref}');
    //   // NormalController().showSuccessDialog().then((value) => NormalController().hideLoadingDialog());

    //   await CvFunction().showSuccessDialog();
    //   Get.back(result: pinMD5);
    // } else if (pinCodeController.value.text.length == 6) {
    //   if (pinpref != pinMD5) {
    //     if (isOpenProfile.value) {
    //       if (wrongInputCount > 4) {
    //         // await CvFunction()
    //         //     .showErrorMessageDialog('ท่านใส่รหัส PIN ผิดเกิน 5 ครั้ง หากลืมรหัสผ่านกรุณากด ลืมรหัส PIN')
    //         //     .then((value) {
    //         //       Get.offAndToNamed(Routes.HOME);
    //         //     });
    //       }
    //     } else {
    //       if (wrongInputCount > 4) {
    //         await CvFunction()
    //             .showErrorMessageDialog('ท่านใส่รหัส PIN ผิดเกิน 5 ครั้ง ระบบได้ทำการ Reset Account ในอุปกรณ์นี้แล้ว กรุณาลงทะเบียนใช้งานใหม่')
    //             .then((value) {
    //               CvFunction().preferase();
    //               // Restart.restartApp();
    //               Get.back();
    //               // Navigator.of(context).pop();
    //             });
    //       } else {
    //         // await showPopupError('รหัสผ่านไม่ถูกต้อง');
    //       }
    //     }

    //     wrongInputCount.value++;
    //     pinCodeController.value.clear();
    //   }

    //   // setState(() {});
    // } else {
    //   print('Pin login failed');
    // }
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
    if (isNewPassword.value || !isBiometricAvailable.value) {
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
    final authLabel = isFaceIdAvailable.value ? 'Face ID' : 'Fingerprint';
    final authReason = isFaceIdAvailable.value
        ? 'ยืนยันตัวตนด้วย Face ID เพื่อเข้าสู่ระบบ'
        : 'ยืนยันตัวตนด้วยลายนิ้วมือเพื่อเข้าสู่ระบบ';
    if (!isBiometricAvailable.value) {
      Get.snackbar(
        authLabel,
        'อุปกรณ์นี้ยังไม่รองรับการยืนยันตัวตนแบบไบโอเมตริก',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
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
        Get.toNamed(Routes.BOTTOM_NAVIGATORS);
      }
    } on PlatformException catch (error) {
      final message = error.message ?? 'ไม่สามารถยืนยันตัวตนได้';
      Get.snackbar(authLabel, message, snackPosition: SnackPosition.BOTTOM);
    } finally {
      isAuthenticatingBiometric.value = false;
    }
  }

  void enterPIN(int index) {
    // log('isNewPass ${isNewPassword}');
    // log('PIN ${index}');
    Get.toNamed(Routes.BOTTOM_NAVIGATORS);
    // if (isNewPassword.value) {
    //   isCorrect.value = true;
    //   if (pinCodeController.value.text.length != 6) {
    //     pinCodeController.value.text += '${index}';
    //     // print('dex: 00 ${pinCodeController.value.text}');
    //     if (pinCodeController.value.text.length == 1) pinMatch.value = true;
    //     if (pinCodeController.value.text.length == 6) checkCreatePin(pinCodeController.value.text);
    //   }
    // } else {
    //   if (pinCodeController.value.text.length != 6) {
    //     pinCodeController.value.text += '${index}';
    //     if (pinCodeController.value.text.length == 6) checkPin(pinCodeController.value.text);
    //   } else {
    //     checkPin(pinCodeController.value.text);
    //   }
    // }
  }

  void deletePIN() {
    if (pinCodeController.value.text.isNotEmpty) {
      pinCodeController.value.text = pinCodeController.value.text.substring(
        0,
        pinCodeController.value.text.length - 1,
      );
      // print('Button pressed ${pinCodeController.text}');
      pinMatch.value = true;
      isCorrect.value = true;
    }
  }

  // Future<void> forgotPIN() async {
  //   PinView.pinCode = '';
  //   await CvFunction().preferase();

  //   Get.offAllNamed(AppPages.INITIAL);
  // }
}
