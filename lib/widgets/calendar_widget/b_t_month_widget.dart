import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/date_picker_theme.dart';
import 'package:flutter_holo_date_picker/widget/date_picker_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class BTMonthWidget extends StatefulWidget {
  const BTMonthWidget({Key? key, this.maxPastMonths}) : super(key: key);
  final int? maxPastMonths;

  @override
  _BTMonthWidgetState createState() => _BTMonthWidgetState();
}

class _BTMonthWidgetState extends State<BTMonthWidget> {
  DateTime getDateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  DateTime getFirstYear() {
    final year = DateTime.now().year - 100;
    return DateTime(year, 1, 1);
  }

  DateTime getLastYear() {
    final year = DateTime.now().year;
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
    if (widget.maxPastMonths != null && widget.maxPastMonths! > 0) {
      final limitedFirstDate = subtractMonths(
        DateTime.now(),
        widget.maxPastMonths!,
      );
      return limitedFirstDate.isAfter(getFirstYear())
          ? limitedFirstDate
          : getFirstYear();
    }
    return getFirstYear();
  }

  DateTime getResolvedLastDate() {
    if (widget.maxPastMonths != null && widget.maxPastMonths! > 0) {
      return DateTime.now();
    }
    return getLastYear();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.00, 1.00),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.4,
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
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            final dt = DateFormat("MM").format(getDateTime);
                            Navigator.pop(context, [dt]);
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
                                    color: FlutterFlowTheme.of(
                                      context,
                                    ).secondary,
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
                      dateFormat: "MMMM", // Year only
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
                ].addToStart(SizedBox(height: 16.0)),
              ),
            ),
          ].divide(SizedBox(width: 16.0)).around(SizedBox(width: 16.0)),
        ),
      ),
    );
  }
}
