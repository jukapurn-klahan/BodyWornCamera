import 'package:body_camera/app/modules/login/controllers/login_controller.dart';
import 'package:body_camera/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../flutter_flow/flutter_flow_util.dart';
import '../../../../flutter_flow/flutter_flow_widgets.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const Color navy = Color(0xFF143B78);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: controller.scaffoldKey,
        backgroundColor: Color(0xFFF2F5FA),
        body: PopScope(
          canPop: false,
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: size.height),
              child: IntrinsicHeight(
                child: Stack(
                  children: [
                    Container(
                      height: 250,
                      decoration: const BoxDecoration(
                        color: navy,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(48), bottomRight: Radius.circular(48)),
                      ),
                    ),

                    // ลายโค้งพื้นหลัง
                    Positioned(
                      left: -120,
                      top: 120,
                      child: Container(
                        width: 260,
                        height: 260,
                        decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.18), shape: BoxShape.circle),
                      ),
                    ),
                    Positioned(
                      right: -120,
                      top: 40,
                      child: Container(
                        width: 260,
                        height: 260,
                        decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.08), shape: BoxShape.circle),
                      ),
                    ),

                    /// ---------- HEADER BACKGROUND ----------
                    // SizedBox(
                    //   width: double.infinity,
                    //   height: 300,
                    //   child: Stack(
                    //     fit: StackFit.expand,
                    //     children: [
                    //       Container(
                    //         decoration: const BoxDecoration(
                    //           gradient: LinearGradient(
                    //             colors: [
                    //               Color(0xFF081B33),
                    //               Color(0xFF0D47A1),
                    //               Color(0xFF1565C0),
                    //             ],
                    //             begin: Alignment.topLeft,
                    //             end: Alignment.bottomRight,
                    //           ),
                    //           borderRadius: BorderRadius.only(
                    //             bottomLeft: Radius.circular(40),
                    //             bottomRight: Radius.circular(40),
                    //           ),
                    //         ),
                    //       ),

                    //       /// ภาพพื้นหลัง (ถนน/รถบรรทุก)
                    //       ClipRRect(
                    //         borderRadius: const BorderRadius.only(
                    //           bottomLeft: Radius.circular(40),
                    //           bottomRight: Radius.circular(40),
                    //         ),
                    //         child: Opacity(
                    //           opacity: 0.12,
                    //           child: Image.asset(
                    //             'assets/images/highway_truck_bg.jpg',
                    //             fit: BoxFit.cover,
                    //           ),
                    //         ),
                    //       ),

                    //       /// overlay ให้ mood เข้มแบบ control center
                    //       Container(
                    //         decoration: const BoxDecoration(
                    //           borderRadius: BorderRadius.only(
                    //             bottomLeft: Radius.circular(40),
                    //             bottomRight: Radius.circular(40),
                    //           ),
                    //           gradient: LinearGradient(
                    //             colors: [
                    //               Color(0xCC081B33),
                    //               Color(0x880D47A1),
                    //               Color(0x55000000),
                    //             ],
                    //             begin: Alignment.topCenter,
                    //             end: Alignment.bottomCenter,
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 120, 16, 20),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(32),
                          boxShadow: [BoxShadow(blurRadius: 24, color: Colors.black.withValues(alpha: 0.10), offset: const Offset(0, 14))],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              /// LOGO
                              Container(
                                width: 150.0,
                                height: 150.0,
                                decoration: BoxDecoration(
                                  boxShadow: const [BoxShadow(blurRadius: 4.0, color: Color(0x33000000), offset: Offset(0.0, 2.0))],
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.asset('assets/images/scn_dashcam_app_logo.png', width: 150.0, height: 150.0, fit: BoxFit.cover),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 50),

                              _buildLabel(context, 'ชื่อผู้ใช้งาน'),
                              const SizedBox(height: 8),
                              TextFormField(
                                controller: controller.usernameController,
                                decoration: _inputDecoration(
                                  context,
                                  hintText: 'กรอกชื่อผู้ใช้งาน',
                                  prefixIcon: const Icon(Icons.person, color: Color(0xFF1565C0)),
                                ),
                              ),

                              const SizedBox(height: 16),

                              _buildLabel(context, 'รหัสผ่าน'),
                              const SizedBox(height: 8),
                              Obx(
                                () => TextFormField(
                                  controller: controller.passwordController,
                                  obscureText: controller.obscurePassword.value,
                                  decoration: _inputDecoration(
                                    context,
                                    hintText: 'กรอกรหัสผ่าน',

                                    prefixIcon: const Icon(Icons.lock, color: Color(0xFF1565C0)),
                                    suffixIcon: InkWell(
                                      onTap: controller.togglePassword,
                                      child: Icon(controller.obscurePassword.value ? Icons.visibility_off : Icons.visibility, color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 8),

                              Obx(() {
                                final canToggleRemember = controller.canSubmitLogin.value;

                                return Row(
                                  children: [
                                    Checkbox(
                                      value: controller.rememberPassword.value,
                                      activeColor: navy,
                                      onChanged: canToggleRemember ? (_) => controller.toggleRememberPassword() : null,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      'จำรหัสผ่าน',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        fontFamily: 'Sarabun',
                                        color: canToggleRemember ? FlutterFlowTheme.of(context).accent1 : FlutterFlowTheme.of(context).secondaryText,
                                      ),
                                    ),
                                  ],
                                );
                              }),
                              const SizedBox(height: 8),

                              Obx(() {
                                final isEnabled = controller.canSubmitLogin.value && !controller.isSubmittingLogin.value;

                                return SizedBox(
                                  width: double.infinity,

                                  child: FFButtonWidget(
                                    onPressed: isEnabled ? controller.login : null,
                                    text: 'เข้าสู่ระบบ',
                                    options: FFButtonOptions(
                                      height: 48.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),

                                      color: isEnabled ? Color(0xFF0D47A1) : FlutterFlowTheme.of(context).secondaryText,

                                      textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context).secondaryBackground,

                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                      ),
                                      elevation: 3.0,
                                      borderSide: BorderSide(color: Colors.transparent, width: 1.0),
                                      borderRadius: BorderRadius.circular(100.0),
                                    ),
                                  ),
                                  // child: InkWell(
                                  //   splashColor: Colors.transparent,
                                  //   focusColor: Colors.transparent,
                                  //   hoverColor: Colors.transparent,
                                  //   highlightColor: Colors.transparent,
                                  //   onTap: () async {},
                                  //   child: Container(
                                  //     width: double.infinity,
                                  //     height: () {
                                  //       if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                  //         return 48.0;
                                  //       } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                  //         return 48.0;
                                  //       } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                  //         return 56.0;
                                  //       } else {
                                  //         return 56.0;
                                  //       }
                                  //     }(),
                                  //     decoration: BoxDecoration(
                                  //       boxShadow: [
                                  //         BoxShadow(blurRadius: 4.0, color: FlutterFlowTheme.of(context).tertiary, offset: Offset(0.0, 0.0)),
                                  //       ],
                                  //       gradient: LinearGradient(
                                  //         colors: [
                                  //           isEnabled == false ? FlutterFlowTheme.of(context).secondaryText : Color(0xFF0D47A1),
                                  //           isEnabled == false ? FlutterFlowTheme.of(context).secondaryText : Color(0xFF267EC6),
                                  //         ],
                                  //         stops: [0.0, 1.0],
                                  //         begin: AlignmentDirectional(0.56, -1.0),
                                  //         end: AlignmentDirectional(-0.56, 1.0),
                                  //       ),
                                  //       borderRadius: BorderRadius.circular(100.0),
                                  //       border: Border.all(color: FlutterFlowTheme.of(context).secondaryBackground),
                                  //     ),
                                  //     child: Align(
                                  //       alignment: AlignmentDirectional(0.0, 0.0),
                                  //       child: Text(
                                  //         'ตกลง',
                                  //         textAlign: TextAlign.center,
                                  //         style: FlutterFlowTheme.of(context).bodyLarge.override(
                                  //           fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                  //           color: isEnabled
                                  //               ? FlutterFlowTheme.of(context).secondaryBackground
                                  //               : FlutterFlowTheme.of(context).primaryText,
                                  //           letterSpacing: 0.0,
                                  //           useGoogleFonts: true,
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(BuildContext context, String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: FlutterFlowTheme.of(context).labelMedium.override(
          fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
          color: const Color(0xFF334155),
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(BuildContext context, {required String hintText, Widget? prefixIcon, Widget? suffixIcon}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: FlutterFlowTheme.of(context).bodySmall.override(fontFamily: 'Sarabun', color: const Color(0xFF9AA5B1)),
      filled: true,
      fillColor: const Color(0xFFF8FAFC),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFFD7E0EA), width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFF1565C0), width: 1.8),
        borderRadius: BorderRadius.circular(16),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFFE53935), width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFFE53935), width: 1.4),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
