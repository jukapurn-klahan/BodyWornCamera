import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../../flutter_flow/flutter_flow_animations.dart';
import '../../../flutter_flow/flutter_flow_theme.dart';
import '../../../flutter_flow/flutter_flow_util.dart';
import '../../../flutter_flow/flutter_flow_widgets.dart';
import 'popup_warning_model.dart';
export 'popup_warning_model.dart';

class PopupWarningWidget extends StatefulWidget {
  const PopupWarningWidget({
    super.key,
    required this.message,
    this.acceptText,
    this.cancel,
  });
  final String message;
  final String? acceptText;
  final bool? cancel;

  @override
  State<PopupWarningWidget> createState() => _PopupWarningWidgetState();
}

class _PopupWarningWidgetState extends State<PopupWarningWidget>
    with TickerProviderStateMixin {
  late PopupWarningModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopupWarningModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effects: [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.ms,
            duration: 250.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeOut,
            delay: 0.ms,
            duration: 250.ms,
            begin: const Offset(0.96, 0.96),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
      child: Container(
        width: 400.0,
        height: (MediaQuery.sizeOf(context).width < kBreakpointSmall)
            ? 420.0
            : 430.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Stack(
          children: [
            Container(
              width: 400.0,
              height: 420.0,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0x7FE68B1B), Color(0x7FF5B224)],
                  stops: [0.0, 1.0],
                  begin: AlignmentDirectional(0.56, -1.0),
                  end: AlignmentDirectional(-0.56, 1.0),
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
            ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xE6FFFFFF),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:
                        [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Lottie.asset(
                                  'assets/lottie_animations/warning.json',
                                  width: 220.0,
                                  height: 220.0,
                                  fit: BoxFit.cover,
                                  frameRate: FrameRate(24.0),
                                  animate: true,
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    widget.message,
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: FlutterFlowTheme.of(
                                            context,
                                          ).titleMediumFamily,
                                          color: const Color(0xFFE68B1B),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                FlutterFlowTheme.of(
                                                  context,
                                                ).titleMediumFamily,
                                              ),
                                        ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16.0),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (widget.cancel == true)
                                            Expanded(
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  Navigator.pop(context, false);
                                                },
                                                text: 'ยกเลิก',
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 48.0,
                                                  padding:
                                                      const EdgeInsetsDirectional.fromSTEB(
                                                        24.0,
                                                        0.0,
                                                        24.0,
                                                        0.0,
                                                      ),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional.fromSTEB(
                                                        0.0,
                                                        0.0,
                                                        0.0,
                                                        0.0,
                                                      ),
                                                  color: FlutterFlowTheme.of(
                                                    context,
                                                  ).error,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                        context,
                                                      ).bodyLarge.override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                              context,
                                                            ).bodyLargeFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                              context,
                                                            ).secondaryBackground,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts:
                                                            GoogleFonts.asMap()
                                                                .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                    context,
                                                                  ).bodyLargeFamily,
                                                                ),
                                                      ),
                                                  elevation: 0.0,
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        100.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          Expanded(
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                Navigator.pop(context, true);
                                              },
                                              text: widget.acceptText ?? 'ตกลง',
                                              options: FFButtonOptions(
                                                width: double.infinity,
                                                height: 48.0,
                                                padding:
                                                    const EdgeInsetsDirectional.fromSTEB(
                                                      24.0,
                                                      0.0,
                                                      24.0,
                                                      0.0,
                                                    ),
                                                iconPadding:
                                                    const EdgeInsetsDirectional.fromSTEB(
                                                      0.0,
                                                      0.0,
                                                      0.0,
                                                      0.0,
                                                    ),
                                                color: FlutterFlowTheme.of(
                                                  context,
                                                ).primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(
                                                      context,
                                                    ).bodyLarge.override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                            context,
                                                          ).bodyLargeFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                            context,
                                                          ).secondaryBackground,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      useGoogleFonts:
                                                          GoogleFonts.asMap()
                                                              .containsKey(
                                                                FlutterFlowTheme.of(
                                                                  context,
                                                                ).bodyLargeFamily,
                                                              ),
                                                    ),
                                                elevation: 0.0,
                                                borderSide: const BorderSide(
                                                  color: Colors.transparent,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                      100.0,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 8.0)),
                                      ),
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 4.0)),
                              ),
                            ]
                            .divide(const SizedBox(height: 16.0))
                            .addToStart(const SizedBox(height: 16.0))
                            .addToEnd(const SizedBox(height: 16.0)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
