import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';


import '../../flutter_flow/flutter_flow_animations_pin.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'popup_success_model.dart';
export 'popup_success_model.dart';

class PopupSuccessWidget extends StatefulWidget {
  final String? message;
  const PopupSuccessWidget({super.key, this.message});

  @override
  State<PopupSuccessWidget> createState() => _PopupSuccessWidgetState();
}

class _PopupSuccessWidgetState extends State<PopupSuccessWidget> with TickerProviderStateMixin {
  late PopupSuccessModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopupSuccessModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [FadeEffect(curve: Curves.easeInOut, delay: 0.0.ms, duration: 46000.0.ms, begin: 0.0, end: 1.0)],
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
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 400.0,
        height: 420.0,
        decoration: BoxDecoration(color: FlutterFlowTheme.of(context).secondaryBackground, borderRadius: BorderRadius.circular(16.0)),
        child: Stack(
          children: [
            Container(
              width: 400.0,
              height: 420.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0x8019804C), Color(0x800BB05C)],
                  stops: [0.0, 1.0],
                  begin: AlignmentDirectional(0.56, -1.0),
                  end: AlignmentDirectional(-0.56, 1.0),
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
            ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(color: Color(0xE6FFFFFF), borderRadius: BorderRadius.circular(16.0)),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Lottie.asset(
                          'assets/lottie_animations/success_(2).json',
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
                            'สำเร็จ',
                            style: FlutterFlowTheme.of(context).titleMedium.override(
                              fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                              color: Color(0xFF19804C),
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              widget.message ?? 'บันทึกข้อมูลสำเร็จ',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                lineHeight: 1.25,
                              ),
                            ),
                          ),
                        ].divide(SizedBox(height: 4.0)),
                      ),
                    ].divide(SizedBox(height: 16.0)).addToStart(SizedBox(height: 16.0)).addToEnd(SizedBox(height: 16.0)),
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
