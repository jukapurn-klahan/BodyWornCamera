import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:styled_divider/styled_divider.dart';

import '../../../../flutter_flow/flutter_flow_icon_button.dart';
import '../../../../flutter_flow/flutter_flow_theme_new.dart';
import '../../../../flutter_flow/flutter_flow_util.dart';
import '../../../routes/app_pages.dart';
import '../controllers/activity_controller.dart';

class ActivityView extends GetView<ActivityController> {
  const ActivityView({super.key});
  @override
  Widget build(BuildContext context) {
    final String type = 'gift';
    final icon = _badgeIcon(type);
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
          icon: Icon(
            Icons.keyboard_arrow_left_rounded,
            color: Colors.white,
            size: 24.0,
          ),
          onPressed: () async {},
        ),
        title: Text(
          'รายการกิจกรรม',
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
          color: FlutterFlowThemeNew.of(context).primaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
              offset: Offset(0.0, 0.0),
            ),
          ],
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
            Padding(
              padding: EdgeInsetsDirectional.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: TextFormField(
                      controller: controller.textController,
                      focusNode: controller.textFieldFocusNode,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: 'ค้นหา...',
                        hintStyle: FlutterFlowThemeNew.of(context).bodyMedium
                            .override(
                              fontFamily: FlutterFlowThemeNew.of(
                                context,
                              ).bodyMediumFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: !FlutterFlowThemeNew.of(
                                context,
                              ).bodyMediumIsCustom,
                            ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowThemeNew.of(context).customColor5,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowThemeNew.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowThemeNew.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        filled: true,
                        fillColor: FlutterFlowThemeNew.of(
                          context,
                        ).secondaryBackground,
                        prefixIcon: Icon(Icons.search_rounded, size: 20.0),
                      ),
                      style: FlutterFlowThemeNew.of(context).titleSmall
                          .override(
                            fontFamily: FlutterFlowThemeNew.of(
                              context,
                            ).titleSmallFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowThemeNew.of(
                              context,
                            ).titleSmallIsCustom,
                          ),
                      cursorColor: FlutterFlowThemeNew.of(context).primary,
                      validator: controller.textControllerValidator.asValidator(
                        context,
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 12.0)),
              ),
            ),
            Divider(height: 1.0, thickness: 1.0, color: Color(0xFFD7D8D9)),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: ListView(
                  padding: EdgeInsets.fromLTRB(0, 16.0, 0, 24.0),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    InkWell(
                      onTap: () async {
                        await Get.toNamed(Routes.ACTIVITY_TASK_DETAILS_WIDGET);
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowThemeNew.of(
                            context,
                          ).secondaryBackground,
                          borderRadius: BorderRadius.circular(24.0),
                          border: Border.all(
                            color: FlutterFlowThemeNew.of(
                              context,
                            ).secondaryBackground,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(
                            valueOrDefault<double>(() {
                              if (MediaQuery.sizeOf(context).width <
                                  kBreakpointSmall) {
                                return 12.0;
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointMedium) {
                                return 12.0;
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointLarge) {
                                return 16.0;
                              } else {
                                return 16.0;
                              }
                            }(), 0.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: RichText(
                                          textScaler: MediaQuery.of(
                                            context,
                                          ).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    'SC-001 | ออกตรวจพื้นที่ NWL 1',
                                                style:
                                                    FlutterFlowThemeNew.of(
                                                      context,
                                                    ).titleSmall.override(
                                                      fontFamily:
                                                          FlutterFlowThemeNew.of(
                                                            context,
                                                          ).titleSmallFamily,
                                                      color:
                                                          FlutterFlowThemeNew.of(
                                                            context,
                                                          ).customColor1,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowThemeNew.of(
                                                            context,
                                                          ).titleSmallIsCustom,
                                                    ),
                                              ),
                                            ],
                                            style:
                                                FlutterFlowThemeNew.of(
                                                  context,
                                                ).bodyMedium.override(
                                                  fontFamily:
                                                      FlutterFlowThemeNew.of(
                                                        context,
                                                      ).bodyMediumFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowThemeNew.of(
                                                        context,
                                                      ).bodyMediumIsCustom,
                                                ),
                                          ),
                                        ),
                                      ),

                                      const SizedBox(width: 8),
                                      _TypeBadge(
                                        icon: icon,
                                        text: 'อนุมัติ',
                                        // สี badge ตาม type
                                        bg: type == 'discount'
                                            ? const Color(0xFFFFEDD5) // ส้มอ่อน
                                            : type == 'point'
                                            ? const Color(
                                                0xFFFEF9C3,
                                              ) // เหลืองอ่อน
                                            : const Color(
                                                0xFFDCFCE7,
                                              ), // เขียวอ่อน
                                        fg: type == 'discount'
                                            ? const Color(0xFFF97316)
                                            : type == 'point'
                                            ? const Color(0xFFCA8A04)
                                            : const Color(0xFF16A34A),
                                      ),
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                  RichText(
                                    textScaler: MediaQuery.of(
                                      context,
                                    ).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'รายอะเอียดคำขอ.......',
                                          style: FlutterFlowThemeNew.of(context)
                                              .labelSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowThemeNew.of(
                                                      context,
                                                    ).labelSmallFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowThemeNew.of(
                                                      context,
                                                    ).labelSmallIsCustom,
                                              ),
                                        ),
                                      ],
                                      style: FlutterFlowThemeNew.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: FlutterFlowThemeNew.of(
                                              context,
                                            ).bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowThemeNew.of(
                                                  context,
                                                ).bodyMediumIsCustom,
                                          ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 4.0)),
                              ),
                              StyledDivider(
                                height: 1.0,
                                thickness: 1.0,
                                color: FlutterFlowThemeNew.of(
                                  context,
                                ).alternate,
                                lineStyle: DividerLineStyle.dashed,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: _InfoBlock(
                                          title: 'วันที่เริ่มต้น',
                                          value: '01 มกราคม 2567',
                                          titleColor: const Color(0xFFEF4444),
                                          valueColor: const Color(0xFF111827),
                                        ),
                                      ),
                                      // divider
                                      Container(
                                        width: 1,
                                        height: 44,
                                        color: FlutterFlowThemeNew.of(
                                          context,
                                        ).primary,
                                      ),
                                      Expanded(
                                        child: _InfoBlock(
                                          title: 'วันที่สิ้นสุด',
                                          value: '31 มกราคม 2567',
                                          titleColor: const Color(0xFFEF4444),
                                          valueColor: const Color(0xFF111827),
                                          center: true,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ].divide(SizedBox(height: 12.0)),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        //  Get.toNamed(Routes.PRIVILEGE_MANAGEMENT_ADD);
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowThemeNew.of(
                            context,
                          ).secondaryBackground,
                          borderRadius: BorderRadius.circular(24.0),
                          border: Border.all(
                            color: FlutterFlowThemeNew.of(
                              context,
                            ).secondaryBackground,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(
                            valueOrDefault<double>(() {
                              if (MediaQuery.sizeOf(context).width <
                                  kBreakpointSmall) {
                                return 12.0;
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointMedium) {
                                return 12.0;
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointLarge) {
                                return 16.0;
                              } else {
                                return 16.0;
                              }
                            }(), 0.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: RichText(
                                          textScaler: MediaQuery.of(
                                            context,
                                          ).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    'SC-002 | ออกตรวจพื้นที่ NWL 2',
                                                style:
                                                    FlutterFlowThemeNew.of(
                                                      context,
                                                    ).titleSmall.override(
                                                      fontFamily:
                                                          FlutterFlowThemeNew.of(
                                                            context,
                                                          ).titleSmallFamily,
                                                      color:
                                                          FlutterFlowThemeNew.of(
                                                            context,
                                                          ).customColor1,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowThemeNew.of(
                                                            context,
                                                          ).titleSmallIsCustom,
                                                    ),
                                              ),
                                            ],
                                            style:
                                                FlutterFlowThemeNew.of(
                                                  context,
                                                ).bodyMedium.override(
                                                  fontFamily:
                                                      FlutterFlowThemeNew.of(
                                                        context,
                                                      ).bodyMediumFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowThemeNew.of(
                                                        context,
                                                      ).bodyMediumIsCustom,
                                                ),
                                          ),
                                        ),
                                      ),

                                      const SizedBox(width: 8),
                                      _TypeBadge(
                                        icon: icon,
                                        text: 'ไม่อนุมัติ',
                                        // สี badge ตาม type
                                        bg: const Color(0xFFFFEDD5),

                                        fg: const Color(0xFFF97316),
                                      ),
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                  RichText(
                                    textScaler: MediaQuery.of(
                                      context,
                                    ).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'รายอะเอียดคำขอ....... ',
                                          style: FlutterFlowThemeNew.of(context)
                                              .labelSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowThemeNew.of(
                                                      context,
                                                    ).labelSmallFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowThemeNew.of(
                                                      context,
                                                    ).labelSmallIsCustom,
                                              ),
                                        ),
                                      ],
                                      style: FlutterFlowThemeNew.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: FlutterFlowThemeNew.of(
                                              context,
                                            ).bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowThemeNew.of(
                                                  context,
                                                ).bodyMediumIsCustom,
                                          ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 4.0)),
                              ),
                              StyledDivider(
                                height: 1.0,
                                thickness: 1.0,
                                color: FlutterFlowThemeNew.of(
                                  context,
                                ).alternate,
                                lineStyle: DividerLineStyle.dashed,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: _InfoBlock(
                                          title: 'วันที่เริ่มต้น',
                                          value: '01 มกราคม 2567',
                                          titleColor: const Color(0xFFEF4444),
                                          valueColor: const Color(0xFF111827),
                                        ),
                                      ),
                                      // divider
                                      Container(
                                        width: 1,
                                        height: 44,
                                        color: FlutterFlowThemeNew.of(
                                          context,
                                        ).primary,
                                      ),
                                      Expanded(
                                        child: _InfoBlock(
                                          title: 'วันที่สิ้นสุด',
                                          value: '31 มกราคม 2567',
                                          titleColor: const Color(0xFFEF4444),
                                          valueColor: const Color(0xFF111827),
                                          center: true,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ].divide(SizedBox(height: 12.0)),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        //  Get.toNamed(Routes.PRIVILEGE_MANAGEMENT_ADD);
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowThemeNew.of(
                            context,
                          ).secondaryBackground,
                          borderRadius: BorderRadius.circular(24.0),
                          border: Border.all(
                            color: FlutterFlowThemeNew.of(
                              context,
                            ).secondaryBackground,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(
                            valueOrDefault<double>(() {
                              if (MediaQuery.sizeOf(context).width <
                                  kBreakpointSmall) {
                                return 12.0;
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointMedium) {
                                return 12.0;
                              } else if (MediaQuery.sizeOf(context).width <
                                  kBreakpointLarge) {
                                return 16.0;
                              } else {
                                return 16.0;
                              }
                            }(), 0.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: RichText(
                                          textScaler: MediaQuery.of(
                                            context,
                                          ).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    'SC-003 | ออกตรวจพื้นที่ NWL 3',
                                                style:
                                                    FlutterFlowThemeNew.of(
                                                      context,
                                                    ).titleSmall.override(
                                                      fontFamily:
                                                          FlutterFlowThemeNew.of(
                                                            context,
                                                          ).titleSmallFamily,
                                                      color:
                                                          FlutterFlowThemeNew.of(
                                                            context,
                                                          ).customColor1,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowThemeNew.of(
                                                            context,
                                                          ).titleSmallIsCustom,
                                                    ),
                                              ),
                                            ],
                                            style:
                                                FlutterFlowThemeNew.of(
                                                  context,
                                                ).bodyMedium.override(
                                                  fontFamily:
                                                      FlutterFlowThemeNew.of(
                                                        context,
                                                      ).bodyMediumFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowThemeNew.of(
                                                        context,
                                                      ).bodyMediumIsCustom,
                                                ),
                                          ),
                                        ),
                                      ),

                                      const SizedBox(width: 8),
                                      _TypeBadge(
                                        icon: icon,
                                        text: 'อนุมัติ',
                                        // สี badge ตาม type
                                        bg: type == 'discount'
                                            ? const Color(0xFFFFEDD5) // ส้มอ่อน
                                            : type == 'point'
                                            ? const Color(
                                                0xFFFEF9C3,
                                              ) // เหลืองอ่อน
                                            : const Color(
                                                0xFFDCFCE7,
                                              ), // เขียวอ่อน
                                        fg: type == 'discount'
                                            ? const Color(0xFFF97316)
                                            : type == 'point'
                                            ? const Color(0xFFCA8A04)
                                            : const Color(0xFF16A34A),
                                      ),
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                  RichText(
                                    textScaler: MediaQuery.of(
                                      context,
                                    ).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'รายอะเอียดคำขอ.......',
                                          style: FlutterFlowThemeNew.of(context)
                                              .labelSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowThemeNew.of(
                                                      context,
                                                    ).labelSmallFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowThemeNew.of(
                                                      context,
                                                    ).labelSmallIsCustom,
                                              ),
                                        ),
                                      ],
                                      style: FlutterFlowThemeNew.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: FlutterFlowThemeNew.of(
                                              context,
                                            ).bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowThemeNew.of(
                                                  context,
                                                ).bodyMediumIsCustom,
                                          ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 4.0)),
                              ),
                              StyledDivider(
                                height: 1.0,
                                thickness: 1.0,
                                color: FlutterFlowThemeNew.of(
                                  context,
                                ).alternate,
                                lineStyle: DividerLineStyle.dashed,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: _InfoBlock(
                                          title: 'วันที่เริ่มต้น',
                                          value: '01 มกราคม 2567',
                                          titleColor: const Color(0xFFEF4444),
                                          valueColor: const Color(0xFF111827),
                                        ),
                                      ),
                                      // divider
                                      Container(
                                        width: 1,
                                        height: 44,
                                        color: FlutterFlowThemeNew.of(
                                          context,
                                        ).primary,
                                      ),
                                      Expanded(
                                        child: _InfoBlock(
                                          title: 'วันที่สิ้นสุด',
                                          value: '31 มกราคม 2567',
                                          titleColor: const Color(0xFFEF4444),
                                          valueColor: const Color(0xFF111827),
                                          center: true,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ].divide(SizedBox(height: 12.0)),
                          ),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 8.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

IconData _badgeIcon(String type) {
  switch (type) {
    case 'discount':
      return Icons.local_offer_rounded;
    case 'point':
      return Icons.stars_rounded;
    case 'gift':
      return Icons.stars_rounded;
    default:
      return Icons.campaign_rounded;
  }
}

class _TypeBadge extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color bg;
  final Color fg;

  const _TypeBadge({
    required this.icon,
    required this.text,
    required this.bg,
    required this.fg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: fg),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              color: fg,
              fontWeight: FontWeight.w800,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoBlock extends StatelessWidget {
  const _InfoBlock({
    required this.title,
    required this.value,
    required this.titleColor,
    required this.valueColor,
    this.center = false,
  });

  final String title;
  final String value;
  final Color titleColor;
  final Color valueColor;
  final bool center;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: center
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: FlutterFlowThemeNew.of(context).labelSmall.override(
            fontFamily: FlutterFlowThemeNew.of(context).labelSmallFamily,
            color: FlutterFlowThemeNew.of(context).customColor1,
            letterSpacing: 0.0,
            useGoogleFonts: !FlutterFlowThemeNew.of(context).labelSmallIsCustom,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: FlutterFlowThemeNew.of(context).bodyMedium.override(
            fontFamily: FlutterFlowThemeNew.of(context).bodyMediumFamily,
            letterSpacing: 0.0,
            useGoogleFonts: !FlutterFlowThemeNew.of(context).bodyMediumIsCustom,
          ),
        ),
      ],
    );
  }
}
