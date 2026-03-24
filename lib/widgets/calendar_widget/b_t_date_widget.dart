import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/date_picker_theme.dart';
import 'package:flutter_holo_date_picker/widget/date_picker_widget.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';

class BTDateWidget extends StatefulWidget {
  const BTDateWidget({
    Key? key,
    this.lastDate,
    this.firstDate,
    this.maxPastMonths,
  }) : super(key: key);
  final bool? lastDate;
  final bool? firstDate;
  final int? maxPastMonths;
  @override
  State<BTDateWidget> createState() => _BTDateWidgetState();
}

class _BTDateWidgetState extends State<BTDateWidget> {
  DateTime getDateTime = DateTime.now();

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
  }

  DateTime getFirstYear() {
    final year = DateTime.now().year - 100;
    return DateTime(year, 1, 1);
  }

  DateTime getFirstDate() {
    final year = DateTime.now().year;
    return DateTime(year, 1, 1);
  }

  DateTime getLastYear() {
    final year = DateTime.now().year + 50;
    return DateTime(year, 12, 31);
  }

  DateTime subtractMonths(DateTime date, int months) {
    final totalMonths = (date.year * 12 + date.month - 1) - months;
    final year = totalMonths ~/ 12;
    final month = (totalMonths % 12) + 1;
    final day = date.day;
    final lastDayOfMonth = DateTime(year, month + 1, 0).day;
    final safeDay = day > lastDayOfMonth ? lastDayOfMonth : day;
    return DateTime(year, month, safeDay);
  }

  DateTime getResolvedFirstDate() {
    final now = DateTime.now();
    final baseFirstDate = (widget.firstDate ?? false) ? now : getFirstYear();

    if (widget.maxPastMonths != null && widget.maxPastMonths! > 0) {
      final limitedFirstDate = subtractMonths(now, widget.maxPastMonths!);
      return limitedFirstDate.isAfter(baseFirstDate)
          ? limitedFirstDate
          : baseFirstDate;
    }

    return baseFirstDate;
  }

  DateTime getResolvedLastDate() {
    if (widget.maxPastMonths != null && widget.maxPastMonths! > 0) {
      return DateTime.now();
    }
    return (widget.lastDate ?? false) ? DateTime.now() : getLastYear();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.00, 1.00),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.4,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: const BorderRadius.only(
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
                              style: FlutterFlowTheme.of(context).bodyLarge
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(
                                      context,
                                    ).bodyLargeFamily,
                                    color: FlutterFlowTheme.of(context).error,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                          FlutterFlowTheme.of(
                                            context,
                                          ).bodyLargeFamily,
                                        ),
                                  ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 100.0,
                              height: 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(
                                  context,
                                ).secondaryBackground,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: 80.0,
                          height: 8.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(
                              context,
                            ).primaryBackground,
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 100.0,
                              height: 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(
                                  context,
                                ).secondaryBackground,
                              ),
                            ),
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
                            final dt = DateFormat(
                              "yyyy-MM-dd",
                            ).format(getDateTime);

                            final dt2 = DateFormat(
                              'วันที่ d MMMM พ.ศ.${getDateTime.year + 543}',
                              'th',
                            ).format(getDateTime);

                            Navigator.pop(context, [dt, dt2]);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 120,
                            child: Text(
                              'ตกลง',
                              style: FlutterFlowTheme.of(context).bodyLarge
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(
                                      context,
                                    ).bodyLargeFamily,
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                          FlutterFlowTheme.of(
                                            context,
                                          ).bodyLargeFamily,
                                        ),
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: DatePickerWidget(
                      looping: false,
                      dateFormat: "dd/MMMM/yyyy",
                      locale: DatePicker.localeFromString('th'),
                      firstDate: getResolvedFirstDate(),
                      lastDate: getResolvedLastDate(),
                      pickerTheme: DateTimePickerTheme(
                        pickerHeight: double.infinity,
                        backgroundColor: Colors.transparent,
                        itemTextStyle: FlutterFlowTheme.of(context).bodyLarge
                            .override(
                              fontFamily: FlutterFlowTheme.of(
                                context,
                              ).bodyLargeFamily,
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontWeight: FontWeight.w300,
                              fontSize: 24,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                              ),
                            ),
                        dividerColor: Colors.transparent,
                      ),
                      onChange: (dateTime, selectedIndex) {
                        getDateTime = dateTime;
                      },
                    ),
                  ),
                ].addToStart(const SizedBox(height: 16.0)),
              ),
            ),
          ].divide(const SizedBox(width: 16.0)).around(const SizedBox(width: 16.0)),
        ),
      ),
    );
  }
}
