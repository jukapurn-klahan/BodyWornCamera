import 'dart:developer';

import 'package:body_camera/widgets/popup_success/popup_success_widget.dart';
import 'package:flutter/material.dart';

import 'popup_warning/popup_warning_widget.dart';

class PopupDialogShow {
  static const double _horizontalPadding = 24.0;

  static void showErrorDialog(BuildContext context, String title, String message) {
    log('dex00: message $message');
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: false,
      enableDrag: false,
      context: context,
      builder: (context) {
        return _buildSheetContent(context, PopupWarningWidget(message: message));
      },
    );
  }

  static void showSuccessDialog(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: false,
      enableDrag: false,
      context: context,
      builder: (context) {
        return _buildSheetContent(context, PopupSuccessWidget());
      },
    );
  }

  static Widget _buildSheetContent(BuildContext context, Widget child) {
    final viewInsets = MediaQuery.viewInsetsOf(context);

    return Padding(
      padding: EdgeInsets.only(left: _horizontalPadding, right: _horizontalPadding, bottom: viewInsets.bottom),
      child: child,
    );
  }
}
