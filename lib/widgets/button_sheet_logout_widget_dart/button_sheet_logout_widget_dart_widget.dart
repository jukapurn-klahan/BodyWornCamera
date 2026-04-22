import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../flutter_flow/flutter_flow_theme_new.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'button_sheet_logout_widget_dart_model.dart';
export 'button_sheet_logout_widget_dart_model.dart';

class ButtonSheetLogoutWidgetDartWidget extends StatefulWidget {
  const ButtonSheetLogoutWidgetDartWidget({super.key, this.onConfirm});

  final Future<void> Function()? onConfirm;

  @override
  State<ButtonSheetLogoutWidgetDartWidget> createState() => _ButtonSheetLogoutWidgetDartWidgetState();
}

class _ButtonSheetLogoutWidgetDartWidgetState extends State<ButtonSheetLogoutWidgetDartWidget> {
  late ButtonSheetLogoutWidgetDartModel _model;
  bool _isProcessingConfirm = false;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ButtonSheetLogoutWidgetDartModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    // _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color sheetBackground = Color(0xFFF7FAFF);
    const Color handleColor = Color(0xFFD5E3F6);
    const Color titleColor = Color(0xFF143B78);
    const Color confirmBackground = Color(0xFFE8F2FF);
    const Color confirmTextColor = Color(0xFF0D47A1);
    const Color cancelBackground = Color(0xFFFFEFEF);
    const Color cancelTextColor = Color(0xFFD83B30);
    const Color dividerColor = Color(0xFFE3ECF8);

    return Align(
      alignment: const AlignmentDirectional(0.00, 1.00),
      child: Container(
        width: double.infinity,
        height: 270.0,
        decoration: BoxDecoration(
          color: sheetBackground,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
          boxShadow: const [BoxShadow(blurRadius: 24.0, color: Color(0x1A143B78), offset: Offset(0.0, -6.0))],
        ),
        child: Align(
          alignment: const AlignmentDirectional(0.00, 1.00),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Handle
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 80.0,
                        height: 8.0,
                        decoration: BoxDecoration(color: handleColor, borderRadius: BorderRadius.circular(100.0)),
                      ),
                    ],
                  ),
                ],
              ),
              //แน่ใจว่าต้องการออกจากระบบหรือไม่
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        //แน่ใจว่าต้องการออกจากระบบหรือไม่
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'คุณต้องการออกจากระบบหรือไม่?',
                              style: FlutterFlowThemeNew.of(context).bodyLarge.override(
                                fontFamily: FlutterFlowThemeNew.of(context).bodyLargeFamily,
                                color: titleColor,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowThemeNew.of(context).bodyLargeFamily),
                              ),
                            ),
                          ].divide(const SizedBox(height: 16.0)).around(const SizedBox(height: 16.0)),
                        ),
                        const SizedBox(height: 8.0),
                        //ตกลง
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () async {
                              if (_isProcessingConfirm) {
                                return;
                              }

                              setState(() => _isProcessingConfirm = true);
                              Navigator.pop(context);
                              await widget.onConfirm?.call();
                            },
                            borderRadius: BorderRadius.circular(16.0),
                            child: Column(
                              children: [
                                Divider(height: 1.0, thickness: 1.0, color: dividerColor),
                                const SizedBox(height: 8.0),
                                Container(
                                  width: double.infinity,
                                  height: 56.0,

                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'ตกลง',
                                        style: FlutterFlowThemeNew.of(context).bodyMedium.override(
                                          fontFamily: FlutterFlowThemeNew.of(context).bodyMediumFamily,
                                          color: confirmTextColor,
                                          fontWeight: FontWeight.w700,
                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowThemeNew.of(context).bodyMediumFamily),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                              ],
                            ),
                          ),
                        ),

                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () async {
                              Navigator.pop(context);
                            },
                            borderRadius: BorderRadius.circular(16.0),
                            child: Column(
                              children: [
                                Divider(height: 1.0, thickness: 1.0, color: dividerColor),
                                const SizedBox(height: 8.0),
                                Container(
                                  width: 200.0,
                                  height: 56.0,

                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'ยกเลิก',
                                        style: FlutterFlowThemeNew.of(context).bodyMedium.override(
                                          fontFamily: FlutterFlowThemeNew.of(context).bodyMediumFamily,
                                          color: cancelTextColor,
                                          fontWeight: FontWeight.w700,
                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowThemeNew.of(context).bodyMediumFamily),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                              ],
                            ),
                          ),
                        ),
                      ], //.divide(const SizedBox(height: 8.0)),
                    ),
                  ),
                ].divide(const SizedBox(width: 24.0)).around(const SizedBox(width: 24.0)),
              ),
            ].divide(const SizedBox(height: 16.0)).around(const SizedBox(height: 16.0)),
          ),
        ),
      ),
    );
  }
}
