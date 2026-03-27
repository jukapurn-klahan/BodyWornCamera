import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../flutter_flow/flutter_flow_theme_new.dart';
import '../../../../flutter_flow/flutter_flow_util.dart';
import '../../../../flutter_flow/flutter_flow_widgets.dart';
import 'reson_cancel_model.dart';
export 'reson_cancel_model.dart';

class ResonCancelWidget extends StatefulWidget {
  const ResonCancelWidget({super.key});

  @override
  State<ResonCancelWidget> createState() => _ResonCancelWidgetState();
}

class _ResonCancelWidgetState extends State<ResonCancelWidget> {
  late ResonCancelModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResonCancelModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: () {
            if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
              return 600.0;
            } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
              return 600.0;
            } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
              return 450.0;
            } else {
              return 450.0;
            }
          }(),
          height: 300.0,
          decoration: BoxDecoration(color: FlutterFlowThemeNew.of(context).secondaryBackground, borderRadius: BorderRadius.circular(32.0)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'กรุณาระบุเหตุในการยกเลิก',
                      style: FlutterFlowThemeNew.of(context).bodyLarge.override(
                        fontFamily: FlutterFlowThemeNew.of(context).bodyLargeFamily,
                        letterSpacing: 0.0,
                        useGoogleFonts: !FlutterFlowThemeNew.of(context).bodyLargeIsCustom,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: SizedBox(
                        width: 200.0,
                        child: TextFormField(
                          controller: _model.textController,
                          focusNode: _model.textFieldFocusNode,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: false,
                            labelStyle: FlutterFlowThemeNew.of(context).labelMedium.override(
                              fontFamily: FlutterFlowThemeNew.of(context).labelMediumFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: !FlutterFlowThemeNew.of(context).labelMediumIsCustom,
                            ),
                            hintText: 'ระบุเหตุผล',
                            hintStyle: FlutterFlowThemeNew.of(context).labelSmall.override(
                              fontFamily: FlutterFlowThemeNew.of(context).labelSmallFamily,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: !FlutterFlowThemeNew.of(context).labelSmallIsCustom,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xFFBBBBBB), width: 1.0),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: FlutterFlowThemeNew.of(context).customColor5, width: 1.0),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: FlutterFlowThemeNew.of(context).error, width: 1.0),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: FlutterFlowThemeNew.of(context).error, width: 1.0),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowThemeNew.of(context).secondaryBackground,
                          ),
                          style: FlutterFlowThemeNew.of(context).titleSmall.override(
                            fontFamily: FlutterFlowThemeNew.of(context).titleSmallFamily,
                            color: FlutterFlowThemeNew.of(context).customColor5,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowThemeNew.of(context).titleSmallIsCustom,
                          ),
                          textAlign: TextAlign.start,
                          maxLines: 5,
                          cursorColor: FlutterFlowThemeNew.of(context).primary,
                          enableInteractiveSelection: false,
                          validator: _model.textControllerValidator.asValidator(context),
                        ),
                      ),
                    ),
                  ),
                ].divide(
                  SizedBox(
                    width: () {
                      if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                        return 80.0;
                      } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                        return 80.0;
                      } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                        return 150.0;
                      } else {
                        return 150.0;
                      }
                    }(),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 16.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          Get.back(result: null);
                        },
                        text: 'ยกเลิก',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: () {
                            if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                              return 48.0;
                            } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                              return 48.0;
                            } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                              return 56.0;
                            } else {
                              return 56.0;
                            }
                          }(),
                          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowThemeNew.of(context).secondaryBackground,
                          textStyle: FlutterFlowThemeNew.of(context).bodyMedium.override(
                            fontFamily: FlutterFlowThemeNew.of(context).bodyMediumFamily,
                            color: FlutterFlowThemeNew.of(context).secondaryText,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowThemeNew.of(context).bodyMediumIsCustom,
                          ),
                          elevation: 0.0,
                          borderSide: BorderSide(color: FlutterFlowThemeNew.of(context).secondaryText, width: 0.0),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 16.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          Get.back(result: {"text": _model.textController.text.isNotEmpty ? _model.textController.text : null, "status": true});
                        },
                        text: 'บันทึก',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: () {
                            if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                              return 48.0;
                            } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                              return 48.0;
                            } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                              return 56.0;
                            } else {
                              return 56.0;
                            }
                          }(),
                          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowThemeNew.of(context).customColor5,
                          textStyle: FlutterFlowThemeNew.of(context).bodyMedium.override(
                            fontFamily: FlutterFlowThemeNew.of(context).bodyMediumFamily,
                            color: FlutterFlowThemeNew.of(context).secondaryBackground,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowThemeNew.of(context).bodyMediumIsCustom,
                          ),
                          elevation: 0.0,
                          borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                    ),
                  ),
             
                ].divide(const SizedBox(width: 16.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
