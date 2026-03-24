import 'package:body_camera/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../flutter_flow/flutter_flow_theme_new.dart';
import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: controller.scaffoldKey,
        backgroundColor: FlutterFlowThemeNew.of(context).primary,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: AppBar(
            backgroundColor: FlutterFlowThemeNew.of(context).primary,
            automaticallyImplyLeading: false,
            actions: const [],
            centerTitle: true,
            toolbarHeight: 0.0,
            elevation: 0.0,
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
         decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF339FF3), FlutterFlowThemeNew.of(context).primaryBackground, FlutterFlowThemeNew.of(context).primaryBackground],
              stops: [0.0, 0.3, 1.0],
              begin: AlignmentDirectional(0.0, -1.0),
              end: AlignmentDirectional(0, 1.0),
            ),
          ),
          child: Stack(
            children: [
              ListView(
                padding: const EdgeInsets.fromLTRB(0, 16.0, 0, 100.0),
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Container(
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
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 80.0,
                              height: 80.0,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [FlutterFlowThemeNew.of(context).primaryBackground, FlutterFlowThemeNew.of(context).primary],
                                  stops: const [0.0, 1.0],
                                  begin: const AlignmentDirectional(0.0, -1.0),
                                  end: const AlignmentDirectional(0, 1.0),
                                ),
                                shape: BoxShape.circle,
                                border: Border.all(color: FlutterFlowThemeNew.of(context).secondaryBackground),
                              ),
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(shape: BoxShape.circle),
                                child: Image.asset(
                                  'assets/images/profile.png',
                                  fit: BoxFit.fitWidth, // ⭐ สำคัญ
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${controller.StaffName}',
                                        style: FlutterFlowThemeNew.of(context).titleMedium.override(
                                          font: FlutterFlowThemeNew.of(context).titleMedium,
                                          color: FlutterFlowThemeNew.of(context).secondaryBackground,
                                          letterSpacing: 0.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'เจ้าหน้าที่',
                                    style: FlutterFlowThemeNew.of(context).bodyMedium.override(
                                      font: FlutterFlowThemeNew.of(context).bodyMedium,
                                      color: const Color(0xFFF9E7C9),
                                      letterSpacing: 0.0,
                                    ),
                                  ),
                                  Text(
                                    '30079',
                                    style: FlutterFlowThemeNew.of(context).bodyMedium.override(
                                      font: FlutterFlowThemeNew.of(context).bodyMedium,
                                      color: const Color(0xFFF9E7C9),
                                      letterSpacing: 0.0,
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 8.0)),
                              ),
                            ),
                          ].divide(const SizedBox(width: 12.0)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ตั้งค่า',
                          style: FlutterFlowThemeNew.of(
                            context,
                          ).bodyMedium.override(font: FlutterFlowThemeNew.of(context).bodyMedium, letterSpacing: 0.2, fontWeight: FontWeight.w500),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowThemeNew.of(context).secondaryBackground,
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 48.0,
                                  decoration: const BoxDecoration(shape: BoxShape.rectangle),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
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
                                                colors: [FlutterFlowThemeNew.of(context).customColor2, FlutterFlowThemeNew.of(context).customColor1],
                                                stops: const [0.0, 1.0],
                                                begin: const AlignmentDirectional(0.56, -1.0),
                                                end: const AlignmentDirectional(-0.56, 1.0),
                                              ),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Align(
                                              alignment: const AlignmentDirectional(0.0, 0.0),
                                              child: Icon(
                                                Icons.notifications_sharp,
                                                color: FlutterFlowThemeNew.of(context).secondaryBackground,
                                                size: 16.0,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'การแจ้งเตือน',
                                            style: FlutterFlowThemeNew.of(
                                              context,
                                            ).labelMedium.override(font: FlutterFlowThemeNew.of(context).labelMedium, letterSpacing: 0.0),
                                          ),
                                        ].divide(const SizedBox(width: 12.0)),
                                      ),
                                      Obx(
                                        () => Switch.adaptive(
                                          value: controller.switchValue1.value,
                                          onChanged: (newValue) {
                                            controller.switchValue1.value = newValue;
                                          },
                                          activeColor: FlutterFlowThemeNew.of(context).secondaryBackground,
                                          activeTrackColor: FlutterFlowThemeNew.of(context).primary,
                                          inactiveTrackColor: FlutterFlowThemeNew.of(context).alternate,
                                          inactiveThumbColor: FlutterFlowThemeNew.of(context).secondaryBackground,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Divider(height: 1.0, thickness: 1.0, color: FlutterFlowThemeNew.of(context).primaryBackground),
                                Container(
                                  width: double.infinity,
                                  height: 48.0,
                                  decoration: const BoxDecoration(shape: BoxShape.rectangle),
                                  child: InkWell(
                                    onTap: () async {
                                      //await Get.toNamed(Routes.PINCODE, arguments: {'isNewPassword': true});
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
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
                                                  colors: [const Color(0xFFF8EDAB), FlutterFlowThemeNew.of(context).warning],
                                                  stops: const [0.0, 1.0],
                                                  begin: const AlignmentDirectional(0.56, -1.0),
                                                  end: const AlignmentDirectional(-0.56, 1.0),
                                                ),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Align(
                                                alignment: const AlignmentDirectional(0.0, 0.0),
                                                child: Icon(
                                                  Icons.pin_rounded,
                                                  color: FlutterFlowThemeNew.of(context).secondaryBackground,
                                                  size: 16.0,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'PIN',
                                              style: FlutterFlowThemeNew.of(
                                                context,
                                              ).labelMedium.override(font: FlutterFlowThemeNew.of(context).labelMedium, letterSpacing: 0.0),
                                            ),
                                          ].divide(const SizedBox(width: 12.0)),
                                        ),
                                        Icon(Icons.keyboard_arrow_right_rounded, color: FlutterFlowThemeNew.of(context).secondaryText, size: 24.0),
                                      ],
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(height: 8.0)),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowThemeNew.of(context).secondaryBackground,
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Divider(height: 1.0, thickness: 1.0, color: FlutterFlowThemeNew.of(context).primaryBackground),
                                Container(
                                  width: double.infinity,
                                  height: 48.0,
                                  decoration: const BoxDecoration(shape: BoxShape.rectangle),
                                  child: InkWell(
                                    onTap: () {
                                      //    Get.toNamed(Routes.PDPA, arguments: {'status_view': false});
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Align(
                                          alignment: const AlignmentDirectional(-1.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
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
                                                decoration: const BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [Color(0xFFB8ADF9), Color(0xFF6F57F4)],
                                                    stops: [0.0, 1.0],
                                                    begin: AlignmentDirectional(0.56, -1.0),
                                                    end: AlignmentDirectional(-0.56, 1.0),
                                                  ),
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Align(
                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                  child: Icon(
                                                    Icons.verified_user_rounded,
                                                    color: FlutterFlowThemeNew.of(context).secondaryBackground,
                                                    size: 16.0,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'นโยบาย Privacy',
                                                textAlign: TextAlign.start,
                                                style: FlutterFlowThemeNew.of(
                                                  context,
                                                ).labelMedium.override(font: FlutterFlowThemeNew.of(context).labelMedium, letterSpacing: 0.0),
                                              ),
                                            ].divide(const SizedBox(width: 12.0)),
                                          ),
                                        ),
                                        Icon(Icons.keyboard_arrow_right_rounded, color: FlutterFlowThemeNew.of(context).secondaryText, size: 24.0),
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(height: 1.0, thickness: 1.0, color: FlutterFlowThemeNew.of(context).primaryBackground),
                                Container(
                                  width: double.infinity,
                                  height: 48.0,
                                  decoration: const BoxDecoration(shape: BoxShape.rectangle),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
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
                                                colors: [const Color(0xFF90D4FA), FlutterFlowThemeNew.of(context).info],
                                                stops: const [0.0, 1.0],
                                                begin: const AlignmentDirectional(0.56, -1.0),
                                                end: const AlignmentDirectional(-0.56, 1.0),
                                              ),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Align(
                                              alignment: const AlignmentDirectional(0.0, 0.0),
                                              child: Icon(Icons.info, color: FlutterFlowThemeNew.of(context).secondaryBackground, size: 16.0),
                                            ),
                                          ),
                                          Text(
                                            'เกี่ยวกับแอปพลิเคชั่น',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowThemeNew.of(
                                              context,
                                            ).labelMedium.override(font: FlutterFlowThemeNew.of(context).labelMedium, letterSpacing: 0.0),
                                          ),
                                        ].divide(const SizedBox(width: 12.0)),
                                      ),
                                      Text(
                                        '25.10.10.001',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowThemeNew.of(context).labelLarge.override(
                                          font: FlutterFlowThemeNew.of(context).labelLarge,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ].divide(const SizedBox(height: 8.0)),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowThemeNew.of(context).secondaryBackground,
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 48.0,
                                  decoration: const BoxDecoration(shape: BoxShape.rectangle),
                                  child: InkWell(
                                    onTap: () async {
                                      // await showModalBottomSheet(
                                      //   isScrollControlled: true,
                                      //   backgroundColor: Colors.transparent,
                                      //   enableDrag: true,
                                      //   context: context,
                                      //   builder: (context) {
                                      //     return Padding(padding: MediaQuery.viewInsetsOf(context), child: const ButtonSheetLogoutWidgetDartWidget());
                                      //   },
                                      // );
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Align(
                                          alignment: const AlignmentDirectional(-1.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
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
                                                    colors: [const Color(0xFFFFA7A7), FlutterFlowThemeNew.of(context).error],
                                                    stops: const [0.0, 1.0],
                                                    begin: const AlignmentDirectional(0.56, -1.0),
                                                    end: const AlignmentDirectional(-0.56, 1.0),
                                                  ),
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Align(
                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                  child: Icon(
                                                    Icons.arrow_circle_right,
                                                    color: FlutterFlowThemeNew.of(context).secondaryBackground,
                                                    size: 16.0,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'ออกจากระบบ',
                                                textAlign: TextAlign.start,
                                                style: FlutterFlowThemeNew.of(
                                                  context,
                                                ).labelMedium.override(font: FlutterFlowThemeNew.of(context).labelMedium, letterSpacing: 0.0),
                                              ),
                                            ].divide(const SizedBox(width: 12.0)),
                                          ),
                                        ),
                                        Icon(Icons.keyboard_arrow_right_rounded, color: FlutterFlowThemeNew.of(context).secondaryText, size: 24.0),
                                      ],
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(height: 8.0)),
                            ),
                          ),
                        ),
                      ].divide(const SizedBox(height: 12.0)).addToEnd(const SizedBox(height: 24.0)),
                    ),
                  ),
                ].divide(const SizedBox(height: 16.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
