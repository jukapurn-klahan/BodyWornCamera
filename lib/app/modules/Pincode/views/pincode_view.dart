import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../flutter_flow/flutter_flow_theme_new.dart';

import 'package:body_camera/flutter_flow/flutter_flow_animations_pin.dart';
import 'package:body_camera/flutter_flow/flutter_flow_util.dart';
import 'package:body_camera/flutter_flow/flutter_flow_widgets.dart';

import '../controllers/pincode_controller.dart';

class PincodeView extends GetView<PinCodeController> {
  const PincodeView({
    super.key,
    // required this.isNewPassword,
  });

  //w final bool isNewPassword;
  static String pinCode = '';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: controller.scaffoldKey,
        backgroundColor: Color(0xFFF5F7FA),
        appBar: AppBar(
          backgroundColor: Color(0xFFF5F7FA),
          automaticallyImplyLeading: controller.isOpenProfile.value,
          leading: controller.isOpenProfile.value ? IconButton(onPressed: Get.back, icon: const Icon(Icons.arrow_back_rounded)) : null,
          title: Text(
            'PIN',
            style: FlutterFlowThemeNew.of(context).titleMedium.override(
              fontFamily: FlutterFlowThemeNew.of(context).titleMediumFamily,
              color: FlutterFlowThemeNew.of(context).primaryText,
              letterSpacing: 0.0,
              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowThemeNew.of(context).titleMediumFamily),
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              alignment: AlignmentDirectional(0.0, 1.0),
              image: Image.asset('assets/images/bg_pin.png').image,
            ),
            gradient: LinearGradient(
              colors: [
                Color(0xFFF5F7FA), // เลือดหมูเข้ม

                Color(0xFFF5F7FA),
                Color(0xFFF5F7FA),
              ],
              stops: [0.0, 0.4, 1.0],
              begin: AlignmentDirectional(0.0, -1.0),
              end: AlignmentDirectional(0, 1.0),
            ),
          ),
          child: Obx(() {
            if (!controller.isPinStateReady.value) {
              return const Center(child: CircularProgressIndicator());
            }

            return Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            width: () {
                              if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                return 200.0;
                              } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                return 200.0;
                              } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                return 400.0;
                              } else {
                                return 400.0;
                              }
                            }(),
                            height: () {
                              if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                return 200.0;
                              } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                return 200.0;
                              } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                return 400.0;
                              } else {
                                return 400.0;
                              }
                            }(),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    width: () {
                                      if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                        return 200.0;
                                      } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                        return 200.0;
                                      } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                        return 400.0;
                                      } else {
                                        return 400.0;
                                      }
                                    }(),
                                    height: () {
                                      if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                        return 200.0;
                                      } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                        return 200.0;
                                      } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                        return 400.0;
                                      } else {
                                        return 400.0;
                                      }
                                    }(),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: FlutterFlowThemeNew.of(context).primaryBlue),
                                    ),
                                  ).animateOnPageLoad(controller.animationsMap['containerOnPageLoadAnimation1']!),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    width: () {
                                      if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                        return 170.0;
                                      } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                        return 170.0;
                                      } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                        return 330.0;
                                      } else {
                                        return 330.0;
                                      }
                                    }(),
                                    height: () {
                                      if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                        return 170.0;
                                      } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                        return 170.0;
                                      } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                        return 330.0;
                                      } else {
                                        return 330.0;
                                      }
                                    }(),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: FlutterFlowThemeNew.of(context).primaryBlue),
                                    ),
                                  ).animateOnPageLoad(controller.animationsMap['containerOnPageLoadAnimation2']!),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    width: () {
                                      if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                        return 140.0;
                                      } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                        return 140.0;
                                      } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                        return 260.0;
                                      } else {
                                        return 260.0;
                                      }
                                    }(),
                                    height: () {
                                      if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                        return 140.0;
                                      } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                        return 140.0;
                                      } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                        return 260.0;
                                      } else {
                                        return 260.0;
                                      }
                                    }(),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: FlutterFlowThemeNew.of(context).primaryBlue),
                                    ),
                                  ).animateOnPageLoad(controller.animationsMap['containerOnPageLoadAnimation3']!),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    width: () {
                                      if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                        return 110.0;
                                      } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                        return 110.0;
                                      } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                        return 210.0;
                                      } else {
                                        return 210.0;
                                      }
                                    }(),
                                    height: () {
                                      if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                        return 110.0;
                                      } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                        return 110.0;
                                      } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                        return 210.0;
                                      } else {
                                        return 210.0;
                                      }
                                    }(),
                                    decoration: BoxDecoration(
                                      boxShadow: [BoxShadow(blurRadius: 16.0, color: Color(0x1AFFFFFF), offset: Offset(0.0, 0.0))],
                                      shape: BoxShape.circle,
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/Artboard_13.png',
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                controller.titleText,
                                textAlign: TextAlign.center,
                                style: FlutterFlowThemeNew.of(context).bodyLarge.override(
                                  fontFamily: FlutterFlowThemeNew.of(context).bodyLargeFamily,
                                  color: FlutterFlowThemeNew.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w300,
                                  lineHeight: 1.7,
                                  useGoogleFonts: !FlutterFlowThemeNew.of(context).bodyLargeIsCustom,
                                ),
                              ),
                              if (controller.helperText.isNotEmpty)
                                Text(
                                  controller.helperText,
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowThemeNew.of(context).bodySmall.override(
                                    fontFamily: FlutterFlowThemeNew.of(context).bodySmallFamily,
                                    color: controller.showErrorState
                                        ? FlutterFlowThemeNew.of(context).error
                                        : FlutterFlowThemeNew.of(context).secondaryText,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: !FlutterFlowThemeNew.of(context).bodySmallIsCustom,
                                  ),
                                ),
                            ].divide(const SizedBox(height: 4.0)),
                          ),
                        ].divide(SizedBox(height: 8.0)),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: () {
                            if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                              return 300.0;
                            } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                              return 300.0;
                            } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                              return 400.0;
                            } else {
                              return 400.0;
                            }
                          }(),
                          decoration: BoxDecoration(),
                          child: PinCodeTextField(
                            autoDisposeControllers: false,
                            appContext: context,
                            length: 6,
                            textStyle: FlutterFlowThemeNew.of(context).bodySmall.override(
                              fontFamily: FlutterFlowThemeNew.of(context).bodySmallFamily,
                              color: Color(0x006C6C6C),
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowThemeNew.of(context).bodySmallFamily),
                            ),
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            enableActiveFill: true,
                            autoFocus: false,
                            enablePinAutofill: false,
                            errorTextSpace: 0.0,
                            showCursor: false,
                            cursorColor: FlutterFlowThemeNew.of(context).primaryBlue,
                            obscureText: false,
                            keyboardType: TextInputType.number,
                            pinTheme: PinTheme(
                              fieldHeight: 20.0,
                              fieldWidth: 20.0,
                              borderWidth: 1.0,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(100.0),
                                bottomRight: Radius.circular(100.0),
                                topLeft: Radius.circular(100.0),
                                topRight: Radius.circular(100.0),
                              ),
                              shape: PinCodeFieldShape.circle,
                              activeColor: FlutterFlowThemeNew.of(context).customColor5,
                              inactiveColor: FlutterFlowThemeNew.of(context).primaryBlue,
                              selectedColor: FlutterFlowThemeNew.of(context).customColor5,
                              activeFillColor: FlutterFlowThemeNew.of(context).customColor5,
                              inactiveFillColor: Color(0x00E2E2E8),
                              selectedFillColor: FlutterFlowThemeNew.of(context).customColor5,
                            ),
                            controller: controller.pinCodeController.value,
                            onChanged: (_) async {},
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          0.0,
                          0.0,
                          valueOrDefault<double>(() {
                            if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                              return 32.0;
                            } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                              return 32.0;
                            } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                              return 24.0;
                            } else {
                              return 24.0;
                            }
                          }(), 0.0),
                        ),
                        child: Container(
                          width: () {
                            if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                              return 400.0;
                            } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                              return 400.0;
                            } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                              return 500.0;
                            } else {
                              return 500.0;
                            }
                          }(),
                          decoration: BoxDecoration(),
                          child: MasonryGridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: () {
                              if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                return 16.0;
                              } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                return 16.0;
                              } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                return 48.0;
                              } else {
                                return 48.0;
                              }
                            }(),
                            itemCount: 12,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return [
                                () => PINButtonWidget(caption: '1', onPressed: () => controller.enterPIN(1)),
                                () => PINButtonWidget(caption: '2', onPressed: () => controller.enterPIN(2)),
                                () => PINButtonWidget(caption: '3', onPressed: () => controller.enterPIN(3)),
                                () => PINButtonWidget(caption: '4', onPressed: () => controller.enterPIN(4)),
                                () => PINButtonWidget(caption: '5', onPressed: () => controller.enterPIN(5)),
                                () => PINButtonWidget(caption: '6', onPressed: () => controller.enterPIN(6)),
                                () => PINButtonWidget(caption: '7', onPressed: () => controller.enterPIN(7)),
                                () => PINButtonWidget(caption: '8', onPressed: () => controller.enterPIN(8)),
                                () => PINButtonWidget(caption: '9', onPressed: () => controller.enterPIN(9)),
                                () => Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Obx(() {
                                    if (controller.isNewPassword.value || !controller.hasSavedPinCode.value) {
                                      return Container();
                                    }
                                    if (controller.canUseBiometricAuth) {
                                      return FFButtonWidget(
                                        onPressed: controller.isAuthenticatingBiometric.value
                                            ? null
                                            : () {
                                                controller.authenticateWithBiometric();
                                              },
                                        text: '',
                                        icon: controller.isAuthenticatingBiometric.value
                                            ? SizedBox(
                                                width: 20.0,
                                                height: 20.0,
                                                child: CircularProgressIndicator(
                                                  color: FlutterFlowThemeNew.of(context).primaryBlue,
                                                  strokeWidth: 2.0,
                                                ),
                                              )
                                            : Icon(
                                                controller.isFaceIdAvailable.value ? Icons.face_rounded : FontAwesomeIcons.fingerprint,
                                                size: 22.0,
                                                color: FlutterFlowThemeNew.of(context).primaryBlue,
                                              ),
                                        options: FFButtonOptions(
                                          width: () {
                                            if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                              return 64.0;
                                            } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                              return 64.0;
                                            } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                              return 80.0;
                                            } else {
                                              return 80.0;
                                            }
                                          }(),
                                          height: () {
                                            if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                              return 64.0;
                                            } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                              return 64.0;
                                            } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                              return 80.0;
                                            } else {
                                              return 80.0;
                                            }
                                          }(),
                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                          color: Color(0x00FFFFFF),
                                          textStyle: FlutterFlowThemeNew.of(context).titleMedium.override(
                                            fontFamily: FlutterFlowThemeNew.of(context).titleMediumFamily,
                                            color: FlutterFlowThemeNew.of(context).primaryBlue,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowThemeNew.of(context).titleMediumFamily),
                                          ),
                                          elevation: 0.0,
                                          borderRadius: BorderRadius.circular(100.0),
                                          hoverColor: FlutterFlowThemeNew.of(context).primaryBlue,
                                          hoverTextColor: FlutterFlowThemeNew.of(context).secondaryBackground,
                                        ),
                                        showLoadingIndicator: false,
                                      );
                                    }
                                    return FFButtonWidget(
                                      onPressed: () {
                                        //   controller.forgotPIN();
                                      },
                                      text: 'ลืมรหัส PIN',
                                      options: FFButtonOptions(
                                        height: () {
                                          if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                            return 64.0;
                                          } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                            return 64.0;
                                          } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                            return 80.0;
                                          } else {
                                            return 80.0;
                                          }
                                        }(),
                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                        color: Color(0x005C6AC4),
                                        textStyle: FlutterFlowThemeNew.of(context).headlineSmall.override(
                                          fontFamily: FlutterFlowThemeNew.of(context).headlineSmallFamily,
                                          color: FlutterFlowThemeNew.of(context).primaryBlue,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowThemeNew.of(context).headlineSmallFamily),
                                        ),
                                        elevation: 0.0,
                                        borderRadius: BorderRadius.circular(100.0),
                                        hoverColor: FlutterFlowThemeNew.of(context).primaryBlue,
                                        hoverTextColor: FlutterFlowThemeNew.of(context).secondaryBackground,
                                      ),
                                      showLoadingIndicator: false,
                                    );
                                  }),
                                ),
                                () => PINButtonWidget(caption: '0', onPressed: () => controller.enterPIN(0)),
                                () => Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () {
                                      controller.deletePIN();
                                    },
                                    text: '',
                                    icon: FaIcon(FontAwesomeIcons.deleteLeft, size: 20.0),
                                    options: FFButtonOptions(
                                      width: () {
                                        if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                          return 64.0;
                                        } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                          return 64.0;
                                        } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                          return 80.0;
                                        } else {
                                          return 80.0;
                                        }
                                      }(),
                                      height: () {
                                        if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                          return 64.0;
                                        } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                          return 64.0;
                                        } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                          return 80.0;
                                        } else {
                                          return 80.0;
                                        }
                                      }(),
                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                      iconPadding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                                      color: Color(0x00FFFFFF),
                                      textStyle: FlutterFlowThemeNew.of(context).titleMedium.override(
                                        fontFamily: FlutterFlowThemeNew.of(context).titleMediumFamily,
                                        color: FlutterFlowThemeNew.of(context).primaryBlue,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowThemeNew.of(context).titleMediumFamily),
                                      ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(100.0),
                                      hoverColor: FlutterFlowThemeNew.of(context).primaryBlue,
                                      hoverTextColor: FlutterFlowThemeNew.of(context).secondaryBackground,
                                    ),
                                    showLoadingIndicator: false,
                                  ),
                                ),
                              ][index]();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class PINButtonWidget extends StatelessWidget {
  const PINButtonWidget({super.key, required this.onPressed, required this.caption});

  final String caption;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: onPressed,
      text: caption,
      options: FFButtonOptions(
        width: () {
          if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
            return 64.0;
          } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
            return 64.0;
          } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
            return 80.0;
          } else {
            return 80.0;
          }
        }(),
        height: () {
          if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
            return 64.0;
          } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
            return 64.0;
          } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
            return 80.0;
          } else {
            return 80.0;
          }
        }(),
        padding: EdgeInsets.all(0.0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: Color(0x00FFFFFF),
        textStyle: FlutterFlowThemeNew.of(context).headlineSmall.override(
          fontFamily: FlutterFlowThemeNew.of(context).headlineSmallFamily,
          color: FlutterFlowThemeNew.of(context).primaryBlue,
          letterSpacing: 0.0,
          useGoogleFonts: !FlutterFlowThemeNew.of(context).headlineSmallIsCustom,
        ),
        elevation: 0.0,
        borderRadius: BorderRadius.circular(100.0),
        hoverColor: FlutterFlowThemeNew.of(context).primaryBlue,
        hoverTextColor: FlutterFlowThemeNew.of(context).secondaryBackground,
      ),
      showLoadingIndicator: false,
    );
  }
}
