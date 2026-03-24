import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';

import '../../../../flutter_flow/flutter_flow_button_tabbar.dart';
import '../../../../flutter_flow/flutter_flow_icon_button.dart';
import '../../../../flutter_flow/flutter_flow_theme_new.dart';
import '../../../../flutter_flow/flutter_flow_util.dart';
import '../controllers/noti_list_controller.dart';

class NotiListView extends GetView<NotiListController> {
  const NotiListView({super.key});
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
     // body: const HistoryScreen(),

        body:   Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowThemeNew.of(context).secondaryBackground,
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
              child: Column(
                children: [
                  Align(
                    alignment: Alignment(0.0, 0),
                    child: FlutterFlowButtonTabBar(
                      useToggleButtonStyle: true,
                      labelStyle: FlutterFlowThemeNew.of(context).labelMedium.override(
                        fontFamily: FlutterFlowThemeNew.of(context).labelMediumFamily,
                        letterSpacing: 0.0,
                        useGoogleFonts: !FlutterFlowThemeNew.of(context).labelMediumIsCustom,
                      ),
                      unselectedLabelStyle: FlutterFlowThemeNew.of(context).labelMedium.override(
                        fontFamily: FlutterFlowThemeNew.of(context).labelMediumFamily,
                        letterSpacing: 0.0,
                        useGoogleFonts: !FlutterFlowThemeNew.of(context).labelMediumIsCustom,
                      ),
                      labelColor: FlutterFlowThemeNew.of(context).secondaryBackground,
                      unselectedLabelColor: FlutterFlowThemeNew.of(context).secondaryText,
                      backgroundColor: FlutterFlowThemeNew.of(context).primary,
                      unselectedBackgroundColor: FlutterFlowThemeNew.of(context).alternate,
                      unselectedBorderColor: FlutterFlowThemeNew.of(context).secondaryBackground,
                      borderWidth: 1.0,
                      borderRadius: 26.0,
                      elevation: 0.0,
                      buttonMargin: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                      padding: EdgeInsets.all(4.0),
                      tabs: [
                        Tab(text: 'ทั้งหมด'),
                        Tab(text: 'รับงาน'),
                        Tab(text: 'ตรวจจับ'),
                      ],
                      controller: controller.tabBarController,
                      onTap: (i) async {
                        [() async {}, () async {}, () async {}][i]();
                      },
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: controller.tabBarController,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                          child: MasonryGridView.builder(
                            gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                            itemCount: 2,
                            padding: EdgeInsets.fromLTRB(0, 12.0, 0, 24.0),
                            itemBuilder: (context, index) {
                              return [
                                () => InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    //  context.pushNamed(DetailesPatientNewtaskWidget.routeName);
                                  },
                                  child: Container(
                                    width: () {
                                      if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                        return 355.0;
                                      } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                        return 355.0;
                                      } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                        return 400.0;
                                      } else {
                                        return 400.0;
                                      }
                                    }(),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowThemeNew.of(context).secondaryBackground,
                                      boxShadow: [BoxShadow(blurRadius: 4.0, color: Color(0x17000000), offset: Offset(0.0, 0.0))],
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children:
                                                    [
                                                      Column(
                                                        mainAxisSize: MainAxisSize.max,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            '1.งาน',
                                                            style: FlutterFlowThemeNew.of(context).titleSmall.override(
                                                              fontFamily: FlutterFlowThemeNew.of(context).titleSmallFamily,
                                                              color: Color(0xFFFF7600),
                                                              letterSpacing: 0.0,
                                                              useGoogleFonts: !FlutterFlowThemeNew.of(context).titleSmallIsCustom,
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(height: 2.0)),
                                                      ),
                                                    ].divide(
                                                      SizedBox(
                                                        width: () {
                                                          if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                            return 8.0;
                                                          } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                            return 8.0;
                                                          } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                            return 16.0;
                                                          } else {
                                                            return 16.0;
                                                          }
                                                        }(),
                                                      ),
                                                    ),
                                              ),

                                              Container(
                                                width: () {
                                                  if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                    return 28.0;
                                                  } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                    return 28.0;
                                                  } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                    return 32.0;
                                                  } else {
                                                    return 32.0;
                                                  }
                                                }(),
                                                height: () {
                                                  if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                    return 28.0;
                                                  } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                    return 28.0;
                                                  } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                    return 32.0;
                                                  } else {
                                                    return 32.0;
                                                  }
                                                }(),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowThemeNew.of(context).primaryBackground,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Icon(Icons.keyboard_arrow_right_rounded, color: Color(0xFF9DA7A7), size: 20.0),
                                              ),
                                            ],
                                          ),
                                        ),

                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [Color(0xFFFCF3EB), Color(0xFFFFE9D5)],
                                              stops: [0.1, 1.0],
                                              begin: AlignmentDirectional(0.0, -1.0),
                                              end: AlignmentDirectional(0, 1.0),
                                            ),
                                            borderRadius: BorderRadius.circular(24.0),
                                            border: Border.all(color: FlutterFlowThemeNew.of(context).secondaryBackground, width: 2.0),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(12.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize: MainAxisSize.max,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            'วันที่',
                                                            style: FlutterFlowThemeNew.of(context).labelSmall.override(
                                                              fontFamily: FlutterFlowThemeNew.of(context).labelSmallFamily,
                                                              color: Color(0xFFFF7600),
                                                              letterSpacing: 0.0,
                                                              useGoogleFonts: !FlutterFlowThemeNew.of(context).labelSmallIsCustom,
                                                            ),
                                                          ),
                                                          Text(
                                                            '12 ก.พ. 2568 ',
                                                            style: FlutterFlowThemeNew.of(context).bodyMedium.override(
                                                              fontFamily: FlutterFlowThemeNew.of(context).bodyMediumFamily,
                                                              letterSpacing: 0.0,
                                                              useGoogleFonts: !FlutterFlowThemeNew.of(context).bodyMediumIsCustom,
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(height: 2.0)),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize: MainAxisSize.max,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            'เวลา',
                                                            style: FlutterFlowThemeNew.of(context).labelSmall.override(
                                                              fontFamily: FlutterFlowThemeNew.of(context).labelSmallFamily,
                                                              color: Color(0xFFFF7600),
                                                              letterSpacing: 0.0,
                                                              useGoogleFonts: !FlutterFlowThemeNew.of(context).labelSmallIsCustom,
                                                            ),
                                                          ),
                                                          Text(
                                                            '13:00 น.',
                                                            style: FlutterFlowThemeNew.of(context).bodyMedium.override(
                                                              fontFamily: FlutterFlowThemeNew.of(context).bodyMediumFamily,
                                                              letterSpacing: 0.0,
                                                              useGoogleFonts: !FlutterFlowThemeNew.of(context).bodyMediumIsCustom,
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(height: 2.0)),
                                                      ),
                                                    ),
                                                  ].divide(SizedBox(width: 12.0)),
                                                ),
                                              ].divide(SizedBox(height: 12.0)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                () => InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    //  context.pushNamed(DetailesPatientNewtaskWidget.routeName);
                                  },
                                  child: Container(
                                    width: () {
                                      if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                        return 355.0;
                                      } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                        return 355.0;
                                      } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                        return 400.0;
                                      } else {
                                        return 400.0;
                                      }
                                    }(),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowThemeNew.of(context).secondaryBackground,
                                      boxShadow: [BoxShadow(blurRadius: 4.0, color: Color(0x17000000), offset: Offset(0.0, 0.0))],
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children:
                                                    [
                                                      Column(
                                                        mainAxisSize: MainAxisSize.max,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            '2.Detect Camera ',
                                                            style: FlutterFlowThemeNew.of(context).titleSmall.override(
                                                              fontFamily: FlutterFlowThemeNew.of(context).titleSmallFamily,
                                                              color: Color.fromARGB(255, 0, 55, 205),
                                                              letterSpacing: 0.0,
                                                              useGoogleFonts: !FlutterFlowThemeNew.of(context).titleSmallIsCustom,
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(height: 2.0)),
                                                      ),
                                                    ].divide(
                                                      SizedBox(
                                                        width: () {
                                                          if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                            return 8.0;
                                                          } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                            return 8.0;
                                                          } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                            return 16.0;
                                                          } else {
                                                            return 16.0;
                                                          }
                                                        }(),
                                                      ),
                                                    ),
                                              ),
                                              Container(
                                                width: () {
                                                  if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                    return 28.0;
                                                  } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                    return 28.0;
                                                  } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                    return 32.0;
                                                  } else {
                                                    return 32.0;
                                                  }
                                                }(),
                                                height: () {
                                                  if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                    return 28.0;
                                                  } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                    return 28.0;
                                                  } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                    return 32.0;
                                                  } else {
                                                    return 32.0;
                                                  }
                                                }(),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowThemeNew.of(context).primaryBackground,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Icon(Icons.keyboard_arrow_right_rounded, color: Color(0xFF9DA7A7), size: 20.0),
                                              ),
                                            ],
                                          ),
                                        ),

                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [Color(0xFFEAF4FF), Color(0xFFD6E9FF)],
                                              stops: [0.1, 1.0],
                                              begin: AlignmentDirectional(0.0, -1.0),
                                              end: AlignmentDirectional(0, 1.0),
                                            ),
                                            borderRadius: BorderRadius.circular(24.0),
                                            border: Border.all(color: FlutterFlowThemeNew.of(context).secondaryBackground, width: 2.0),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(12.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize: MainAxisSize.max,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            'วันที่',
                                                            style: FlutterFlowThemeNew.of(context).labelSmall.override(
                                                              fontFamily: FlutterFlowThemeNew.of(context).labelSmallFamily,
                                                              color: Color.fromARGB(255, 0, 55, 205),
                                                              letterSpacing: 0.0,
                                                              useGoogleFonts: !FlutterFlowThemeNew.of(context).labelSmallIsCustom,
                                                            ),
                                                          ),
                                                          Text(
                                                            '12 ก.พ. 2568 ',
                                                            style: FlutterFlowThemeNew.of(context).bodyMedium.override(
                                                              fontFamily: FlutterFlowThemeNew.of(context).bodyMediumFamily,
                                                              letterSpacing: 0.0,
                                                              useGoogleFonts: !FlutterFlowThemeNew.of(context).bodyMediumIsCustom,
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(height: 2.0)),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize: MainAxisSize.max,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            'เวลา',
                                                            style: FlutterFlowThemeNew.of(context).labelSmall.override(
                                                              fontFamily: FlutterFlowThemeNew.of(context).labelSmallFamily,
                                                              color: Color.fromARGB(255, 0, 55, 205),
                                                              letterSpacing: 0.0,
                                                              useGoogleFonts: !FlutterFlowThemeNew.of(context).labelSmallIsCustom,
                                                            ),
                                                          ),
                                                          Text(
                                                            '13:00 น.',
                                                            style: FlutterFlowThemeNew.of(context).bodyMedium.override(
                                                              fontFamily: FlutterFlowThemeNew.of(context).bodyMediumFamily,
                                                              letterSpacing: 0.0,
                                                              useGoogleFonts: !FlutterFlowThemeNew.of(context).bodyMediumIsCustom,
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(height: 2.0)),
                                                      ),
                                                    ),
                                                  ].divide(SizedBox(width: 12.0)),
                                                ),
                                              ].divide(SizedBox(height: 12.0)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ][index]();
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                          child: MasonryGridView.builder(
                            gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                            itemCount: 1,
                            padding: EdgeInsets.fromLTRB(0, 12.0, 0, 24.0),
                            itemBuilder: (context, index) {
                              return [
                                () => InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    //  context.pushNamed(DetailesPatientNewtaskWidget.routeName);
                                  },
                                  child: Container(
                                    width: () {
                                      if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                        return 355.0;
                                      } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                        return 355.0;
                                      } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                        return 400.0;
                                      } else {
                                        return 400.0;
                                      }
                                    }(),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowThemeNew.of(context).secondaryBackground,
                                      boxShadow: [BoxShadow(blurRadius: 4.0, color: Color(0x17000000), offset: Offset(0.0, 0.0))],
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children:
                                                    [
                                                      Column(
                                                        mainAxisSize: MainAxisSize.max,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            '1.งาน',
                                                            style: FlutterFlowThemeNew.of(context).titleSmall.override(
                                                              fontFamily: FlutterFlowThemeNew.of(context).titleSmallFamily,
                                                              color: Color(0xFFFF7600),
                                                              letterSpacing: 0.0,
                                                              useGoogleFonts: !FlutterFlowThemeNew.of(context).titleSmallIsCustom,
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(height: 2.0)),
                                                      ),
                                                    ].divide(
                                                      SizedBox(
                                                        width: () {
                                                          if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                            return 8.0;
                                                          } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                            return 8.0;
                                                          } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                            return 16.0;
                                                          } else {
                                                            return 16.0;
                                                          }
                                                        }(),
                                                      ),
                                                    ),
                                              ),

                                              // Container(
                                              //   width: () {
                                              //     if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                              //       return 28.0;
                                              //     } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                              //       return 28.0;
                                              //     } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                              //       return 32.0;
                                              //     } else {
                                              //       return 32.0;
                                              //     }
                                              //   }(),
                                              //   height: () {
                                              //     if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                              //       return 28.0;
                                              //     } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                              //       return 28.0;
                                              //     } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                              //       return 32.0;
                                              //     } else {
                                              //       return 32.0;
                                              //     }
                                              //   }(),
                                              //   decoration: BoxDecoration(
                                              //     color: FlutterFlowThemeNew.of(context).primaryBackground,
                                              //     shape: BoxShape.circle,
                                              //   ),
                                              //   child: Icon(Icons.keyboard_arrow_right_rounded, color: Color(0xFF9DA7A7), size: 20.0),
                                              // ),
                                            ],
                                          ),
                                        ),

                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [Color(0xFFFCF3EB), Color(0xFFFFE9D5)],
                                              stops: [0.1, 1.0],
                                              begin: AlignmentDirectional(0.0, -1.0),
                                              end: AlignmentDirectional(0, 1.0),
                                            ),
                                            borderRadius: BorderRadius.circular(24.0),
                                            border: Border.all(color: FlutterFlowThemeNew.of(context).secondaryBackground, width: 2.0),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(12.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize: MainAxisSize.max,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            'วันที่',
                                                            style: FlutterFlowThemeNew.of(context).labelSmall.override(
                                                              fontFamily: FlutterFlowThemeNew.of(context).labelSmallFamily,
                                                              color: Color(0xFFFF7600),
                                                              letterSpacing: 0.0,
                                                              useGoogleFonts: !FlutterFlowThemeNew.of(context).labelSmallIsCustom,
                                                            ),
                                                          ),
                                                          Text(
                                                            '12 ก.พ. 2568 ',
                                                            style: FlutterFlowThemeNew.of(context).bodyMedium.override(
                                                              fontFamily: FlutterFlowThemeNew.of(context).bodyMediumFamily,
                                                              letterSpacing: 0.0,
                                                              useGoogleFonts: !FlutterFlowThemeNew.of(context).bodyMediumIsCustom,
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(height: 2.0)),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize: MainAxisSize.max,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            'เวลา',
                                                            style: FlutterFlowThemeNew.of(context).labelSmall.override(
                                                              fontFamily: FlutterFlowThemeNew.of(context).labelSmallFamily,
                                                              color: Color(0xFFFF7600),
                                                              letterSpacing: 0.0,
                                                              useGoogleFonts: !FlutterFlowThemeNew.of(context).labelSmallIsCustom,
                                                            ),
                                                          ),
                                                          Text(
                                                            '13:00 น.',
                                                            style: FlutterFlowThemeNew.of(context).bodyMedium.override(
                                                              fontFamily: FlutterFlowThemeNew.of(context).bodyMediumFamily,
                                                              letterSpacing: 0.0,
                                                              useGoogleFonts: !FlutterFlowThemeNew.of(context).bodyMediumIsCustom,
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(height: 2.0)),
                                                      ),
                                                    ),
                                                  ].divide(SizedBox(width: 12.0)),
                                                ),
                                              ].divide(SizedBox(height: 12.0)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ][index]();
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                          child: MasonryGridView.builder(
                            gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                            itemCount: 1,
                            padding: EdgeInsets.fromLTRB(0, 12.0, 0, 24.0),
                            itemBuilder: (context, index) {
                              return [
                                () => InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    //  context.pushNamed(DetailesPatientNewtaskWidget.routeName);
                                  },
                                  child: Container(
                                    width: () {
                                      if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                        return 355.0;
                                      } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                        return 355.0;
                                      } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                        return 400.0;
                                      } else {
                                        return 400.0;
                                      }
                                    }(),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowThemeNew.of(context).secondaryBackground,
                                      boxShadow: [BoxShadow(blurRadius: 4.0, color: Color(0x17000000), offset: Offset(0.0, 0.0))],
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children:
                                                    [
                                                      Column(
                                                        mainAxisSize: MainAxisSize.max,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            '2.Detect Camera ',
                                                            style: FlutterFlowThemeNew.of(context).titleSmall.override(
                                                              fontFamily: FlutterFlowThemeNew.of(context).titleSmallFamily,
                                                              color: Color.fromARGB(255, 0, 55, 205),
                                                              letterSpacing: 0.0,
                                                              useGoogleFonts: !FlutterFlowThemeNew.of(context).titleSmallIsCustom,
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(height: 2.0)),
                                                      ),
                                                    ].divide(
                                                      SizedBox(
                                                        width: () {
                                                          if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                            return 8.0;
                                                          } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                            return 8.0;
                                                          } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                            return 16.0;
                                                          } else {
                                                            return 16.0;
                                                          }
                                                        }(),
                                                      ),
                                                    ),
                                              ),
                                              Container(
                                                width: () {
                                                  if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                    return 28.0;
                                                  } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                    return 28.0;
                                                  } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                    return 32.0;
                                                  } else {
                                                    return 32.0;
                                                  }
                                                }(),
                                                height: () {
                                                  if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                    return 28.0;
                                                  } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                    return 28.0;
                                                  } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                    return 32.0;
                                                  } else {
                                                    return 32.0;
                                                  }
                                                }(),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowThemeNew.of(context).primaryBackground,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Icon(Icons.keyboard_arrow_right_rounded, color: Color(0xFF9DA7A7), size: 20.0),
                                              ),
                                            ],
                                          ),
                                        ),

                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [Color(0xFFEAF4FF), Color(0xFFD6E9FF)],
                                              stops: [0.1, 1.0],
                                              begin: AlignmentDirectional(0.0, -1.0),
                                              end: AlignmentDirectional(0, 1.0),
                                            ),
                                            borderRadius: BorderRadius.circular(24.0),
                                            border: Border.all(color: FlutterFlowThemeNew.of(context).secondaryBackground, width: 2.0),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(12.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize: MainAxisSize.max,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            'วันที่',
                                                            style: FlutterFlowThemeNew.of(context).labelSmall.override(
                                                              fontFamily: FlutterFlowThemeNew.of(context).labelSmallFamily,
                                                              color: Color.fromARGB(255, 0, 55, 205),
                                                              letterSpacing: 0.0,
                                                              useGoogleFonts: !FlutterFlowThemeNew.of(context).labelSmallIsCustom,
                                                            ),
                                                          ),
                                                          Text(
                                                            '12 ก.พ. 2568 ',
                                                            style: FlutterFlowThemeNew.of(context).bodyMedium.override(
                                                              fontFamily: FlutterFlowThemeNew.of(context).bodyMediumFamily,
                                                              letterSpacing: 0.0,
                                                              useGoogleFonts: !FlutterFlowThemeNew.of(context).bodyMediumIsCustom,
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(height: 2.0)),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize: MainAxisSize.max,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            'เวลา',
                                                            style: FlutterFlowThemeNew.of(context).labelSmall.override(
                                                              fontFamily: FlutterFlowThemeNew.of(context).labelSmallFamily,
                                                              color: Color.fromARGB(255, 0, 55, 205),
                                                              letterSpacing: 0.0,
                                                              useGoogleFonts: !FlutterFlowThemeNew.of(context).labelSmallIsCustom,
                                                            ),
                                                          ),
                                                          Text(
                                                            '13:00 น.',
                                                            style: FlutterFlowThemeNew.of(context).bodyMedium.override(
                                                              fontFamily: FlutterFlowThemeNew.of(context).bodyMediumFamily,
                                                              letterSpacing: 0.0,
                                                              useGoogleFonts: !FlutterFlowThemeNew.of(context).bodyMediumIsCustom,
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(height: 2.0)),
                                                      ),
                                                    ),
                                                  ].divide(SizedBox(width: 12.0)),
                                                ),
                                              ].divide(SizedBox(height: 12.0)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ][index]();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  int year = 2026;
  int tabIndex = 2; // 0=งานสำเร็จ, 1=ยกเลิกงาน, 2=ปฏิเสธงาน

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: _TopAppBar(title: 'ประวัติการทำรายการ', onBack: () => Navigator.of(context).maybePop(), onClock: () {}),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SegmentTabs(index: tabIndex, onChanged: (i) => setState(() => tabIndex = i), labels: const ['งานสำเร็จ', 'ยกเลิกงาน', 'ปฏิเสธงาน']),
            const SizedBox(height: 16),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _YearDropdown(value: year, years: const [2024, 2025, 2026, 2027], onChanged: (v) => setState(() => year = v)),
                const Spacer(),
                const _CountPillRed(count: 2, label: 'รายการ'),
              ],
            ),

            const SizedBox(height: 14),
            Text(
              'กุมภาพันธ์',
              style: FlutterFlowThemeNew.of(context).bodyMedium.override(
                fontFamily: FlutterFlowThemeNew.of(context).bodyMediumFamily,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w500,
                useGoogleFonts: !FlutterFlowThemeNew.of(context).bodyMediumIsCustom,
              ),
            ),
            const SizedBox(height: 10),

            _WhiteCardGroup(
              items: const [
                _RowItem(name: 'นางสาวศิริกาญจนา มหานทีกร', detail: 'อายุ 48 ปี 6 ด. 13 ว.', time: '12:30 น.', avatarSeed: 1),
                _RowItem(name: 'นางรัตนา ศรีสุข', detail: 'อายุ 48 ปี 6 ด. 13 ว.', time: '12:30 น.', avatarSeed: 2),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/* --------------------------- Top AppBar --------------------------- */

class _TopAppBar extends StatelessWidget {
  const _TopAppBar({required this.title, required this.onBack, required this.onClock});

  final String title;
  final VoidCallback onBack;
  final VoidCallback onClock;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF2EA6F3),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SizedBox(
            height: 64,
            child: Row(
              children: [
                IconButton(
                  onPressed: onBack,
                  icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
                ),
                const Spacer(),
                Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800),
                ),
                const Spacer(),
                _CircleIconButton(icon: Icons.access_time_rounded, onTap: onClock),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  const _CircleIconButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      radius: 28,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(color: Colors.white.withOpacity(0.25), shape: BoxShape.circle),
        child: Icon(icon, color: Colors.white, size: 26),
      ),
    );
  }
}

/* --------------------------- Segmented Tabs --------------------------- */

class _SegmentTabs extends StatelessWidget {
  const _SegmentTabs({required this.index, required this.onChanged, required this.labels});

  final int index;
  final ValueChanged<int> onChanged;
  final List<String> labels;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(color: const Color(0xFFE9EDF3), borderRadius: BorderRadius.circular(22)),
      child: Row(
        children: List.generate(labels.length, (i) {
          final selected = i == index;
          return Expanded(
            child: GestureDetector(
              onTap: () => onChanged(i),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 160),
                curve: Curves.easeOut,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: selected ? const Color(0xFF2EA6F3) : const Color(0xFFE9EDF3),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Text(
                  labels[i],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: selected ? Colors.white : const Color(0xFF6B7280)),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

/* --------------------------- Year + Count --------------------------- */

class _YearDropdown extends StatelessWidget {
  const _YearDropdown({required this.value, required this.years, required this.onChanged});

  final int value;
  final List<int> years;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Text(
        //   '$value',
        //   style: const TextStyle(fontSize: 44, fontWeight: FontWeight.w800, color: Color(0xFF1F3A5F), height: 1.0),
        // ),
        const SizedBox(width: 6),
        DropdownButtonHideUnderline(
          child: DropdownButton<int>(
            value: value,
            icon: const Icon(Icons.keyboard_arrow_down_rounded, size: 26),
            items: years.map((y) => DropdownMenuItem<int>(value: y, child: Text('$y'))).toList(),
            onChanged: (v) {
              if (v != null) onChanged(v);
            },
            style: FlutterFlowThemeNew.of(context).headlineSmall.override(
              fontFamily: FlutterFlowThemeNew.of(context).headlineSmallFamily,
              color: FlutterFlowThemeNew.of(context).customColor5,
              letterSpacing: 0.0,
              useGoogleFonts: !FlutterFlowThemeNew.of(context).headlineSmallIsCustom,
            ),
          ),
        ),
      ],
    );
  }
}

class _CountPillRed extends StatelessWidget {
  const _CountPillRed({required this.count, required this.label});

  final int count;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(999),
        boxShadow: const [BoxShadow(blurRadius: 14, offset: Offset(0, 6), color: Color(0x1A000000))],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 38,
            height: 38,
            alignment: Alignment.center,
            decoration: const BoxDecoration(color: Color(0xFFFF3B30), shape: BoxShape.circle),
            child: Text(
              '$count',
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 18),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            label,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Color(0xFF111827)),
          ),
        ],
      ),
    );
  }
}

/* --------------------------- List Card --------------------------- */

class _WhiteCardGroup extends StatelessWidget {
  const _WhiteCardGroup({required this.items});

  final List<_RowItem> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
        boxShadow: const [BoxShadow(blurRadius: 18, offset: Offset(0, 10), color: Color(0x1A000000))],
      ),
      child: Column(
        children: List.generate(items.length, (i) {
          final isLast = i == items.length - 1;
          return Column(
            children: [
              _HistoryRow(item: items[i]),
              if (!isLast)
                const Padding(
                  padding: EdgeInsets.only(left: 92),
                  child: Divider(height: 1, thickness: 1, color: Color(0xFFE5E7EB)),
                ),
            ],
          );
        }),
      ),
    );
  }
}

class _HistoryRow extends StatelessWidget {
  const _HistoryRow({required this.item});

  final _RowItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 16, 18, 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _AvatarWithRedX(seed: item.avatarSeed),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: FlutterFlowThemeNew.of(context).titleSmall.override(
                    fontFamily: FlutterFlowThemeNew.of(context).titleSmallFamily,
                    color: FlutterFlowThemeNew.of(context).customColor1,
                    letterSpacing: 0.0,
                    useGoogleFonts: !FlutterFlowThemeNew.of(context).titleSmallIsCustom,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  item.detail,
                  style: FlutterFlowThemeNew.of(context).labelSmall.override(
                    fontFamily: FlutterFlowThemeNew.of(context).labelSmallFamily,
                    letterSpacing: 0.0,
                    useGoogleFonts: !FlutterFlowThemeNew.of(context).labelSmallIsCustom,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Text(
            item.time,
            style: FlutterFlowThemeNew.of(context).bodySmall.override(
              fontFamily: FlutterFlowThemeNew.of(context).bodySmallFamily,
              letterSpacing: 1.0,
              useGoogleFonts: !FlutterFlowThemeNew.of(context).bodySmallIsCustom,
            ),
          ),
        ],
      ),
    );
  }
}

class _AvatarWithRedX extends StatelessWidget {
  const _AvatarWithRedX({required this.seed});

  final int seed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFE6F2FF)),
            child: Center(
              child: Text(
                _letter(seed),
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Color(0xFF2EA6F3)),
              ),
            ),
          ),
          Positioned(
            left: -2,
            bottom: -2,
            child: Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                color: const Color(0xFFFF3B30),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2.5),
              ),
              child: const Icon(Icons.close_rounded, size: 14, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  static String _letter(int s) {
    const letters = ['A', 'B', 'C', 'D', 'E', 'F', 'G'];
    return letters[(s - 1) % letters.length];
  }
}

class _RowItem {
  final String name;
  final String detail;
  final String time;
  final int avatarSeed;

  const _RowItem({required this.name, required this.detail, required this.time, required this.avatarSeed});
}
