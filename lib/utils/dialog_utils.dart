import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// App-specific imports


import '../widgets/calendar_widget/loading/loading_widget.dart';

// ============================================================================
// BASE DIALOG UTILITIES - Reusable across projects
// ============================================================================

/// Base utility class for dialogs and bottom sheets
/// ใช้ Get.dialog และ Get.bottomSheet เพื่อความยืดหยุ่น
/// สามารถ copy ไปใช้โปรเจคอื่นได้โดยไม่ต้องแก้ไข (เฉพาะ class นี้)
class DialogUtils {
  // ---------------------------------------------------------------------------
  // CORE DIALOG METHODS
  // ---------------------------------------------------------------------------

  /// แสดง Dialog ด้วย Get.dialog
  /// [child] - Widget ที่จะแสดงใน dialog
  /// [barrierDismissible] - กดพื้นหลังปิดได้หรือไม่
  /// [barrierColor] - สีพื้นหลัง
  /// [onClosed] - callback เมื่อ dialog ปิด
  static Future<T?> showDialog<T>({
    required Widget child,
    bool barrierDismissible = false,
    Color barrierColor = const Color(0x8A000000),
    VoidCallback? onClosed,
  }) {
    final Future<T?> future = Get.dialog<T>(
      child,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
    );

    return future.whenComplete(() {
      if (onClosed != null) onClosed();
    });
  }

  /// แสดง Bottom Sheet ด้วย Get.bottomSheet
  /// [child] - Widget ที่จะแสดงใน bottom sheet
  /// [isScrollControlled] - ให้ bottom sheet ขยายตาม content
  /// [isDismissible] - กดพื้นหลังปิดได้หรือไม่
  /// [enableDrag] - ลากปิดได้หรือไม่
  /// [unfocusOnTap] - unfocus keyboard เมื่อแตะ
  /// [onClosed] - callback เมื่อ bottom sheet ปิด
  static Future<T?> showBottomSheet<T>({
    required Widget child,
    bool isScrollControlled = true,
    bool isDismissible = false,
    bool enableDrag = false,
    Color backgroundColor = Colors.transparent,
    bool unfocusOnTap = true,
    EdgeInsets? insets,
    VoidCallback? onClosed,
  }) {
    final BuildContext? context = Get.context;

    final Widget content = GestureDetector(
      onTap: unfocusOnTap
          ? () {
              final BuildContext? ctx = Get.context;
              if (ctx != null) {
                FocusScope.of(ctx).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              }
            }
          : null,
      child: Padding(
        padding: insets ?? (context != null ? MediaQuery.viewInsetsOf(context) : EdgeInsets.zero),
        child: child,
      ),
    );

    final Future<T?> future = Get.bottomSheet<T>(
      content,
      isScrollControlled: isScrollControlled,
      backgroundColor: backgroundColor,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
    );

    return future.whenComplete(() {
      if (onClosed != null) onClosed();
    });
  }

  // ---------------------------------------------------------------------------
  // SAFE CLOSE METHODS
  // ---------------------------------------------------------------------------

  /// ปิด Bottom Sheet ถ้าเปิดอยู่
  /// คืน true ถ้าปิดสำเร็จ, false ถ้าไม่มี bottom sheet เปิดอยู่
  static bool closeBottomSheetIfOpen<T>({T? result}) {
    if (Get.isBottomSheetOpen == true) {
      Get.back<T>(result: result);
      return true;
    }
    return false;
  }

  /// ปิด Dialog ถ้าเปิดอยู่
  /// คืน true ถ้าปิดสำเร็จ, false ถ้าไม่มี dialog เปิดอยู่
  static bool closeDialogIfOpen<T>({T? result}) {
    if (Get.isDialogOpen == true) {
      Get.back<T>(result: result);
      return true;
    }
    return false;
  }

  /// ปิด overlay ที่เปิดอยู่ โดยจะพยายามปิด bottom sheet ก่อน ถ้าไม่มีค่อยปิด dialog
  /// เหตุผล: GetX จะแสดง bottom sheet บน dialog เสมอ
  /// คืน true ถ้ามีอะไรถูกปิด, false ถ้าไม่มีอะไรเปิดอยู่
  static bool closeAnyOverlay<T>({T? result}) {
    // ปิด bottom sheet ก่อน (เพราะมันอยู่บน dialog)
    if (Get.isBottomSheetOpen == true) {
      Get.back<T>(result: result);
      return true;
    }
    // ถ้าไม่มี bottom sheet ค่อยปิด dialog
    if (Get.isDialogOpen == true) {
      Get.back<T>(result: result);
      return true;
    }
    return false;
  }

  /// ปิด overlay ทั้งหมดที่เปิดอยู่ (ทั้ง dialog และ bottom sheet)
  /// คืนจำนวน overlay ที่ถูกปิด
  static int closeAllOverlays<T>({T? result}) {
    int closed = 0;

    // ปิด bottom sheet ก่อน
    while (Get.isBottomSheetOpen == true) {
      Get.back<T>(result: result);
      closed++;
    }

    // แล้วค่อยปิด dialog
    while (Get.isDialogOpen == true) {
      Get.back<T>(result: result);
      closed++;
    }

    return closed;
  }

  /// Safe back - กลับหน้าก่อนหน้าอย่างปลอดภัย
  /// ถ้ามี overlay เปิดอยู่จะปิด overlay ก่อน
  /// ถ้าไม่มี overlay และ canPop ได้จะ pop
  /// ถ้า pop ไม่ได้จะไปหน้า fallback
  static void safeBack<T>({T? result, String? fallbackRoute}) {
    // ปิด overlay ก่อนถ้ามี
    if (closeAnyOverlay<T>(result: result)) {
      return;
    }

    // ถ้าไม่มี overlay ให้ pop ตามปกติ
    final canPop = Get.key.currentState?.canPop() ?? false;
    if (canPop) {
      Get.back<T>(result: result);
    } else if (fallbackRoute != null && routeExists(fallbackRoute)) {
      Get.offAllNamed(fallbackRoute);
    } else {
      // ไม่มี stack หรือ fallback ไม่ถูกต้อง → กลับหน้าเริ่มต้น
      // Get.offAllNamed(Routes.HOME);
    }
  }

  /// Safe back สำหรับ nested navigator
  static void safeBackNested<T>(int navigatorId, {T? result, String? fallbackRoute}) {
    final nav = Get.nestedKey(navigatorId)?.currentState;
    if (nav?.canPop() == true) {
      Get.back<T>(id: navigatorId, result: result);
    } else {
      final rootCanPop = Get.key.currentState?.canPop() ?? false;
      if (rootCanPop) {
        Get.back<T>(result: result);
      } else if (fallbackRoute != null) {
        Get.offAllNamed(fallbackRoute);
      }
    }
  }

  static bool routeExists(String routeName) {
    final match = Get.routeTree.matchRoute(routeName);
    return match.route != null;
  }

  // ---------------------------------------------------------------------------
  // HELPER METHODS
  // ---------------------------------------------------------------------------

  /// ตรวจสอบว่ามี dialog เปิดอยู่หรือไม่
  static bool get isDialogOpen => Get.isDialogOpen == true;

  /// ตรวจสอบว่ามี bottom sheet เปิดอยู่หรือไม่
  static bool get isBottomSheetOpen => Get.isBottomSheetOpen == true;

  /// ตรวจสอบว่ามี overlay (dialog หรือ bottom sheet) เปิดอยู่หรือไม่
  static bool get hasOpenOverlay => isDialogOpen || isBottomSheetOpen;
}

// ============================================================================
// APP-SPECIFIC DIALOGS - เฉพาะโปรเจค Atlas Home Care
// ============================================================================

/// App-specific dialog helpers for Atlas Home Care
/// ใช้ DialogUtils เป็น base
class AppDialogs {
  // ---------------------------------------------------------------------------
  // LOADING DIALOGS
  // ---------------------------------------------------------------------------

  /// แสดง Loading Dialog
  static Future<void> showLoading() async {
    log('AppDialogs.showLoading');
    await DialogUtils.showDialog(
      child: const LoadingWidget(), // PopupLoadingView
      barrierDismissible: false,
    );
  }

  /// แสดง Loading Dialog พร้อม barrier สีขาว (สำหรับหน้า PIN)
  static Future<void> showLoadingWithWhiteBarrier() async {
    log('AppDialogs.showLoadingWithWhiteBarrier');
    await DialogUtils.showDialog(
      child: const LoadingWidget(), // PopupLoadingView
      barrierDismissible: false,
      barrierColor: Colors.white,
    );
  }

  /// ซ่อน Loading Dialog อย่างปลอดภัย
  static Future<void> hideLoading({Duration delay = const Duration(seconds: 1)}) async {
    await Future.delayed(delay);
    DialogUtils.closeDialogIfOpen();
  }

  // ---------------------------------------------------------------------------
  // LOADING BOTTOM SHEET (Lottie animation)
  // ---------------------------------------------------------------------------

  /// แสดง Loading Bottom Sheet (Lottie animation)
  static Future<void> showLoadingBottomSheet() async {
    log('AppDialogs.showLoadingBottomSheet');
    await DialogUtils.showBottomSheet(
      child: const LoadingWidget(),
      isDismissible: false,
      enableDrag: false,
    );
  }

  /// ซ่อน Loading Bottom Sheet อย่างปลอดภัย
  static Future<void> hideLoadingBottomSheet({Duration delay = const Duration(seconds: 1)}) async {
    await Future.delayed(delay);
    DialogUtils.closeBottomSheetIfOpen();
  }

  // ---------------------------------------------------------------------------
  // SUCCESS DIALOGS
  // ---------------------------------------------------------------------------

  /// แสดง Success Dialog และปิดอัตโนมัติ
  // static Future<void> showSuccess({Duration autoClose = const Duration(seconds: 3)}) async {
  //   log('AppDialogs.showSuccess');
  //   DialogUtils.showDialog(child: const PopupSuccessView());
  //   await Future.delayed(autoClose);
  //   DialogUtils.closeDialogIfOpen();
  // }

  /// แสดง Success Dialog พร้อมข้อความและปิดอัตโนมัติ
  // static Future<void> showSuccessWithMessage(
  //   String message, {
  //   Duration autoClose = const Duration(seconds: 3),
  // }) async {
  //   log('AppDialogs.showSuccessWithMessage: $message');
  //   DialogUtils.showDialog(child: PopupSuccessView(descText: message));
  //   await Future.delayed(autoClose);
  //   DialogUtils.closeDialogIfOpen();
  // }

  // ---------------------------------------------------------------------------
  // ERROR DIALOGS
  // ---------------------------------------------------------------------------

  /// แสดง Error Dialog และปิดอัตโนมัติ
  // static Future<void> showError(
  //   String message, {
  //   Duration autoClose = const Duration(seconds: 10),
  // }) async {
  //   log('AppDialogs.showError: $message');
  //   DialogUtils.showDialog(child: PopupError2View(descText: message));
  //   await Future.delayed(autoClose);
  //   DialogUtils.closeDialogIfOpen();
  // }

  // ---------------------------------------------------------------------------
  // WARNING/CONFIRM DIALOGS
  // ---------------------------------------------------------------------------

  /// แสดง Warning Dialog และรอผลลัพธ์จากผู้ใช้
  // static Future<bool> showWarning(String message) async {
  //   log('AppDialogs.showWarning: $message');
  //   final result = await DialogUtils.showDialog<bool>(
  //     child: PopupWarningView(descText: message),
  //   );
  //   return result ?? false;
  // }

  /// แสดง Warning Dialog พร้อมปุ่ม Cancel
  // static Future<bool> showWarningWithCancel(String message, {bool showCancelButton = true}) async {
  //   log('AppDialogs.showWarningWithCancel: $message');
  //   final result = await DialogUtils.showDialog<bool>(
  //     child: PopupWarning2Widget(message: message, cancel: showCancelButton),
  //   );
  //   return result ?? false;
  // }

  /// แสดง Confirm Dialog พร้อมปุ่มควบคุม (Confirm/Cancel)
  // static Future<bool> showConfirm({
  //   required String message,
  //   bool showConfirmButton = true,
  //   bool showCancelButton = true,
  // }) async {
  //   log('AppDialogs.showConfirm: $message');
  //   final result = await DialogUtils.showDialog<bool>(
  //     child: PopupWarningCtrButtonView(
  //       descText: message,
  //       showConfirm: showConfirmButton,
  //       showCancel: showCancelButton,
  //     ),
  //   );
  //   return result ?? false;
  // }

  /// แสดง Case Accept Dialog (สำหรับรับเคส)
  // static Future<bool> showCaseAcceptConfirm() async {
  //   log('AppDialogs.showCaseAcceptConfirm');
  //   final result = await DialogUtils.showDialog<bool>(
  //     child: const PopupAcceptCaseView(),
  //   );
  //   return result ?? false;
  // }

  /// แสดง Case Warning Dialog
  // static Future<void> showCaseWarning() async {
  //   log('AppDialogs.showCaseWarning');
  //   await DialogUtils.showDialog(child: const PopupWarningCaseView());
  // }

  // ---------------------------------------------------------------------------
  // SPECIAL DIALOGS
  // ---------------------------------------------------------------------------

  /// แสดง Dialog ให้ถอด Smart Card
  // static Future<void> showRemoveCard() async {
  //   await DialogUtils.showDialog(child: const PopupRemoveCardView());
  // }
}
