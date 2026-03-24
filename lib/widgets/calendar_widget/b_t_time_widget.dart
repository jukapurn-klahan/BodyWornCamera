import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:developer' as dev;

class BTTimeWidget extends StatefulWidget {
  final Duration? time;
  const BTTimeWidget({Key? key, this.time}) : super(key: key);

  @override
  _BTTimeWidgetState createState() => _BTTimeWidgetState();
}

class _BTTimeWidgetState extends State<BTTimeWidget> {
  // late BTTimeModel _model;
  DateTime getTime = DateTime.now();

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
  }

  @override
  void initState() {
    super.initState();

   // getTimeServer();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
  }

  // Future<DateTime> getDateTimeServer(String formate) async {
  //   final DioResponse statusResponse = await serviceLocator<EHPApi>().dioClient.get('/Status', authHeader: '');
  //   var tempDate = DateTime.now();
  //   if (await EHPApi.checkResponseIsValid(statusResponse)) {
  //     DateTime resDT = DateTime.parse(statusResponse.data['RequestTime']);
  //     var dtChange = DateFormat(formate).format(resDT);
  //     tempDate = DateTime.parse(dtChange);
  //   }
  //   return tempDate;
  // }

  // Future<void> getTimeServer() async {
  //   if (widget.time != null) {
  //     final _time = widget.time! + Duration(minutes: 1);
  //     getTime = DateTime.parse('2023-10-10' + ' ${_time}');
  //   } else {
  //     getTime = await getDateTimeServer("yyyy-MM-dd HH:mm:ss");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.00, 1.00),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.33,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            Navigator.pop(context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 120,
                            child: Text(
                              'ยกเลิก',
                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                color: FlutterFlowTheme.of(context).error,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(width: 100.0, height: 1.0, decoration: BoxDecoration(color: FlutterFlowTheme.of(context).secondaryBackground)),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: 80.0,
                          height: 8.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(width: 100.0, height: 1.0, decoration: BoxDecoration(color: FlutterFlowTheme.of(context).secondaryBackground)),
                          ],
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            final g = DateFormat('HH:mm').format(getTime!) + ":00";
                            final dt = durationParse(g);
                            Navigator.pop(context, [dt]);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 120,
                            child: Text(
                              'ตกลง',
                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                color: FlutterFlowTheme.of(context).primary,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TimePickerSpinner(
                      time: getTime,
                      is24HourMode: true,
                      isShowSeconds: false,
                      normalTextStyle: TextStyle(fontSize: 24, color: FlutterFlowTheme.of(context).secondaryText),
                      highlightedTextStyle: TextStyle(fontSize: 24, color: FlutterFlowTheme.of(context).primary),
                      isForce2Digits: true,
                      spacing: 50,
                      itemHeight: 60,
                      onTimeChange: (value) {
                        getTime = value;
                      },
                    ),
                  ),
                ].divide(SizedBox(height: 24.0)).addToStart(SizedBox(height: 16.0)),
              ),
            ),
          ].divide(SizedBox(width: 16.0)).around(SizedBox(width: 16.0)),
        ),
      ),
    );
  }
}

Duration? durationParse(String time) {
  try {
    final dt = DateFormat('HH:mm:ss').parse(time);
    // final dt = DateTime.parse('2000-01-01 $time');
    return Duration(hours: dt.hour, minutes: dt.minute, seconds: dt.second);
  } catch (e) {
    debugPrint('durationParse error $time $e');
  }
}