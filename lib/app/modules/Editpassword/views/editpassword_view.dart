import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../flutter_flow/flutter_flow_icon_button.dart';
import '../../../../flutter_flow/flutter_flow_theme_new.dart';
import '../../../../flutter_flow/flutter_flow_widgets.dart';
import '../controllers/editpassword_controller.dart';

class EditpasswordView extends GetView<EditpasswordController> {
  const EditpasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowThemeNew.of(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
        controller.unfocusNode.unfocus();
      },
      child: Scaffold(
        key: controller.scaffoldKey,
        backgroundColor: theme.primaryBackground,
        appBar: AppBar(
          backgroundColor: theme.primary,
          automaticallyImplyLeading: true,
          centerTitle: true,
          elevation: 0.0,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.keyboard_arrow_left_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              Get.back();
            },
          ),

          title: Text(
            'ตั้งค่ารหัสผ่าน',
            style: theme.titleSmall.override(
              font: theme.titleSmall,
              color: theme.secondaryBackground,
              letterSpacing: 0.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                theme.primary,
                theme.primaryBackground,
                theme.primaryBackground,
              ],
              stops: const [0.0, 0.22, 1.0],
              begin: const AlignmentDirectional(0.0, -1.0),
              end: const AlignmentDirectional(0.0, 1.0),
            ),
          ),
          child: SafeArea(
            top: false,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 760.0),
                        child: Form(
                          key: controller.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              _buildFormContainer(theme),
                              const SizedBox(height: 16.0),
                              _buildRuleContainer(theme),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                _buildBottomBar(context, theme),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormContainer(FlutterFlowThemeNew theme) {
    return Container(
      decoration: BoxDecoration(
        color: theme.secondaryBackground,
        borderRadius: BorderRadius.circular(24.0),
        boxShadow: const [
          BoxShadow(
            blurRadius: 14.0,
            color: Color(0x14000000),
            offset: Offset(0.0, 8.0),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'กำหนดรหัสผ่านของคุณ',
              style: theme.titleSmall.override(
                font: theme.titleSmall,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4.0),

            _buildCurrentPasswordField(theme),
            const SizedBox(height: 18.0),
            _buildNewPasswordField(theme),
            const SizedBox(height: 18.0),
            _buildConfirmPasswordField(theme),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentPasswordField(FlutterFlowThemeNew theme) {
    return Obx(() {
      return _PasswordFieldSection(
        label: 'รหัสผ่านปัจจุบัน',
        textField: TextFormField(
          key: controller.currentPasswordFieldKey,
          controller: controller.currentPasswordController,
          obscureText: controller.obscureCurrentPassword.value,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textInputAction: TextInputAction.next,
          decoration: _buildInputDecoration(
            theme: theme,
            hintText: 'กรอกรหัสผ่านปัจจุบัน',
            prefixIcon: const Icon(Icons.lock_outline_rounded),
            obscureText: controller.obscureCurrentPassword.value,
            onTapVisibility: controller.toggleCurrentPasswordVisibility,
          ),
          style: theme.bodyMedium.override(
            font: theme.bodyMedium,
            color: theme.primaryText,
            letterSpacing: 0.0,
          ),
          validator: controller.validateCurrentPassword,
        ),
      );
    });
  }

  Widget _buildNewPasswordField(FlutterFlowThemeNew theme) {
    return Obx(
      () => _PasswordFieldSection(
        label: 'กำหนดรหัสผ่านใหม่',
        textField: TextFormField(
          controller: controller.newPasswordController,
          obscureText: controller.obscureNewPassword.value,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textInputAction: TextInputAction.next,
          decoration: _buildInputDecoration(
            theme: theme,
            hintText: 'กรอกรหัสผ่านใหม่',
            prefixIcon: const Icon(Icons.enhanced_encryption_outlined),
            obscureText: controller.obscureNewPassword.value,
            onTapVisibility: controller.toggleNewPasswordVisibility,
          ),
          style: theme.bodyMedium.override(
            font: theme.bodyMedium,
            color: theme.primaryText,
            letterSpacing: 0.0,
          ),
          validator: controller.validateNewPassword,
        ),
      ),
    );
  }

  Widget _buildConfirmPasswordField(FlutterFlowThemeNew theme) {
    return Obx(
      () => _PasswordFieldSection(
        label: 'ยืนยันรหัสผ่านใหม่อีกครั้ง',
        textField: TextFormField(
          controller: controller.confirmPasswordController,
          obscureText: controller.obscureConfirmPassword.value,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textInputAction: TextInputAction.done,
          onFieldSubmitted: (_) {
            final currentContext = Get.context;
            if (currentContext != null) {
              controller.submit(currentContext);
            }
          },
          decoration: _buildInputDecoration(
            theme: theme,
            hintText: 'กรอกรหัสผ่านใหม่อีกครั้ง',
            prefixIcon: const Icon(Icons.verified_user_outlined),
            obscureText: controller.obscureConfirmPassword.value,
            onTapVisibility: controller.toggleConfirmPasswordVisibility,
          ),
          style: theme.bodyMedium.override(
            font: theme.bodyMedium,
            color: theme.primaryText,
            letterSpacing: 0.0,
          ),
          validator: controller.validateConfirmPassword,
        ),
      ),
    );
  }

  Widget _buildRuleContainer(FlutterFlowThemeNew theme) {
    return Container(
      decoration: BoxDecoration(
        color: theme.secondaryBackground,
        borderRadius: BorderRadius.circular(24.0),
        boxShadow: const [
          BoxShadow(
            blurRadius: 14.0,
            color: Color(0x14000000),
            offset: Offset(0.0, 8.0),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'หมายเหตุ',
                style: theme.bodyMedium.override(
                  font: theme.bodyMedium,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12.0),
              _RuleRow(
                theme: theme,
                label: 'ความยาวอย่างน้อย 8 ตัว',
                isPassed: controller.hasMinLength,
              ),
              const SizedBox(height: 10.0),
              _RuleRow(
                theme: theme,
                label: 'A-Z อย่างน้อย 1 ตัว',
                isPassed: controller.hasUppercase,
              ),
              const SizedBox(height: 10.0),
              _RuleRow(
                theme: theme,
                label: 'a-z อย่างน้อย 1 ตัว',
                isPassed: controller.hasLowercase,
              ),
              const SizedBox(height: 10.0),
              _RuleRow(
                theme: theme,
                label: 'ตัวเลขอย่างน้อย 1 ตัว',
                isPassed: controller.hasDigit,
              ),
              const SizedBox(height: 10.0),
              _RuleRow(
                theme: theme,
                label: 'ตัวอักษรพิเศษอย่างน้อย 1 ตัว (!@#\$&*)',
                isPassed: controller.hasSpecialCharacter,
              ),
              const SizedBox(height: 10.0),
              _RuleRow(
                theme: theme,
                label: 'รหัสผ่านใหม่ต้องไม่ซ้ำกับรหัสผ่านเดิม',
                isPassed: controller.isNewPasswordDifferentFromCurrent,
              ),
              const SizedBox(height: 10.0),
              _RuleRow(
                theme: theme,
                label: 'รหัสผ่านและยืนยันรหัสผ่านต้องตรงกัน',
                isPassed: controller.passwordsMatch,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context, FlutterFlowThemeNew theme) {
    return Container(
      decoration: BoxDecoration(
        color: theme.secondaryBackground,
        boxShadow: const [
          BoxShadow(
            blurRadius: 8.0,
            color: Color(0x14000000),
            offset: Offset(0.0, -3.0),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 14.0, 16.0, 24.0),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 760.0),
              child: Obx(() {
                final isEnabled = controller.canSubmit;
                final isSubmitting =
                    controller.isSubmittingChangePassword.value;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FFButtonWidget(
                      onPressed: isEnabled
                          ? () => controller.submit(context)
                          : null,
                      text: isSubmitting ? 'กำลังบันทึก...' : 'บันทึก',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 48.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          0.0,
                          0.0,
                          0.0,
                        ),
                        iconPadding: const EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          0.0,
                          0.0,
                          0.0,
                        ),
                        color: isEnabled
                            ? const Color(0xFF1B78E4)
                            : const Color(0xFFB0BEC5),
                        disabledColor: const Color(0xFFB0BEC5),
                        textStyle: theme.bodyMedium.override(
                          font: theme.bodyMedium,
                          color: theme.secondaryBackground,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.0,
                        ),

                        elevation: isEnabled ? 4.0 : 0.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration({
    required FlutterFlowThemeNew theme,
    required String hintText,
    required Widget prefixIcon,
    required bool obscureText,
    required VoidCallback onTapVisibility,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: theme.bodySmall.override(
        font: theme.bodySmall,
        color: const Color(0xFF57636C),
        letterSpacing: 0.0,
      ),
      prefixIcon: prefixIcon,
      suffixIcon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: onTapVisibility,
            focusNode: FocusNode(skipTraversal: true),
            child: Padding(
              padding: const EdgeInsetsDirectional.only(end: 12.0),
              child: Icon(
                obscureText
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: const Color(0xFF757575),
                size: 18.0,
              ),
            ),
          ),
        ],
      ),
      filled: true,
      fillColor: const Color(0xFFF7FAFC),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFFD9E3EF), width: 1.0),
        borderRadius: BorderRadius.circular(16.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: theme.primary, width: 1.2),
        borderRadius: BorderRadius.circular(16.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: theme.error, width: 1.0),
        borderRadius: BorderRadius.circular(16.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: theme.error, width: 1.2),
        borderRadius: BorderRadius.circular(16.0),
      ),
      contentPadding: const EdgeInsetsDirectional.fromSTEB(
        16.0,
        14.0,
        0.0,
        14.0,
      ),
    );
  }
}

class _PasswordFieldSection extends StatelessWidget {
  const _PasswordFieldSection({required this.label, required this.textField});

  final String label;
  final Widget textField;

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowThemeNew.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.bodyMedium.override(
            font: theme.bodyMedium,
            color: const Color(0xFF0B3D91),
            letterSpacing: 0.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8.0),
        textField,
      ],
    );
  }
}

class _RuleRow extends StatelessWidget {
  const _RuleRow({
    required this.theme,
    required this.label,
    required this.isPassed,
  });

  final FlutterFlowThemeNew theme;
  final String label;
  final bool isPassed;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          isPassed ? Icons.check_circle_rounded : Icons.radio_button_unchecked,
          color: isPassed ? const Color(0xFF02C900) : theme.primary,
          size: 16.0,
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: Text(
            label,
            style: theme.labelSmall.override(
              font: theme.labelSmall,
              color: isPassed ? theme.primaryText : theme.secondaryText,
              fontWeight: FontWeight.normal,
              letterSpacing: 0.0,
            ),
          ),
        ),
      ],
    );
  }
}
