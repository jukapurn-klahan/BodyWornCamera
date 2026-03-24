import 'package:badges/badges.dart' as badges;
import 'package:body_camera/flutter_flow/flutter_flow_button_tabbar.dart';
import 'package:body_camera/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../flutter_flow/flutter_flow_icon_button.dart';
import '../../../../flutter_flow/flutter_flow_theme_new.dart';
import '../../../../utils/date_utils.dart';
import '../../../../widgets/calendar_widget/b_t_date_widget.dart';
import '../../../../widgets/calendar_widget/b_t_month_widget.dart';
import '../../../../widgets/calendar_widget/b_t_year_widget.dart';
import '../controllers/history_camera_controller.dart';

class HistoryCameraView extends GetView<HistoryCameraController> {
  const HistoryCameraView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: FlutterFlowThemeNew.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowThemeNew.of(context).primary,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 54.0,
          icon: Icon(Icons.keyboard_arrow_left_rounded, color: Colors.white, size: 24.0),
          onPressed: () async {
            Get.back();
          },
        ),
        title: Text(
          'แจ้งเตือน',
          textAlign: TextAlign.center,
          style: FlutterFlowThemeNew.of(context).titleSmall.override(
            fontFamily: FlutterFlowThemeNew.of(context).titleSmallFamily,
            color: FlutterFlowThemeNew.of(context).secondaryBackground,
            letterSpacing: 0.0,
            useGoogleFonts: !FlutterFlowThemeNew.of(context).titleSmallIsCustom,
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
          gradient: LinearGradient(
            colors: [
              FlutterFlowThemeNew.of(context).primary,
              FlutterFlowThemeNew.of(context).primaryBackground,
              FlutterFlowThemeNew.of(context).primaryBackground,
            ],
            stops: [0.0, 0.3, 1.0],
            begin: const AlignmentDirectional(0.0, -1.0),
            end: const AlignmentDirectional(0, 1.0),
          ),
        ),
        child: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.fromLTRB(0, 16.0, 0, 100.0),
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  width: 100.0,
                  height: 130.0,
                  decoration: BoxDecoration(color: FlutterFlowThemeNew.of(context).secondaryBackground, borderRadius: BorderRadius.circular(26.0)),
                  child: Column(
                    children: [
                      Align(
                        alignment: const Alignment(0.0, 0),
                        child: FlutterFlowButtonTabBar(
                          useToggleButtonStyle: true,
                          labelStyle: FlutterFlowThemeNew.of(context).labelMedium.override(
                            fontFamily: FlutterFlowThemeNew.of(context).labelMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowThemeNew.of(context).labelMediumFamily),
                          ),
                          unselectedLabelStyle: FlutterFlowThemeNew.of(context).labelMedium.override(
                            fontFamily: FlutterFlowThemeNew.of(context).labelMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowThemeNew.of(context).labelMediumFamily),
                          ),
                          labelColor: FlutterFlowThemeNew.of(context).secondaryBackground,
                          unselectedLabelColor: FlutterFlowThemeNew.of(context).secondaryText,
                          backgroundColor: FlutterFlowThemeNew.of(context).primary,
                          unselectedBackgroundColor: const Color(0xFFEAEFFB),
                          unselectedBorderColor: FlutterFlowThemeNew.of(context).secondaryBackground,
                          borderWidth: 1.0,
                          borderRadius: 26.0,
                          elevation: 0.0,
                          buttonMargin: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                          padding: const EdgeInsets.all(4.0),
                          tabs: [
                            const Tab(text: 'วัน'),
                            const Tab(text: 'เดือน'),
                          ],
                          controller: controller.tabBarController1,
                        ),
                      ),

                      Expanded(
                        child: TabBarView(
                          controller: controller.tabBarController1,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: 100.0,
                                          height: 48.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowThemeNew.of(context).secondaryBackground,
                                            borderRadius: BorderRadius.circular(8.0),
                                            border: Border.all(color: FlutterFlowThemeNew.of(context).alternate),
                                          ),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              final _datePickedDate =
                                                  showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor: Colors.transparent,
                                                    context: context,
                                                    builder: (context) {
                                                      return Padding(
                                                        padding: MediaQuery.of(context).viewInsets,
                                                        child: const BTDateWidget(firstDate: false, maxPastMonths: 3),
                                                      );
                                                    },
                                                  ).then((value) async {
                                                    if (value != null) {
                                                      // controller.filterNewCaseByDate(DateTime.parse(value[0]));
                                                      // controller.ffilterCaseCompletedBydDate(DateTime.parse(value[0]));

                                                       controller.textControllerDate.value.text = ChangeDateUtils.formatThaiDate(value[0]);
                                                    }
                                                  });
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Align(
                                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                                    child: Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 0.0, 4.0),
                                                      child: TextFormField(
                                                        controller: controller.textControllerDate.value,
                                                        autofocus: false,
                                                        readOnly: true,
                                                        obscureText: false,
                                                        decoration: InputDecoration(
                                                          isDense: true,
                                                          hintStyle: FlutterFlowThemeNew.of(context).labelLarge.override(
                                                            fontFamily: FlutterFlowThemeNew.of(context).labelLargeFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                                              FlutterFlowThemeNew.of(context).labelLargeFamily,
                                                            ),
                                                          ),
                                                          enabledBorder: InputBorder.none,
                                                          focusedBorder: InputBorder.none,
                                                          errorBorder: InputBorder.none,
                                                          focusedErrorBorder: InputBorder.none,
                                                          contentPadding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                        ),
                                                        style: FlutterFlowThemeNew.of(context).bodyMedium.override(
                                                          fontFamily: FlutterFlowThemeNew.of(context).bodyMediumFamily,
                                                          letterSpacing: 0.0,
                                                          fontWeight: FontWeight.w500,
                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                                                            FlutterFlowThemeNew.of(context).bodyMediumFamily,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                  child: Icon(
                                                    Icons.calendar_month_rounded,
                                                    color: FlutterFlowThemeNew.of(context).primary,
                                                    size: 20.0,
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
                              ].divide(const SizedBox(height: 14.0)).addToStart(const SizedBox(height: 12.0)),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: 100.0,
                                          height: 48.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowThemeNew.of(context).secondaryBackground,
                                            borderRadius: BorderRadius.circular(8.0),
                                            border: Border.all(color: FlutterFlowThemeNew.of(context).alternate),
                                          ),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              final _datePickedDate =
                                                  showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor: Colors.transparent,
                                                    context: context,
                                                    builder: (context) {
                                                      return Padding(padding: MediaQuery.of(context).viewInsets, child: const BTMonthWidget());
                                                    },
                                                  ).then((value) async {
                                                    if (value != null) {
                                                      // controller.filterNewCaseByMonthString(value[0]);
                                                      // controller.filterCaseCompletedByMonthString(value[0]);
                                                      // controller.textControllerMonth.value.text = getThaiMonthName(value[0]);
                                                    }
                                                  });
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Align(
                                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                                    child: Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 0.0, 4.0),
                                                      child: TextFormField(
                                                        controller: controller.textControllerMonth.value,
                                                        autofocus: false,
                                                        readOnly: true,
                                                        obscureText: false,
                                                        decoration: InputDecoration(
                                                          isDense: true,
                                                          hintStyle: FlutterFlowThemeNew.of(context).labelLarge.override(
                                                            fontFamily: FlutterFlowThemeNew.of(context).labelLargeFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                                              FlutterFlowThemeNew.of(context).labelLargeFamily,
                                                            ),
                                                          ),
                                                          enabledBorder: InputBorder.none,
                                                          focusedBorder: InputBorder.none,
                                                          errorBorder: InputBorder.none,
                                                          focusedErrorBorder: InputBorder.none,
                                                          contentPadding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                        ),
                                                        style: FlutterFlowThemeNew.of(context).bodyMedium.override(
                                                          fontFamily: FlutterFlowThemeNew.of(context).bodyMediumFamily,
                                                          letterSpacing: 0.0,
                                                          fontWeight: FontWeight.w500,
                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                                                            FlutterFlowThemeNew.of(context).bodyMediumFamily,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                  child: Icon(
                                                    Icons.calendar_month_rounded,
                                                    color: FlutterFlowThemeNew.of(context).primary,
                                                    size: 20.0,
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
                              ].divide(const SizedBox(height: 14.0)).addToStart(const SizedBox(height: 12.0)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  height: () {
                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                      return 650.0;
                    } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                      return 650.0;
                    } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                      return 1000.0;
                    } else {
                      return 1000.0;
                    }
                  }(),
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 0.0, 0.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment(-1.0, 0),
                          child: TabBar(
                            labelColor: Color(0xFF164874),
                            unselectedLabelColor: FlutterFlowThemeNew.of(context).secondaryText,
                            labelStyle: FlutterFlowThemeNew.of(context).titleSmall.override(
                              fontFamily: FlutterFlowThemeNew.of(context).titleSmallFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowThemeNew.of(context).titleSmallFamily),
                            ),
                            unselectedLabelStyle: FlutterFlowThemeNew.of(context).labelLarge.override(
                              fontFamily: FlutterFlowThemeNew.of(context).labelLargeFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowThemeNew.of(context).labelLargeFamily),
                            ),
                            indicatorColor: Color(0xFF164874),
                            indicatorWeight: 2.0,
                            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                            tabs: [
                              Tab(text: 'รูปภาพ'),
                              Tab(text: 'วิดิโอ'),
                            ],
                            controller: controller.tabBarController2,
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: controller.tabBarController2,
                            children: [
                              Container(
                                child: ListView.builder(
                                  itemCount: 15,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                                      child: badges.Badge(
                                        showBadge: false,
                                        shape: badges.BadgeShape.circle,
                                        badgeColor: FlutterFlowThemeNew.of(context).primary,
                                        elevation: 4.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(6.0, 6.0, 6.0, 6.0),
                                        position: badges.BadgePosition.topEnd(end: -5, top: -3),
                                        animationType: badges.BadgeAnimationType.scale,
                                        toAnimate: true,
                                        child: Container(
                                          width: MediaQuery.of(context).size.width * 1.0,
                                          decoration: BoxDecoration(
                                            boxShadow: [BoxShadow(blurRadius: 3.0, color: Color(0x33000000), offset: Offset(0.0, 1.0))],
                                            color: Colors.white,

                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(8.0),
                                                  child: Image.asset('assets/images/car.png', width: 50.0, height: 50.0, fit: BoxFit.cover),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 0.0, 16.0),
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.max,
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize: MainAxisSize.max,
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                              child: Text(
                                                                'รายการบันทึก',
                                                                overflow: TextOverflow.ellipsis,
                                                                maxLines: 1,
                                                                style: FlutterFlowThemeNew.of(context).bodyLarge.override(
                                                                  fontFamily: 'Sarabun',
                                                                  lineHeight: 2.0,
                                                                  fontWeight: FontWeight.w500,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                        child: Text('3k', style: FlutterFlowThemeNew.of(context).bodySmall),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                          children: [Text('08/01/2569 14:54', style: FlutterFlowThemeNew.of(context).bodySmall)],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),

                              Container(
                                child: ListView.builder(
                                  itemCount: 15,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                                      child: badges.Badge(
                                        showBadge: false,
                                        shape: badges.BadgeShape.circle,
                                        badgeColor: FlutterFlowThemeNew.of(context).primary,
                                        elevation: 4.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(6.0, 6.0, 6.0, 6.0),
                                        position: badges.BadgePosition.topEnd(end: -5, top: -3),
                                        animationType: badges.BadgeAnimationType.scale,
                                        toAnimate: true,
                                        child: Container(
                                          width: MediaQuery.of(context).size.width * 1.0,
                                          decoration: BoxDecoration(
                                            boxShadow: [BoxShadow(blurRadius: 3.0, color: Color(0x33000000), offset: Offset(0.0, 1.0))],
                                            color: Colors.white,

                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(8.0),
                                                  child: Image.asset('assets/images/car.png', width: 50.0, height: 50.0, fit: BoxFit.cover),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 0.0, 16.0),
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.max,
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize: MainAxisSize.max,
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                              child: Text(
                                                                'รายการบันทึก',
                                                                overflow: TextOverflow.ellipsis,
                                                                maxLines: 1,
                                                                style: FlutterFlowThemeNew.of(context).bodyLarge.override(
                                                                  fontFamily: 'Sarabun',
                                                                  lineHeight: 2.0,
                                                                  fontWeight: FontWeight.w500,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                        child: Text('3k', style: FlutterFlowThemeNew.of(context).bodySmall),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                          children: [Text('08/01/2569 14:54', style: FlutterFlowThemeNew.of(context).bodySmall)],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ].divide(const SizedBox(height: 12.0)),
            ),
          ],
        ),
      ),
    );
  }
}
