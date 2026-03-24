import 'package:body_camera/app/modules/login/controllers/login_controller.dart';
import 'package:body_camera/app/routes/app_pages.dart';
import 'package:body_camera/flutter_flow/flutter_flow_animations.dart';
import 'package:body_camera/flutter_flow/flutter_flow_theme.dart';
import 'package:body_camera/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

 class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        key: controller.scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Container(
                                width: 100.0,
                                height: 256.0,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF0073DD),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30.0),
                                    bottomRight: Radius.circular(30.0),
                                    topLeft: Radius.circular(0.0),
                                    topRight: Radius.circular(0.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 1.0,
                                    height: MediaQuery.of(context).size.height * 0.92,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                      borderRadius: BorderRadius.circular(40.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 40.0),
                                                child: Align(
                                                  alignment: AlignmentDirectional(0.00, 0.00),
                                                  child: Container(
                                                    width: 150.0,
                                                    height: 150.0,
                                                    decoration: BoxDecoration(
                                                      boxShadow: const [
                                                        BoxShadow(blurRadius: 4.0, color: Color(0x33000000), offset: Offset(0.0, 2.0)),
                                                      ],
                                                      borderRadius: BorderRadius.circular(20.0),
                                                    ),
                                                    child: Align(
                                                      alignment: AlignmentDirectional(0.00, 0.00),
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(20.0),
                                                        child: Image.asset(
                                                          'assets/images/scn_dashcam_app_logo.png',
                                                          width: 150.0,
                                                          height: 150.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            width: MediaQuery.of(context).size.width * 1.0,
                                                            height: 48.0,
                                                            decoration: BoxDecoration(color: FlutterFlowTheme.of(context).secondaryBackground),
                                                            child: TextFormField(
                                                              controller: controller.phoneController.value,
                                                              obscureText: false,
                                                              decoration: InputDecoration(
                                                                labelText: 'ชื่อผู้ใช้งาน',
                                                                labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                  fontFamily: 'Sarabun',
                                                                  color: FlutterFlowTheme.of(context).accent1,
                                                                ),
                                                                hintText: 'ใส่เบอร์โทรศัพท์ของคุณที่นี่...',
                                                                hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                  fontFamily: 'Sarabun',
                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                ),
                                                                enabledBorder: OutlineInputBorder(
                                                                  borderSide: const BorderSide(color: Color(0xFFD9D9D9), width: 1.0),
                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                ),
                                                                focusedBorder: OutlineInputBorder(
                                                                  borderSide: BorderSide(color: FlutterFlowTheme.of(context).secondary, width: 1.0),
                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                ),
                                                                errorBorder: OutlineInputBorder(
                                                                  borderSide: const BorderSide(color: Color(0x00000000), width: 1.0),
                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                ),
                                                                focusedErrorBorder: OutlineInputBorder(
                                                                  borderSide: const BorderSide(color: Color(0x00000000), width: 1.0),
                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                ),
                                                                filled: true,
                                                                fillColor: Colors.white,
                                                                contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 0.0, 12.0),
                                                              ),
                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                fontFamily: 'Sarabun',
                                                                color: FlutterFlowTheme.of(context).secondary,
                                                              ),
                                                              maxLines: null,
                                                              keyboardType: TextInputType.phone,
                                                              cursorColor: FlutterFlowTheme.of(context).secondary,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            width: MediaQuery.of(context).size.width * 1.0,
                                                            height: 48.0,
                                                            decoration: BoxDecoration(color: FlutterFlowTheme.of(context).secondaryBackground),
                                                            child: TextFormField(
                                                              controller: controller.passwordController.value,
                                                              obscureText: false,
                                                              decoration: InputDecoration(
                                                                labelText: 'รหัสผ่าน',
                                                                labelStyle: FlutterFlowTheme.of(context).bodyMedium,
                                                                hintText: 'ใส่รหัสผ่านของคุณที่นี่...',
                                                                hintStyle: FlutterFlowTheme.of(context).bodySmall,
                                                                enabledBorder: OutlineInputBorder(
                                                                  borderSide: const BorderSide(color: Color(0xFFD9D9D9), width: 1.0),
                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                ),
                                                                focusedBorder: OutlineInputBorder(
                                                                  borderSide: BorderSide(color: FlutterFlowTheme.of(context).secondary, width: 1.0),
                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                ),
                                                                errorBorder: OutlineInputBorder(
                                                                  borderSide: const BorderSide(color: Color(0x00000000), width: 1.0),
                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                ),
                                                                focusedErrorBorder: OutlineInputBorder(
                                                                  borderSide: const BorderSide(color: Color(0x00000000), width: 1.0),
                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                ),
                                                                filled: true,
                                                                fillColor: Colors.white,
                                                                contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 0.0, 24.0),
                                                                // suffixIcon: InkWell(
                                                                //   onTap: () => setState(
                                                                //     () => _model.passwordVisibility = !_model.passwordVisibility,
                                                                //   ),
                                                                //   focusNode: FocusNode(skipTraversal: true),
                                                                //   child: Icon(
                                                                //     _model.passwordVisibility ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                                                //     color: Color(0xFF95A1AC),
                                                                //     size: 20.0,
                                                                //   ),
                                                                // ),
                                                              ),
                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                fontFamily: 'Sarabun',
                                                                color: FlutterFlowTheme.of(context).secondary,
                                                              ),
                                                              cursorColor: FlutterFlowTheme.of(context).secondary,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Row(
                                                        mainAxisSize: MainAxisSize.max,
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          Theme(
                                                            data: ThemeData(
                                                              checkboxTheme: CheckboxThemeData(
                                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                                                              ),
                                                            ),
                                                            child: Obx(
                                                              () => Checkbox(
                                                                value: controller.checkboxValue1.value,
                                                                onChanged: (newValue) async {
                                                                  controller.checkboxValue1.value = !controller.checkboxValue1.value;
                                                                },
                                                                side: BorderSide(width: 2, color: FlutterFlowTheme.of(context).alternate),
                                                                activeColor: FlutterFlowTheme.of(context).primary,
                                                                checkColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            'จำรหัสผ่าน',
                                                            textAlign: TextAlign.start,
                                                            style: FlutterFlowTheme.of(
                                                              context,
                                                            ).bodyMedium.override(fontFamily: 'Sarabun', color: FlutterFlowTheme.of(context).accent1),
                                                          ),
                                                        ],
                                                      ),
                                                      InkWell(
                                                        splashColor: Colors.transparent,
                                                        focusColor: Colors.transparent,
                                                        hoverColor: Colors.transparent,
                                                        highlightColor: Colors.transparent,
                                                        onTap: () async {
                                                          // await Connection.setting(true);
                                                          // Navigator.push(
                                                          //   context,
                                                          //   MaterialPageRoute(
                                                          //     builder: (context) => ForgotpasswordWidget(),
                                                          //   ),
                                                          // );
                                                        },
                                                        child: Padding(
                                                          padding: const EdgeInsets.symmetric(horizontal: 18),
                                                          child: Text(
                                                            'ลืมรหัสผ่าน?',
                                                            textAlign: TextAlign.end,
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                              fontFamily: 'Sarabun',
                                                              color: FlutterFlowTheme.of(context).secondary,
                                                              decoration: TextDecoration.none,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.max,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                        child: Row(
                                                          mainAxisSize: MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: FFButtonWidget(
                                                                onPressed: () async {
                                                                  Get.offAllNamed(Routes.PINCODE);
                                                                  // if (_model.phone.text == '0922842655') {
                                                                  //   await Connection.setting(false);
                                                                  // } else {
                                                                  //   await Connection.setting(true);
                                                                  // }
                                                                  // await Future.delayed(const Duration(milliseconds: 0), () => handleLogin());
                                                                },
                                                                text: 'เข้าสู่ระบบ',
                                                                options: FFButtonOptions(
                                                                  height: 48.0,
                                                                  padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                    fontFamily: 'Sarabun',
                                                                    color: FlutterFlowTheme.of(context).white,
                                                                  ),
                                                                  elevation: 4.0,
                                                                  borderSide: const BorderSide(color: Colors.transparent, width: 1.0),
                                                                  borderRadius: BorderRadius.circular(40.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),

                                                      // Padding(
                                                      //   padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                      //   child: Row(
                                                      //     mainAxisSize: MainAxisSize.max,
                                                      //     children: [
                                                      //       const Expanded(
                                                      //         child: Padding(
                                                      //           padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                      //           child: Column(mainAxisSize: MainAxisSize.max, children: [Divider(thickness: 1.0)]),
                                                      //         ),
                                                      //       ),
                                                      //       Expanded(
                                                      //         child: Column(
                                                      //           mainAxisSize: MainAxisSize.max,
                                                      //           children: [
                                                      //             Row(
                                                      //               mainAxisSize: MainAxisSize.max,
                                                      //               mainAxisAlignment: MainAxisAlignment.center,
                                                      //               children: [
                                                      //                 Expanded(
                                                      //                   child: Text(
                                                      //                     'ลงทะเบียนบัญชี',
                                                      //                     textAlign: TextAlign.center,
                                                      //                     style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                      //                       fontFamily: 'Noto Sans',
                                                      //                       color: const Color(0xFF3F3F3F),
                                                      //                       fontSize: 12.0,
                                                      //                     ),
                                                      //                   ),
                                                      //                 ),
                                                      //               ],
                                                      //             ),
                                                      //           ],
                                                      //         ),
                                                      //       ),
                                                      //       const Expanded(
                                                      //         child: Padding(
                                                      //           padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                      //           child: Column(mainAxisSize: MainAxisSize.max, children: [Divider(thickness: 1.0)]),
                                                      //         ),
                                                      //       ),
                                                      //     ],
                                                      //   ),
                                                      // ),
                                                      // Padding(
                                                      //   padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 16.0),
                                                      //   child: Row(
                                                      //     mainAxisSize: MainAxisSize.max,
                                                      //     mainAxisAlignment: MainAxisAlignment.center,
                                                      //     children: [
                                                      //       Expanded(
                                                      //         child: FFButtonWidget(
                                                      //           onPressed: () async {
                                                      //             // await Connection.setting(true);
                                                      //             // Navigator.push(
                                                      //             //   context,
                                                      //             //   MaterialPageRoute(
                                                      //             //     builder: (context) => Register1Widget(),
                                                      //             //   ),
                                                      //             // );
                                                      //           },
                                                      //           text: 'ลงทะเบียนใช้งาน',
                                                      //           options: FFButtonOptions(
                                                      //             width: 130.0,
                                                      //             height: 48.0,
                                                      //             padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                      //             iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                      //             color: FlutterFlowTheme.of(context).primary,
                                                      //             textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                      //               fontFamily: 'Sarabun',
                                                      //               color: FlutterFlowTheme.of(context).white,
                                                      //             ),
                                                      //             elevation: 4.0,
                                                      //             borderSide: const BorderSide(color: Colors.transparent, width: 1.0),
                                                      //             borderRadius: BorderRadius.circular(40.0),
                                                      //           ),
                                                      //           showLoadingIndicator: false,
                                                      //         ),
                                                      //       ),
                                                      //     ],
                                                      //   ),
                                                      // ),
                                                      // Expanded(
                                                      //   child: Column(
                                                      //     mainAxisSize: MainAxisSize.max,
                                                      //     children: [
                                                      //       Row(
                                                      //         mainAxisSize: MainAxisSize.max,
                                                      //         mainAxisAlignment: MainAxisAlignment.center,
                                                      //         children: [
                                                      //           Expanded(
                                                      //             child: Text(
                                                      //               'version 1',
                                                      //               textAlign: TextAlign.center,
                                                      //               style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                      //                 fontFamily: 'Noto Sans',
                                                      //                 color: const Color(0xFF3F3F3F),
                                                      //                 fontSize: 12.0,
                                                      //               ),
                                                      //             ),
                                                      //           ),
                                                      //         ],
                                                      //       ),
                                                      //     ],
                                                      //   ),
                                                      // ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
