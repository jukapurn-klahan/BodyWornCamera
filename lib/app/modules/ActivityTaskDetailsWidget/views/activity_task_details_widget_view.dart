import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_map/flutter_map.dart' as map2;

import '../../../../flutter_flow/flutter_flow_icon_button.dart';
import '../../../../flutter_flow/flutter_flow_theme_new.dart';
import '../../../../flutter_flow/flutter_flow_util.dart';
import '../controllers/activity_task_details_widget_controller.dart';

class ActivityTaskDetailsWidgetView extends GetView<ActivityTaskDetailsWidgetController> {
  const ActivityTaskDetailsWidgetView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,

      backgroundColor: FlutterFlowThemeNew.of(context).primary,
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
          'ข้อมูลกิจกรรม',
          style: FlutterFlowThemeNew.of(context).titleSmall.override(
            fontFamily: FlutterFlowThemeNew.of(context).titleSmallFamily,
            color: FlutterFlowThemeNew.of(context).secondaryBackground,
            letterSpacing: 0.0,
            useGoogleFonts: !FlutterFlowThemeNew.of(context).titleSmallIsCustom,
          ),
        ),
        actions: [],
        bottom: PreferredSize(preferredSize: Size.fromHeight(8.0), child: Container()),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowThemeNew.of(context).primaryBackground,
          boxShadow: [BoxShadow(blurRadius: 8.0, color: Color(0x33000000), offset: Offset(0.0, 0.0))],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(0, 16.0, 0, 24.0),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,

                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
                      child: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowThemeNew.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                image: DecorationImage(fit: BoxFit.cover, image: Image.asset('assets/images/bgappbar.png').image),
                                boxShadow: [BoxShadow(blurRadius: 8.0, color: Color(0x1A000000), offset: Offset(0.0, 0.0), spreadRadius: 0.0)],
                                gradient: LinearGradient(
                                  colors: [Color(0xFF2370BC), FlutterFlowThemeNew.of(context).primary],
                                  stops: [0.0, 1.0],
                                  begin: AlignmentDirectional(0.0, -1.0),
                                  end: AlignmentDirectional(0, 1.0),
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  controller.title,
                                                  style: FlutterFlowThemeNew.of(context).titleSmall.override(
                                                    fontFamily: FlutterFlowThemeNew.of(context).titleSmallFamily,
                                                    color: FlutterFlowThemeNew.of(context).secondaryBackground,
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts: !FlutterFlowThemeNew.of(context).titleSmallIsCustom,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (controller.priorityLabel.isNotEmpty)
                                                Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        colors: controller.priorityGradientColors,
                                                        stops: [0.0, 1.0],
                                                        begin: AlignmentDirectional(1.0, 0.87),
                                                        end: AlignmentDirectional(-1.0, -0.87),
                                                      ),
                                                      borderRadius: BorderRadius.circular(100.0),
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 8.0, 4.0),
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                            child: Icon(
                                                              controller.priorityIcon,
                                                              color: FlutterFlowThemeNew.of(context).secondaryBackground,
                                                              size: 16.0,
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                            child: Text(
                                                              controller.priorityLabel,
                                                              style: FlutterFlowThemeNew.of(context).labelSmall.override(
                                                                fontFamily: FlutterFlowThemeNew.of(context).labelSmallFamily,
                                                                color: FlutterFlowThemeNew.of(context).secondaryBackground,
                                                                fontSize: 12.0,
                                                                letterSpacing: 0.0,
                                                                shadows: [
                                                                  Shadow(color: Color(0x0F6C6C6C), offset: Offset(2.0, 2.0), blurRadius: 2.0),
                                                                ],
                                                                useGoogleFonts: !FlutterFlowThemeNew.of(context).labelSmallIsCustom,
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(width: 4.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ข้อมูลวันที่',
                          textAlign: TextAlign.start,
                          style: FlutterFlowThemeNew.of(context).labelMedium.override(
                            fontFamily: FlutterFlowThemeNew.of(context).labelMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowThemeNew.of(context).labelMediumIsCustom,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowThemeNew.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (controller.reportCode.isNotEmpty)
                                  Row(
                                    children: [
                                      Expanded(child: _buildReportCodeField(context)),
                                      Expanded(child: _buildDateField(context)),
                                    ].divide(const SizedBox(width: 12.0)),
                                  )
                                else
                                  _buildDateField(context),
                                Row(
                                  children: [
                                    Expanded(
                                      child: _buildTimeField(
                                        context,
                                        label: 'เวลาเริ่มต้น',
                                        value: controller.startTimeText,
                                        icon: Icons.play_circle_fill_rounded,
                                      ),
                                    ),
                                    const SizedBox(width: 12.0),
                                    Expanded(
                                      child: _buildTimeField(
                                        context,
                                        label: 'ระยะเวลา',
                                        value: controller.durationText,
                                        icon: Icons.timelapse_rounded,
                                      ),
                                    ),
                                  ],
                                ),
                                _buildTimeField(context, label: 'เวลาสิ้นสุด', value: controller.endTimeText, icon: Icons.stop_circle_rounded),
                              ].divide(const SizedBox(height: 12.0)),
                            ),

                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: () {
                                        if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                          return 24.0;
                                        } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                          return 24.0;
                                        } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                          return 32.0;
                                        } else {
                                          return 32.0;
                                        }
                                      }(),
                                      height: () {
                                        if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                          return 24.0;
                                        } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                          return 24.0;
                                        } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                          return 32.0;
                                        } else {
                                          return 32.0;
                                        }
                                      }(),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [const Color(0xFF14B8A6), const Color(0xFF0F766E)],
                                          stops: [0.0, 1.0],
                                          begin: AlignmentDirectional(0.0, -1.0),
                                          end: AlignmentDirectional(0, 1.0),
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Align(
                                        alignment: AlignmentDirectional(0.0, 0.0),
                                        child: Icon(Icons.badge_rounded, color: FlutterFlowThemeNew.of(context).secondaryBackground, size: 14.0),
                                      ),
                                    ),
                                    Text(
                                      'เจ้าหน้าที่',
                                      style: FlutterFlowThemeNew.of(context).labelSmall.override(
                                        fontFamily: FlutterFlowThemeNew.of(context).labelSmallFamily,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: !FlutterFlowThemeNew.of(context).labelSmallIsCustom,
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 8.0)),
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowThemeNew.of(context).primaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Text(
                                        controller.officerName,
                                        style: FlutterFlowThemeNew.of(context).bodyMedium.override(
                                          fontFamily: FlutterFlowThemeNew.of(context).bodyMediumFamily,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          lineHeight: 1.5,
                                          useGoogleFonts: !FlutterFlowThemeNew.of(context).bodyMediumIsCustom,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(height: 8.0)),
                            ),

                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: () {
                                        if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                          return 24.0;
                                        } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                          return 24.0;
                                        } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                          return 32.0;
                                        } else {
                                          return 32.0;
                                        }
                                      }(),
                                      height: () {
                                        if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                          return 24.0;
                                        } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                          return 24.0;
                                        } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                          return 32.0;
                                        } else {
                                          return 32.0;
                                        }
                                      }(),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [const Color(0xFF6366F1), const Color(0xFF1D4ED8)],
                                          stops: [0.0, 1.0],
                                          begin: AlignmentDirectional(0.0, -1.0),
                                          end: AlignmentDirectional(0, 1.0),
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Align(
                                        alignment: AlignmentDirectional(0.0, 0.0),
                                        child: Icon(Icons.videocam_rounded, color: FlutterFlowThemeNew.of(context).secondaryBackground, size: 14.0),
                                      ),
                                    ),
                                    Text(
                                      'กล้อง',
                                      style: FlutterFlowThemeNew.of(context).labelSmall.override(
                                        fontFamily: FlutterFlowThemeNew.of(context).labelSmallFamily,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: !FlutterFlowThemeNew.of(context).labelSmallIsCustom,
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 8.0)),
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowThemeNew.of(context).primaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Text(
                                      controller.deviceText,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: FlutterFlowThemeNew.of(context).bodyMedium.override(
                                        fontFamily: FlutterFlowThemeNew.of(context).bodyMediumFamily,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        lineHeight: 1.5,
                                        useGoogleFonts: !FlutterFlowThemeNew.of(context).bodyMediumIsCustom,
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(height: 8.0)),
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ข้อมูลสถานที่',
                          textAlign: TextAlign.start,
                          style: FlutterFlowThemeNew.of(context).labelMedium.override(
                            fontFamily: FlutterFlowThemeNew.of(context).labelMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowThemeNew.of(context).labelMediumIsCustom,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowThemeNew.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: () {
                                        if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                          return 24.0;
                                        } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                          return 24.0;
                                        } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                          return 32.0;
                                        } else {
                                          return 32.0;
                                        }
                                      }(),
                                      height: () {
                                        if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                          return 24.0;
                                        } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                          return 24.0;
                                        } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                          return 32.0;
                                        } else {
                                          return 32.0;
                                        }
                                      }(),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [FlutterFlowThemeNew.of(context).primary, Color(0xFF216DAA)],
                                          stops: [0.0, 1.0],
                                          begin: AlignmentDirectional(0.0, -1.0),
                                          end: AlignmentDirectional(0, 1.0),
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Align(
                                        alignment: AlignmentDirectional(0.0, 0.0),
                                        child: Icon(
                                          Icons.location_on_rounded,
                                          color: FlutterFlowThemeNew.of(context).secondaryBackground,
                                          size: () {
                                            if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                              return 12.0;
                                            } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                              return 12.0;
                                            } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                              return 16.0;
                                            } else {
                                              return 16.0;
                                            }
                                          }(),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'สถานที่',
                                        style: FlutterFlowThemeNew.of(context).labelSmall.override(
                                          fontFamily: FlutterFlowThemeNew.of(context).labelSmallFamily,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: !FlutterFlowThemeNew.of(context).labelSmallIsCustom,
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 8.0)),
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowThemeNew.of(context).primaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Text(
                                        controller.locationText,
                                        style: FlutterFlowThemeNew.of(context).bodyMedium.override(
                                          fontFamily: FlutterFlowThemeNew.of(context).bodyMediumFamily,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          lineHeight: 1.5,
                                          useGoogleFonts: !FlutterFlowThemeNew.of(context).bodyMediumIsCustom,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8.0),

                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: _buildCoordinateCard(
                                        context,
                                        icon: Icons.swap_vert_rounded,
                                        label: 'ละติจูด',
                                        value: controller.latitudeText,
                                      ),
                                    ),
                                    Expanded(
                                      child: _buildCoordinateCard(
                                        context,
                                        icon: Icons.swap_horiz_rounded,
                                        label: 'ลองจิจูด',
                                        value: controller.longitudeText,
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 10.0)),
                                ),
                              ].divide(const SizedBox(height: 8.0)),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.0),
                              border: Border.all(color: FlutterFlowThemeNew.of(context).secondaryBackground),
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: SizedBox(
                              width: double.infinity,
                              height: 200.0,
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: Obx(
                                      () => map2.FlutterMap(
                                        mapController: controller.mapController,
                                        options: map2.MapOptions(
                                          enableScrollWheel: true,
                                          minZoom: 10,
                                          zoom: 13,
                                          maxZoom: 19,
                                          center: controller.latLng,
                                          interactiveFlags:
                                              map2.InteractiveFlag.pinchZoom | map2.InteractiveFlag.drag | map2.InteractiveFlag.doubleTapZoom,
                                        ),
                                        children: [
                                          map2.TileLayer(
                                            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                                            userAgentPackageName: controller.tileUserAgentPackageName,
                                            subdomains: const ['a', 'b', 'c'],
                                            maxZoom: 19,
                                            minZoom: 10,
                                          ),
                                          map2.MarkerLayer(markers: controller.markersMap.toList()),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 12.0,
                                    bottom: 12.0,
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(999.0),
                                        onTap: () => Get.to(() => ActivityTaskFullScreenMapView(activityController: controller)),
                                        child: Container(
                                          width: 42.0,
                                          height: 42.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowThemeNew.of(context).secondaryBackground.withValues(alpha: 0.92),
                                            shape: BoxShape.circle,
                                            boxShadow: const [BoxShadow(blurRadius: 12.0, color: Color(0x26000000), offset: Offset(0.0, 4.0))],
                                          ),
                                          child: Icon(Icons.fullscreen_rounded, color: FlutterFlowThemeNew.of(context).primaryText, size: 24.0),
                                        ),
                                      ),
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
                ].divide(SizedBox(height: 16.0)),
              ),
            ),

            // Container(
            //   width: double.infinity,
            //   decoration: BoxDecoration(
            //     color: FlutterFlowThemeNew.of(context).secondaryBackground,
            //     boxShadow: [BoxShadow(blurRadius: 4.0, color: Color(0x33000000), offset: Offset(0.0, 0.0))],
            //     borderRadius: BorderRadius.only(
            //       bottomLeft: Radius.circular(0.0),
            //       bottomRight: Radius.circular(0.0),
            //       topLeft: Radius.circular(24.0),
            //       topRight: Radius.circular(24.0),
            //     ),
            //   ),
            //   child: Padding(
            //     padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 24.0),
            //     child: MasonryGridView.builder(
            //       physics: const NeverScrollableScrollPhysics(),
            //       gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            //       crossAxisSpacing: 8.0,
            //       mainAxisSpacing: 8.0,
            //       itemCount: 2,
            //       shrinkWrap: true,
            //       itemBuilder: (context, index) {
            //         return [
            //           () => InkWell(
            //             splashColor: Colors.transparent,
            //             focusColor: Colors.transparent,
            //             hoverColor: Colors.transparent,
            //             highlightColor: Colors.transparent,
            //             onTap: () async {
            //               showModalBottomSheet(
            //                 context: context,
            //                 isScrollControlled: true, // ✅ ควบคุมเอง
            //                 backgroundColor: Colors.transparent,
            //                 builder: (context) {
            //                   return MediaQuery.removeViewInsets(
            //                     // ✅ ตัด effect ของ keyboard
            //                     removeBottom: true,
            //                     context: context,
            //                     child: const ResonCancelWidget(),
            //                   );
            //                 },
            //               ).then((result) async {
            //                 if (result != null && result is Map) {
            //                   final text = result["text"] as String?;
            //                   final status = result["status"] == true;

            //                   debugPrint('ข้อความ: $text');
            //                   debugPrint('สถานะ: $status');

            //                   //  await controller.dosaveData(3, reason: text).then((_) => Get.back(result: true));
            //                 }
            //               });
            //             },
            //             child: Container(
            //               width: 100.0,
            //               height: 48.0,
            //               decoration: BoxDecoration(
            //                 color: FlutterFlowThemeNew.of(context).secondaryBackground,
            //                 borderRadius: BorderRadius.circular(100.0),
            //                 border: Border.all(color: FlutterFlowThemeNew.of(context).alternate, width: 1.0),
            //               ),
            //               child: Align(
            //                 alignment: AlignmentDirectional(0.0, 0.0),
            //                 child: Text(
            //                   'ปฏิเสธ',
            //                   style: FlutterFlowThemeNew.of(context).labelMedium.override(
            //                     fontFamily: FlutterFlowThemeNew.of(context).labelMediumFamily,
            //                     color: FlutterFlowThemeNew.of(context).error,
            //                     letterSpacing: 0.0,
            //                     useGoogleFonts: !FlutterFlowThemeNew.of(context).labelMediumIsCustom,
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ),
            //           () => InkWell(
            //             splashColor: Colors.transparent,
            //             focusColor: Colors.transparent,
            //             hoverColor: Colors.transparent,
            //             highlightColor: Colors.transparent,
            //             onTap: () async {},
            //             child: Container(
            //               width: 100.0,
            //               height: 48.0,
            //               decoration: BoxDecoration(
            //                 gradient: LinearGradient(
            //                   colors: [FlutterFlowThemeNew.of(context).success, Color(0xFF1D8B6B)],
            //                   stops: [0.0, 1.0],
            //                   begin: AlignmentDirectional(0.0, -1.0),
            //                   end: AlignmentDirectional(0, 1.0),
            //                 ),
            //                 borderRadius: BorderRadius.circular(100.0),
            //               ),
            //               child: Align(
            //                 alignment: AlignmentDirectional(0.0, 0.0),
            //                 child: Text(
            //                   'รับงาน',
            //                   style: FlutterFlowThemeNew.of(context).labelMedium.override(
            //                     fontFamily: FlutterFlowThemeNew.of(context).labelMediumFamily,
            //                     color: FlutterFlowThemeNew.of(context).secondaryBackground,
            //                     letterSpacing: 0.0,
            //                     useGoogleFonts: !FlutterFlowThemeNew.of(context).labelMediumIsCustom,
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ][index]();
            //       },
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildCoordinateCard(BuildContext context, {required IconData icon, required String label, required String value}) {
    final theme = FlutterFlowThemeNew.of(context);
    final accentColors = label == 'ละติจูด' ? const [Color(0xFF14B8A6), Color(0xFF0F766E)] : const [Color(0xFF3B82F6), Color(0xFF1D4ED8)];

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [theme.secondaryBackground, const Color(0xFFF7FAFF)],
          stops: const [0.0, 1.0],
          begin: const AlignmentDirectional(0.0, -1.0),
          end: const AlignmentDirectional(0.0, 1.0),
        ),
        borderRadius: BorderRadius.circular(18.0),
        border: Border.all(color: const Color(0xFFD8E3F2)),
        boxShadow: const [
          BoxShadow(blurRadius: 16.0, color: Color(0x12000000), offset: Offset(0.0, 8.0)),
          BoxShadow(blurRadius: 4.0, color: Color(0x0A000000), offset: Offset(0.0, 2.0)),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 24.0,
                  height: 24.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: accentColors,
                      stops: const [0.0, 1.0],
                      begin: const AlignmentDirectional(0.0, -1.0),
                      end: const AlignmentDirectional(0.0, 1.0),
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: theme.secondaryBackground, size: 12.0),
                ),
                const SizedBox(width: 5.0),
                Expanded(
                  child: Text(
                    label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.labelSmall.override(
                      fontFamily: theme.labelSmallFamily,
                      color: theme.secondaryText,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      useGoogleFonts: !theme.labelSmallIsCustom,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              decoration: BoxDecoration(color: theme.primaryBackground, borderRadius: BorderRadius.circular(12.0)),
              child: Text(
                value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.bodyMedium.override(
                  fontFamily: theme.bodyMediumFamily,
                  color: theme.primaryText,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w700,
                  useGoogleFonts: !theme.bodyMediumIsCustom,
                ),
              ),
            ),
          ].divide(const SizedBox(height: 6.0)),
        ),
      ),
    );
  }

  Widget _buildDateField(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: _getIconSize(context),
              height: _getIconSize(context),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [FlutterFlowThemeNew.of(context).primary, const Color(0xFF216DAA)],
                  stops: const [0.0, 1.0],
                  begin: const AlignmentDirectional(0.0, -1.0),
                  end: const AlignmentDirectional(0, 1.0),
                ),
                shape: BoxShape.circle,
              ),
              child: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Icon(Icons.calendar_month_rounded, color: FlutterFlowThemeNew.of(context).secondaryBackground, size: 14.0),
              ),
            ),
            Text(
              'วันที่',
              style: FlutterFlowThemeNew.of(context).labelSmall.override(
                fontFamily: FlutterFlowThemeNew.of(context).labelSmallFamily,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w500,
                useGoogleFonts: !FlutterFlowThemeNew.of(context).labelSmallIsCustom,
              ),
            ),
          ].divide(const SizedBox(width: 8.0)),
        ),
        Container(
          width: double.infinity,
          height: 46.0,
          decoration: BoxDecoration(color: FlutterFlowThemeNew.of(context).primaryBackground, borderRadius: BorderRadius.circular(8.0)),
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(-1.0, 0.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        controller.dateText,
                        style: FlutterFlowThemeNew.of(context).bodyMedium.override(
                          fontFamily: FlutterFlowThemeNew.of(context).bodyMediumFamily,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: !FlutterFlowThemeNew.of(context).bodyMediumIsCustom,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ].divide(const SizedBox(height: 8.0)),
    );
  }

  Widget _buildReportCodeField(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: _getIconSize(context),
              height: _getIconSize(context),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: const [Color(0xFFF59E0B), Color(0xFFD97706)],
                  stops: const [0.0, 1.0],
                  begin: const AlignmentDirectional(0.0, -1.0),
                  end: const AlignmentDirectional(0, 1.0),
                ),
                shape: BoxShape.circle,
              ),
              child: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Icon(Icons.receipt_long_rounded, color: FlutterFlowThemeNew.of(context).secondaryBackground, size: 14.0),
              ),
            ),
            Text(
              'รหัสรายงาน',
              style: FlutterFlowThemeNew.of(context).labelSmall.override(
                fontFamily: FlutterFlowThemeNew.of(context).labelSmallFamily,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w500,
                useGoogleFonts: !FlutterFlowThemeNew.of(context).labelSmallIsCustom,
              ),
            ),
          ].divide(const SizedBox(width: 8.0)),
        ),
        Container(
          width: double.infinity,
          height: 46.0,
          decoration: BoxDecoration(color: FlutterFlowThemeNew.of(context).primaryBackground, borderRadius: BorderRadius.circular(8.0)),
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(-1.0, 0.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        controller.reportCode,
                        style: FlutterFlowThemeNew.of(context).bodyMedium.override(
                          fontFamily: FlutterFlowThemeNew.of(context).bodyMediumFamily,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: !FlutterFlowThemeNew.of(context).bodyMediumIsCustom,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ].divide(const SizedBox(height: 8.0)),
    );
  }

  Widget _buildTimeField(BuildContext context, {required String label, required String value, required IconData icon}) {
    final accentColors = label == 'เวลาเริ่มต้น'
        ? const [Color(0xFF22C55E), Color(0xFF0F766E)]
        : label == 'ระยะเวลา'
        ? const [Color(0xFFF59E0B), Color(0xFFD97706)]
        : const [Color(0xFFFB7185), Color(0xFFEA580C)];

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: _getIconSize(context),
              height: _getIconSize(context),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: accentColors,
                  stops: const [0.0, 1.0],
                  begin: const AlignmentDirectional(0.56, -1.0),
                  end: const AlignmentDirectional(-0.56, 1.0),
                ),
                shape: BoxShape.circle,
              ),
              child: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Icon(icon, color: FlutterFlowThemeNew.of(context).secondaryBackground, size: 14.0),
              ),
            ),
            Text(
              label,
              style: FlutterFlowThemeNew.of(context).labelSmall.override(
                fontFamily: FlutterFlowThemeNew.of(context).labelSmallFamily,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w500,
                useGoogleFonts: !FlutterFlowThemeNew.of(context).labelSmallIsCustom,
              ),
            ),
          ].divide(const SizedBox(width: 8.0)),
        ),
        Container(
          width: double.infinity,
          height: 46.0,
          decoration: BoxDecoration(color: FlutterFlowThemeNew.of(context).primaryBackground, borderRadius: BorderRadius.circular(8.0)),
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(-1.0, 0.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        value,
                        style: FlutterFlowThemeNew.of(context).bodyMedium.override(
                          fontFamily: FlutterFlowThemeNew.of(context).bodyMediumFamily,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: !FlutterFlowThemeNew.of(context).bodyMediumIsCustom,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ].divide(const SizedBox(height: 8.0)),
    );
  }

  double _getIconSize(BuildContext context) {
    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
      return 24.0;
    } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
      return 24.0;
    } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
      return 32.0;
    } else {
      return 32.0;
    }
  }
}

class ActivityTaskFullScreenMapView extends StatelessWidget {
  ActivityTaskFullScreenMapView({required this.activityController, super.key});

  final ActivityTaskDetailsWidgetController activityController;
  final map2.MapController fullScreenMapController = map2.MapController();

  double _mapActionButtonSize(BuildContext context) {
    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
      return 40.0;
    } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
      return 40.0;
    } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
      return 56.0;
    } else {
      return 56.0;
    }
  }

  double _mapActionIconSize(BuildContext context) {
    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
      return 16.0;
    } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
      return 16.0;
    } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
      return 20.0;
    } else {
      return 20.0;
    }
  }

  Widget _buildMapActionButton({required BuildContext context, required IconData icon, required VoidCallback onPressed}) {
    final theme = FlutterFlowThemeNew.of(context);

    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(blurRadius: 16.0, color: Color(0x24000000), offset: Offset(0.0, 6.0)),
          BoxShadow(blurRadius: 4.0, color: Color(0x14000000), offset: Offset(0.0, 2.0)),
        ],
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: FlutterFlowIconButton(
        borderColor: Colors.transparent,
        borderRadius: 100.0,
        borderWidth: 1.0,
        buttonSize: _mapActionButtonSize(context),
        fillColor: theme.secondaryBackground,
        icon: Icon(icon, color: theme.info, size: _mapActionIconSize(context)),
        onPressed: onPressed,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowThemeNew.of(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: theme.primaryBackground,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              child: Obx(
                () => map2.FlutterMap(
                  mapController: fullScreenMapController,
                  options: map2.MapOptions(
                    enableScrollWheel: true,
                    minZoom: 10,
                    zoom: 16,
                    maxZoom: 30,
                    center: activityController.latLng,
                    interactiveFlags: map2.InteractiveFlag.pinchZoom | map2.InteractiveFlag.drag | map2.InteractiveFlag.doubleTapZoom,
                  ),
                  children: [
                    map2.TileLayer(
                      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      subdomains: const ['a', 'b', 'c'],
                      userAgentPackageName: activityController.tileUserAgentPackageName,
                      maxZoom: 19,

                      minZoom: 10,
                    ),
                    map2.MarkerLayer(markers: activityController.markersMap.toList()),
                  ],
                ),
              ),
            ),

            Align(
              alignment: const AlignmentDirectional(1.0, 1.0),
              child: SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _buildMapActionButton(
                        context: context,
                        icon: Icons.add_rounded,
                        onPressed: () {
                          final nextZoom = (fullScreenMapController.zoom + 1.0).clamp(10.0, 19.0).toDouble();
                          fullScreenMapController.move(fullScreenMapController.center, nextZoom);
                        },
                      ),
                      const SizedBox(height: 8.0),
                      _buildMapActionButton(
                        context: context,
                        icon: Icons.remove_rounded,
                        onPressed: () {
                          final nextZoom = (fullScreenMapController.zoom - 1.0).clamp(10.0, 19.0).toDouble();
                          fullScreenMapController.move(fullScreenMapController.center, nextZoom);
                        },
                      ),
                      const SizedBox(height: 8.0),
                      _buildMapActionButton(
                        context: context,
                        icon: Icons.my_location_rounded,
                        onPressed: () {
                          fullScreenMapController.move(activityController.latLng, fullScreenMapController.zoom);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: theme.secondaryBackground.withValues(alpha: 0.94),
                          shape: BoxShape.circle,
                          boxShadow: const [BoxShadow(blurRadius: 12.0, color: Color(0x26000000), offset: Offset(0.0, 4.0))],
                        ),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 48.0,
                          fillColor: Colors.transparent,
                          icon: Icon(Icons.keyboard_arrow_left_rounded, color: theme.primaryText, size: 24.0),
                          onPressed: () async {
                            Get.back();
                          },
                        ),
                      ),
                      const SizedBox(width: 48.0),
                    ],
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
