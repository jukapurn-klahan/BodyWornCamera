import 'package:body_camera/app/routes/app_pages.dart';
import 'package:body_camera/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../flutter_flow/flutter_flow_theme_new.dart';
import '../../../../widgets/button_sheet_logout_widget_dart/button_sheet_logout_widget_dart_widget.dart';

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
                        borderRadius: BorderRadius.circular(28.0),
                        boxShadow: const [BoxShadow(blurRadius: 16.0, color: Color(0x1F000000), offset: Offset(0.0, 8.0), spreadRadius: 0.0)],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(28.0),
                        child: Stack(
                          children: [
                            /// background image
                            Positioned.fill(child: Image.asset('assets/images/bg_highway.png', fit: BoxFit.cover)),

                            /// overlay gradient
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      const Color(0xFF1565C0).withOpacity(0.82),
                                      const Color(0xFF0D47A1).withOpacity(0.88),
                                      const Color(0xFF08306B).withOpacity(0.94),
                                    ],
                                    stops: const [0.0, 0.55, 1.0],
                                    begin: const AlignmentDirectional(-1.0, -1.0),
                                    end: const AlignmentDirectional(1.0, 1.0),
                                  ),
                                ),
                              ),
                            ),

                            /// pattern overlay
                            Positioned.fill(
                              child: Opacity(opacity: 0.10, child: Image.asset('assets/images/bg_highway.png', fit: BoxFit.cover)),
                            ),

                            /// top light effect
                            Positioned(
                              top: -20,
                              left: -20,
                              child: Container(
                                width: 180,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  gradient: LinearGradient(
                                    colors: [Colors.white.withOpacity(0.20), Colors.white.withOpacity(0.01)],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                                        width: 88.0,
                                        height: 88.0,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(color: FlutterFlowThemeNew.of(context).secondaryBackground, width: 3.0),
                                          boxShadow: const [BoxShadow(blurRadius: 12.0, color: Color(0x26000000), offset: Offset(0.0, 4.0))],
                                          gradient: LinearGradient(
                                            colors: [FlutterFlowThemeNew.of(context).primaryBackground, FlutterFlowThemeNew.of(context).primary],
                                            stops: const [0.0, 1.0],
                                            begin: const AlignmentDirectional(0.0, -1.0),
                                            end: const AlignmentDirectional(0.0, 1.0),
                                          ),
                                        ),
                                        child: Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(shape: BoxShape.circle),
                                          child: Image.asset('assets/images/profile.png', fit: BoxFit.cover),
                                        ),
                                      ),

                                      Positioned(
                                        right: -2,
                                        bottom: 4,
                                        child: Container(
                                          width: 30.0,
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            border: Border.all(color: Colors.white, width: 2.0),
                                          ),
                                          child: Container(
                                            margin: const EdgeInsets.all(3.0),
                                            decoration: const BoxDecoration(color: Color(0xFFFFC107), shape: BoxShape.circle),
                                            child: const Icon(Icons.verified_rounded, color: Color(0xFF0F766E), size: 16.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 14.0),

                                  Expanded(
                                    child: Obx(
                                      () => Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller.staffName.value.isEmpty ? '-' : controller.staffName.value,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: FlutterFlowThemeNew.of(context).titleMedium.override(
                                              font: FlutterFlowThemeNew.of(context).titleMedium,
                                              color: FlutterFlowThemeNew.of(context).secondaryBackground,
                                              letterSpacing: 0.0,
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const SizedBox(height: 8.0),

                                          Container(
                                            padding: const EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                                            decoration: BoxDecoration(
                                              color: Colors.white.withOpacity(0.14),
                                              borderRadius: BorderRadius.circular(20.0),
                                              border: Border.all(color: Colors.white.withOpacity(0.14), width: 1.0),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const Icon(Icons.badge_outlined, color: Color(0xFF7DD3FC), size: 16.0),
                                                const SizedBox(width: 8.0),
                                                Flexible(
                                                  child: Text(
                                                    controller.roleName.value.isEmpty ? '-' : controller.roleName.value,
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: FlutterFlowThemeNew.of(context).bodyMedium.override(
                                                      font: FlutterFlowThemeNew.of(context).bodyMedium,
                                                      color: FlutterFlowThemeNew.of(context).secondaryBackground,
                                                      letterSpacing: 0.0,
                                                      fontSize: 13.5,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
                                                colors: const [Color(0xFFFFD166), Color(0xFFFF7A45)],
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
                                          activeThumbColor: FlutterFlowThemeNew.of(context).secondaryBackground,
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
                                                colors: const [Color(0xFF89F7FE), Color(0xFF1D9BF0)],
                                                stops: const [0.0, 1.0],
                                                begin: const AlignmentDirectional(0.56, -1.0),
                                                end: const AlignmentDirectional(-0.56, 1.0),
                                              ),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Align(
                                              alignment: const AlignmentDirectional(0.0, 0.0),
                                              child: Icon(Icons.fingerprint, color: FlutterFlowThemeNew.of(context).secondaryBackground, size: 16.0),
                                            ),
                                          ),
                                          Text(
                                            'เข้าใช้งาน Touch ID / Face ID',
                                            style: FlutterFlowThemeNew.of(
                                              context,
                                            ).labelMedium.override(font: FlutterFlowThemeNew.of(context).labelMedium, letterSpacing: 0.0),
                                          ),
                                        ].divide(const SizedBox(width: 12.0)),
                                      ),
                                      Obx(
                                        () => Switch.adaptive(
                                          value: controller.switchValue2.value,
                                          onChanged: controller.isUpdatingBiometricToggle.value
                                              ? null
                                              : (newValue) async {
                                                  await controller.onBiometricToggleChanged(newValue);
                                                },
                                          activeThumbColor: FlutterFlowThemeNew.of(context).secondaryBackground,
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
                                      await Get.toNamed(
                                        Routes.PINCODE,
                                        arguments: {
                                          'isNewPassword': false,
                                          'isOpenProfile': true,
                                          'allowBiometric': false,
                                          'requireCurrentPinBeforeReset': true,
                                        },
                                      );
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
                                                  colors: const [Color(0xFFFFE680), Color(0xFFFFB000)],
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
                                              'ตั้งค่ารหัส PIN',
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
                                Divider(height: 1.0, thickness: 1.0, color: FlutterFlowThemeNew.of(context).primaryBackground),
                                Container(
                                  width: double.infinity,
                                  height: 48.0,
                                  decoration: const BoxDecoration(shape: BoxShape.rectangle),
                                  child: InkWell(
                                    onTap: () async {
                                      await Get.toNamed(Routes.EDITPASSWORD);
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
                                                gradient: const LinearGradient(
                                                  colors: [Color(0xFFFF9FBC), Color(0xFFE83E8C)],
                                                  stops: [0.0, 1.0],
                                                  begin: AlignmentDirectional(0.56, -1.0),
                                                  end: AlignmentDirectional(-0.56, 1.0),
                                                ),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Align(
                                                alignment: const AlignmentDirectional(0.0, 0.0),
                                                child: Icon(
                                                  Icons.password_rounded,
                                                  color: FlutterFlowThemeNew.of(context).secondaryBackground,
                                                  size: 16.0,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'ตั้งค่ารหัสผ่าน',
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
                                //Divider(height: 1.0, thickness: 1.0, color: FlutterFlowThemeNew.of(context).primaryBackground),
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
                                                    colors: [Color(0xFFC4B5FD), Color(0xFF7C3AED)],
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
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: true,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.viewInsetsOf(context),
                                            child: ButtonSheetLogoutWidgetDartWidget(onConfirm: controller.logout),
                                          );
                                        },
                                      );
                                      // showModalBottomSheet(
                                      //   isScrollControlled: true,
                                      //   backgroundColor: Colors.transparent,
                                      //   isDismissible: false,
                                      //   enableDrag: false,
                                      //   context: context,
                                      //   builder: (context) {
                                      //     return GestureDetector(
                                      //       child: Padding(
                                      //         padding: MediaQuery.viewInsetsOf(context),
                                      //         child: PopupWarningWidget(message: 'ผู้ป่วยรายนี้ได้รับการชำระเงินแล้ว ไม่สามารถเพิ่มรายการสั่งยาได้'),
                                      //       ),
                                      //     );
                                      //   },
                                      // );
                                      //  await controller.logout();
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
                                                    colors: const [Color(0xFFFF9A9E), Color(0xFFE11D48)],
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
              Positioned(
                left: 16.0,
                right: 16.0,
                bottom: 16.0,
                child: SafeArea(
                  top: false,
                  child: Align(
                    alignment: AlignmentDirectional.bottomStart,
                    child: Text(
                      'เวอร์ชั่น 26.4.8',
                      style: FlutterFlowThemeNew.of(context).bodySmall.override(
                        font: FlutterFlowThemeNew.of(context).bodySmall,
                        color: FlutterFlowThemeNew.of(context).secondaryText,
                        letterSpacing: 0.0,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HighwayOfficerHeaderCard extends StatelessWidget {
  const HighwayOfficerHeaderCard({
    super.key,
    required this.staffName,
    required this.staffCode,
    this.department = 'สคน. กรมทางหลวง',
    this.position = 'เจ้าหน้าที่ตรวจการณ์ภาคสนาม',
    this.profileImagePath = 'assets/images/profile.png',
    this.backgroundPatternPath = 'assets/images/bgappbar.png',
    this.primaryColor = const Color(0xFF0D47A1),
    this.secondaryColor = const Color(0xFF1565C0),
    this.deepColor = const Color(0xFF08306B),
    this.accentColor = const Color(0xFFFFC107),
    this.showLogo = false,
    this.logoPath,
  });

  final String staffName;
  final String staffCode;
  final String department;
  final String position;
  final String profileImagePath;
  final String backgroundPatternPath;
  final Color primaryColor;
  final Color secondaryColor;
  final Color deepColor;
  final Color accentColor;
  final bool showLogo;
  final String? logoPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28.0),
        boxShadow: const [BoxShadow(blurRadius: 16.0, color: Color(0x1F000000), offset: Offset(0.0, 8.0))],
        gradient: LinearGradient(
          colors: [secondaryColor, primaryColor, deepColor],
          stops: const [0.0, 0.55, 1.0],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28.0),
        child: Stack(
          children: [
            Positioned.fill(
              child: Opacity(opacity: 0.16, child: Image.asset(backgroundPatternPath, fit: BoxFit.cover)),
            ),

            Positioned.fill(
              child: CustomPaint(
                painter: _HighwayRoadPainter(
                  lineColor: Colors.white.withOpacity(0.06),
                  roadColor: Colors.white.withOpacity(0.06),
                  dashColor: accentColor.withOpacity(0.22),
                ),
              ),
            ),

            Positioned(
              top: -20,
              left: -20,
              child: Container(
                width: 180,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient: LinearGradient(
                    colors: [Colors.white.withOpacity(0.18), Colors.white.withOpacity(0.01)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),

            Positioned(
              top: -24,
              right: -28,
              child: Container(
                width: 170,
                height: 170,
                decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.04)),
              ),
            ),

            Positioned(
              right: 16,
              top: 14,
              child: Opacity(opacity: 0.10, child: const Icon(Icons.shield_outlined, size: 96.0, color: Colors.white)),
            ),

            Positioned(
              right: 56,
              top: 48,
              child: Opacity(opacity: 0.14, child: const Icon(Icons.videocam_outlined, size: 34.0, color: Colors.white)),
            ),

            if (showLogo && logoPath != null)
              Positioned(
                right: 16,
                top: 16,
                child: Container(
                  width: 52,
                  height: 52,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.10),
                    border: Border.all(color: Colors.white.withOpacity(0.18)),
                  ),
                  child: ClipOval(child: Image.asset(logoPath!, fit: BoxFit.cover)),
                ),
              ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 8.0,
                decoration: BoxDecoration(gradient: LinearGradient(colors: [accentColor, const Color(0xFFFFD54F)])),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildAvatar(),
                  const SizedBox(width: 14.0),
                  Expanded(child: _buildInfo(context)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 88.0,
          height: 88.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 3.0),
            boxShadow: const [BoxShadow(blurRadius: 12.0, color: Color(0x26000000), offset: Offset(0.0, 4.0))],
            gradient: LinearGradient(colors: [Colors.white, secondaryColor], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: Image.asset(profileImagePath, fit: BoxFit.cover),
          ),
        ),
        Positioned(
          right: -2,
          bottom: 4,
          child: Container(
            width: 30.0,
            height: 30.0,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2.0),
            ),
            child: Container(
              margin: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(color: accentColor, shape: BoxShape.circle),
              child: const Icon(Icons.verified_rounded, color: Color(0xFF08306B), size: 16.0),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfo(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          staffName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.white, letterSpacing: 0.0, fontSize: 22.0, fontWeight: FontWeight.w700, height: 1.15),
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            const Icon(Icons.account_balance_outlined, color: Colors.white, size: 18.0),
            const SizedBox(width: 8.0),
            Expanded(
              child: Text(
                department,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: accentColor, letterSpacing: 0.0, fontSize: 16.0, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10.0),
        Container(
          padding: const EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.14),
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(color: Colors.white.withOpacity(0.14), width: 1.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.badge_outlined, color: accentColor, size: 16.0),
              const SizedBox(width: 8.0),
              Flexible(
                child: Text(
                  position,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white, letterSpacing: 0.0, fontSize: 13.5, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        Text(
          'รหัสเจ้าหน้าที่ $staffCode',
          style: TextStyle(color: Colors.white.withOpacity(0.82), letterSpacing: 0.0, fontSize: 12.5, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 10.0),

        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: [
            _buildChip(icon: Icons.shield_outlined, label: 'เฝ้าระวัง'),
            _buildChip(icon: Icons.videocam_outlined, label: 'กล้อง'),
            _buildChip(icon: Icons.alt_route, label: 'ทางหลวง'),
          ],
        ),
      ],
    );
  }

  Widget _buildChip({required IconData icon, required String label}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.10),
        borderRadius: BorderRadius.circular(18.0),
        border: Border.all(color: Colors.white.withOpacity(0.10)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 14.0),
          const SizedBox(width: 6.0),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 11.5, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class _HighwayRoadPainter extends CustomPainter {
  const _HighwayRoadPainter({required this.lineColor, required this.roadColor, required this.dashColor});

  final Color lineColor;
  final Color roadColor;
  final Color dashColor;

  @override
  void paint(Canvas canvas, Size size) {
    final wavePaint = Paint()
      ..color = lineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.1;

    for (double i = -10; i < size.height + 30; i += 14) {
      final path = Path()
        ..moveTo(0, i)
        ..cubicTo(size.width * 0.22, i - 16, size.width * 0.46, i + 20, size.width * 0.72, i + 4)
        ..cubicTo(size.width * 0.84, i - 2, size.width * 0.93, i - 10, size.width, i + 8);
      canvas.drawPath(path, wavePaint);
    }

    final roadPaint = Paint()
      ..color = roadColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final roadPath = Path()
      ..moveTo(size.width * 0.63, 0)
      ..quadraticBezierTo(size.width * 0.80, size.height * 0.38, size.width * 0.94, size.height);
    canvas.drawPath(roadPath, roadPaint);

    final dashPaint = Paint()
      ..color = dashColor
      ..strokeWidth = 2.6
      ..strokeCap = StrokeCap.round;

    for (double y = 20; y < size.height - 12; y += 16) {
      canvas.drawLine(Offset(size.width * 0.79, y), Offset(size.width * 0.79, y + 7), dashPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
