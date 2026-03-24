

import 'dart:developer';

import 'package:badges/badges.dart' as badges;
import 'package:body_camera/app/routes/app_pages.dart';
import 'package:body_camera/flutter_flow/flutter_flow_util.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:googleapis_auth/auth_io.dart';

import '../../../../fcm/notification_services.dart';
import '../../../../flutter_flow/flutter_flow_theme_new.dart';
import '../controllers/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({super.key});
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
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, _) => [
            SliverAppBar(
              pinned: false,
              floating: true,
              snap: true,
              backgroundColor: FlutterFlowThemeNew.of(context).primary,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      width: () {
                        if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                          return 50.0;
                        } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                          return 50.0;
                        } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                          return 56.0;
                        } else {
                          return 56.0;
                        }
                      }(),
                      height: () {
                        if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                          return 50.0;
                        } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                          return 50.0;
                        } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                          return 56.0;
                        } else {
                          return 56.0;
                        }
                      }(),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFA0D6FF), FlutterFlowThemeNew.of(context).primary],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(0.0, -1.0),
                          end: AlignmentDirectional(0, 1.0),
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(color: FlutterFlowThemeNew.of(context).secondaryBackground),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            width: 80.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFFA0D6FF), FlutterFlowThemeNew.of(context).primary],
                                stops: [0.0, 1.0],
                                begin: AlignmentDirectional(0.0, -1.0),
                                end: AlignmentDirectional(0, 1.0),
                              ),
                              shape: BoxShape.circle,
                              border: Border.all(color: FlutterFlowThemeNew.of(context).secondaryBackground),
                            ),
                            child: ClipOval(
                              child: Image.asset('assets/images/profile.png', fit: BoxFit.cover, alignment: Alignment.topCenter),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Text(
                          'ตำแหน่ง : เจ้าหน้าที',
                          style: FlutterFlowThemeNew.of(context).bodySmall.override(
                            fontFamily: FlutterFlowThemeNew.of(context).bodySmallFamily,
                            color: FlutterFlowThemeNew.of(context).secondaryBackground,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w300,
                            useGoogleFonts: !FlutterFlowThemeNew.of(context).bodySmallIsCustom,
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'คุณ ทดสอบระบบ Camera',
                                style: FlutterFlowThemeNew.of(context).bodyLarge.override(
                                  fontFamily: FlutterFlowThemeNew.of(context).bodyLargeFamily,
                                  color: FlutterFlowThemeNew.of(context).secondaryBackground,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: !FlutterFlowThemeNew.of(context).bodyLargeIsCustom,
                                ),
                              ),
                            ],
                            style: FlutterFlowThemeNew.of(context).bodyLarge.override(
                              fontFamily: FlutterFlowThemeNew.of(context).bodyLargeFamily,
                              color: FlutterFlowThemeNew.of(context).secondaryBackground,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: !FlutterFlowThemeNew.of(context).bodyLargeIsCustom,
                            ),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: 4.0)),
                  ),
                ].divide(SizedBox(width: 12.0)),
              ),
              actions: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 24.0, 0.0),
                  child: badges.Badge(
                    badgeContent: Text(
                      '2',
                      style: GoogleFonts.sarabun(
                        color: FlutterFlowThemeNew.of(context).secondaryBackground,
                        fontWeight: FontWeight.normal,
                        fontSize: 12.0,
                      ),
                    ),
                    showBadge: true,
                    shape: badges.BadgeShape.circle,
                    badgeColor: FlutterFlowThemeNew.of(context).error,
                    elevation: 0.0,
                    padding: EdgeInsets.all(6.0),
                    position: badges.BadgePosition.topEnd(),
                    animationType: badges.BadgeAnimationType.scale,
                    toAnimate: true,
                    child: Align(
                      alignment: AlignmentDirectional(-0.63, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          // แสดง local notification ทดสอบ

                          // String accessToken = await NotificationServices.getAccessToken();
                          // log('accessToken : $accessToken');
                          // await controller.showTestNotification();

                          // ไปหน้ารายการแจ้งเตือนเดิม
                          Get.toNamed(Routes.NOTI_LIST);
                          //   context.pushNamed(NotiWidget.routeName);
                        },
                        child: Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(color: Color(0x93164874), shape: BoxShape.circle),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Icon(Icons.notifications_outlined, color: FlutterFlowThemeNew.of(context).secondaryBackground, size: 24.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
              centerTitle: false,
              elevation: 0.0,
            ),
          ],
          body: Builder(
            builder: (context) {
              return Container(
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
                      padding: const EdgeInsets.fromLTRB(0, 16.0, 0, 124.0),
                      scrollDirection: Axis.vertical,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'รายการกล้อง',
                            style: FlutterFlowThemeNew.of(
                              context,
                            ).titleMedium.copyWith(color: const Color.fromARGB(255, 255, 255, 255), fontWeight: FontWeight.bold),
                          ),
                        ),

                        CameraGridView(),
                      ].divide(const SizedBox(height: 16.0)),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class CameraList extends StatelessWidget {
  const CameraList({super.key, required this.controller});

  final HomePageController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(color: FlutterFlowThemeNew.of(context).secondaryBackground, borderRadius: BorderRadius.circular(24.0)),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    'รายการกล้อง',
                    style: FlutterFlowThemeNew.of(context).titleSmall.override(
                      fontFamily: FlutterFlowThemeNew.of(context).titleSmallFamily,
                      color: FlutterFlowThemeNew.of(context).primaryText,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowThemeNew.of(context).titleSmallFamily),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      // await showModalBottomSheet(
                      //   isScrollControlled: true,
                      //   backgroundColor: Colors.transparent,
                      //   enableDrag: true,
                      //   context: context,
                      //   builder: (context) {
                      //     return Padding(
                      //       padding: MediaQuery.viewInsetsOf(context),
                      //       child: FillterLabhistoryWidget(filter: controller.filerDepartment),
                      //     );
                      //   },
                      // ).then((value) {
                      //   if (value is String) {
                      //     log('dex>> value $value');
                      //     if (value == 'IPD') {
                      //       controller.filerDepartment = '%20and%20lab_head.department%20%3D%20%27IPD%27%20';
                      //       controller.getAllLabHistoryData();
                      //       controller.update();
                      //     } else {
                      //       controller.filerDepartment = '';
                      //       controller.getAllLabHistoryData();
                      //       controller.update();
                      //     }
                      //   }
                      // });
                    },
                    child: Container(
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
                        color: const Color(0x396C6C6C),
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFFA8A8A8), width: 0.4),
                      ),
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: FaIcon(
                          FontAwesomeIcons.sliders,
                          color: FlutterFlowThemeNew.of(context).secondaryText,
                          size: () {
                            if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                              return 10.0;
                            } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                              return 10.0;
                            } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                              return 12.0;
                            } else {
                              return 12.0;
                            }
                          }(),
                        ),
                      ),
                    ),
                  ),
                ),
              ].divide(const SizedBox(width: 8.0)),
            ),

            // (controller.dataLabHistory.isEmpty)
            //     ? Center(child: Text('ไม่พบประวัติการสั่ง LAB', style: TextStyle(color: Colors.grey[600])))
            //     : ListView.separated(
            //       separatorBuilder:
            //           (context, index) => SizedBox(
            //             height: () {
            //               if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
            //                 return 12.0;
            //               } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
            //                 return 12.0;
            //               } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
            //                 return 16.0;
            //               } else {
            //                 return 16.0;
            //               }
            //             }(),
            //           ),
            //       shrinkWrap: true,
            //       physics: const BouncingScrollPhysics(),
            //       itemCount: controller.dataLabHistory.length,
            //       itemBuilder: (context, index) {
            //         final labHistorryData = controller.dataLabHistory[index];
            //         final dateTime = labHistorryData.key;
            //         final valueData = labHistorryData.value;

            //         String dateResult = controller.formatDateTime(dateTime);

            //         String formName = '', dateTimeValue = '';
            //         if (dateResult.contains('Form :')) {
            //           formName = dateResult.split('Form : ').last.trim();
            //           dateTimeValue = dateResult.split('Form : ').first.trim();
            //         }
            //         // log('dex>> dateTimeValue $dateTimeValue');

            //         return InkWell(
            //           onTap: () {
            //             controller.isExpand[index] = !controller.isExpand[index];
            //             controller.update();

            //             final groupedData = <MapEntry<String, List<LabOrderListAll>>>[];
            //             for (int i = 0; i < valueData.length; i++) {
            //               final item = valueData[i];
            //               String groupKey;

            //               if (item.lab_items_sub_group_code != null) {
            //                 groupKey = '${item.form_name} ${item.lab_items_sub_group_code ?? ''}';
            //               } else {
            //                 groupKey = '${item.form_name} ${item.lab_items_name ?? ''} $i';
            //               }

            //               final existingIndex = groupedData.indexWhere((entry) => entry.key == groupKey);
            //               if (existingIndex != -1) {
            //                 groupedData[existingIndex] = MapEntry(groupKey, [...groupedData[existingIndex].value, item]);
            //               } else {
            //                 groupedData.add(MapEntry(groupKey, [item]));
            //               }
            //               controller.resultText = item.result_rtf ?? '';
            //             }
            //             controller.groupedLabData[index] = groupedData;
            //             controller.update();
            //             log('dex>> resultText ${controller.resultText}');
            //           },
            //           child: Container(
            //             decoration: BoxDecoration(
            //               color: FlutterFlowThemeNew.of(context).secondaryBackground,
            //               borderRadius: BorderRadius.circular(24.0),
            //             ),
            //             child: Column(
            //               mainAxisSize: MainAxisSize.max,
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Padding(
            //                   padding: EdgeInsets.all(
            //                     valueOrDefault<double>(() {
            //                       if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
            //                         return 12.0;
            //                       } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
            //                         return 12.0;
            //                       } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
            //                         return 16.0;
            //                       } else {
            //                         return 16.0;
            //                       }
            //                     }(), 0.0),
            //                   ),
            //                   child: Row(
            //                     mainAxisSize: MainAxisSize.max,
            //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                     children: [
            //                       _buildFormNameMethod(context, formName),
            //                       Row(
            //                         mainAxisSize: MainAxisSize.max,
            //                         children: [
            //                           RichText(
            //                             textScaler: MediaQuery.of(context).textScaler,
            //                             text: TextSpan(
            //                               children: [
            //                                 TextSpan(
            //                                   text: dateTimeValue,
            //                                   style: FlutterFlowThemeNew.of(context).labelSmall.override(
            //                                     fontFamily: FlutterFlowThemeNew.of(context).labelSmallFamily,
            //                                     // color: widget!.color,
            //                                     letterSpacing: 0.0,
            //                                     useGoogleFonts: !FlutterFlowThemeNew.of(context).labelSmallIsCustom,
            //                                   ),
            //                                 ),
            //                               ],
            //                               style: FlutterFlowThemeNew.of(context).labelSmall.override(
            //                                 fontFamily: FlutterFlowThemeNew.of(context).labelSmallFamily,
            //                                 letterSpacing: 0.0,
            //                                 useGoogleFonts: !FlutterFlowThemeNew.of(context).labelSmallIsCustom,
            //                               ),
            //                             ),
            //                           ),
            //                           Container(
            //                             decoration: BoxDecoration(
            //                               color: FlutterFlowThemeNew.of(context).primaryBackground,
            //                               shape: BoxShape.circle,
            //                             ),
            //                             child: Icon(
            //                               (controller.isExpand[index] == true) ? Icons.expand_less : Icons.expand_more,
            //                               size: 20,
            //                               color: FlutterFlowThemeNew.of(context).secondaryText,
            //                             ),
            //                           ),
            //                         ].divide(const SizedBox(width: 8.0)),
            //                       ),
            //                     ].divide(const SizedBox(width: 16.0)),
            //                   ),
            //                 ),
            //                 if (controller.isExpand[index] == true) ...[
            //                   Container(
            //                     width: double.infinity,
            //                     decoration: BoxDecoration(
            //                       color: const Color(0x0B2397FF),
            //                       borderRadius: BorderRadius.circular(24.0),
            //                       border: Border.all(color: FlutterFlowThemeNew.of(context).secondaryBackground, width: 2.0),
            //                     ),
            //                     child: Column(
            //                       children: [
            //                         ...?controller.groupedLabData[index]?.map((entry) {
            //                           return Padding(
            //                             padding: EdgeInsets.all(
            //                               valueOrDefault<double>(() {
            //                                 if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
            //                                   return 8.0;
            //                                 } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
            //                                   return 8.0;
            //                                 } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
            //                                   return 12.0;
            //                                 } else {
            //                                   return 12.0;
            //                                 }
            //                               }(), 0.0),
            //                             ),
            //                             child: Column(
            //                               mainAxisSize: MainAxisSize.max,
            //                               crossAxisAlignment: CrossAxisAlignment.start,
            //                               children: [
            //                                 // แสดง Header
            //                                 Row(
            //                                   mainAxisSize: MainAxisSize.max,
            //                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                                   children: [
            //                                     Expanded(
            //                                       child: Text(
            //                                         ((entry.value.first.lab_items_sub_group_name ?? '').isNotEmpty)
            //                                             ? '${entry.value.first.lab_items_sub_group_name ?? '-'} [Profile]'
            //                                             : '${entry.value.first.lab_items_name}',
            //                                         overflow: TextOverflow.ellipsis,
            //                                         style: FlutterFlowThemeNew.of(context).bodyMedium.override(
            //                                           fontFamily: FlutterFlowThemeNew.of(context).bodyMediumFamily,
            //                                           color: FlutterFlowThemeNew.of(context).accent1,
            //                                           letterSpacing: 0.0,
            //                                           useGoogleFonts: !FlutterFlowThemeNew.of(context).bodyMediumIsCustom,
            //                                         ),
            //                                       ),
            //                                     ),
            //                                     if ((entry.value.first.lab_items_sub_group_name ?? '').isEmpty)
            //                                       Row(
            //                                         mainAxisSize: MainAxisSize.max,
            //                                         mainAxisAlignment: MainAxisAlignment.end,
            //                                         children: [
            //                                           ((entry.value.first.lab_order_result ?? '').isEmpty)
            //                                               ? _buildWatingResultMethod(context)
            //                                               : _buildOrderResultMethod(
            //                                                 context: context,
            //                                                 orderResult: entry.value.first.lab_order_result,
            //                                                 abnormalResult: entry.value.first.abnormal_result,
            //                                                 color:
            //                                                     (entry.value.first.abnormal_result == 'Y' ||
            //                                                             controller.getAbnormalStatus(entry.value.first) == 'ผิดปกติ')
            //                                                         ? FlutterFlowThemeNew.of(context).error
            //                                                         : FlutterFlowThemeNew.of(context).success,
            //                                                 colorsList:
            //                                                     (entry.value.first.abnormal_result == 'Y' ||
            //                                                             controller.getAbnormalStatus(entry.value.first) == 'ผิดปกติ')
            //                                                         ? const [Color(0x19F47A86), Color(0x25BE1E2D)]
            //                                                         : const [Color(0x1A5FD187), Color(0x273AAA5F)],
            //                                               ),

            //                                           /* Row(
            //                                             mainAxisSize: MainAxisSize.max,
            //                                             mainAxisAlignment: MainAxisAlignment.end,
            //                                             children: [
            //                                               InkWell(
            //                                                 onTap:
            //                                                     (entry.value.first.lab_order_result == null || entry.value.first.lab_order_result == '')
            //                                                         ? null
            //                                                         : () {
            //                                                           log('dex>> view labItem.lab_items_code ${entry.value.first.lab_items_code}');
            //                                                           showModalBottomSheet(
            //                                                             isScrollControlled: true,
            //                                                             backgroundColor: Colors.transparent,
            //                                                             isDismissible: false,
            //                                                             useSafeArea: true,
            //                                                             context: context,
            //                                                             builder: (context) {
            //                                                               return GestureDetector(
            //                                                                 onTap: () {
            //                                                                   FocusScope.of(context).unfocus();
            //                                                                   FocusManager.instance.primaryFocus?.unfocus();
            //                                                                 },
            //                                                                 child: Padding(
            //                                                                   padding: MediaQuery.viewInsetsOf(context),
            //                                                                   child: HistoryLabXrayWidget(itemCode: entry.value.first.lab_items_code ?? 0, hn: controller.hn ?? ''),
            //                                                                 ),
            //                                                               );
            //                                                             },
            //                                                           );
            //                                                         },
            //                                                 child: Opacity(
            //                                                   opacity: 0.5,
            //                                                   child: Container(
            //                                                     width: 40,
            //                                                     height: 40,
            //                                                     decoration: BoxDecoration(color: FlutterFlowThemeNew.of(context).primaryBackground, shape: BoxShape.circle),
            //                                                     child: Align(
            //                                                       alignment: const AlignmentDirectional(0.0, 0.0),
            //                                                       child: Icon(
            //                                                         (entry.value.first.lab_order_result == null || entry.value.first.lab_order_result == '')
            //                                                             ? Icons.visibility_off
            //                                                             : Icons.remove_red_eye_sharp,
            //                                                         color:
            //                                                             (entry.value.first.lab_order_result == null || entry.value.first.lab_order_result == '')
            //                                                                 ? FlutterFlowThemeNew.of(context).secondaryText
            //                                                                 : FlutterFlowThemeNew.of(context).customColor1,
            //                                                         size: 20.0,
            //                                                       ),
            //                                                     ),
            //                                                   ),
            //                                                 ),
            //                                               ),
            //                                               InkWell(
            //                                                 onTap:
            //                                                     (entry.value.first.image_count != null && entry.value.first.image_count! > 0)
            //                                                         ? () {
            //                                                           log('dex>> pic labItem.lab_items_code ${entry.value.first.lab_items_code}');
            //                                                           showModalBottomSheet(
            //                                                             isScrollControlled: true,
            //                                                             backgroundColor: Colors.transparent,
            //                                                             isDismissible: false,
            //                                                             useSafeArea: true,
            //                                                             context: context,
            //                                                             builder: (context) {
            //                                                               return Padding(
            //                                                                 padding: MediaQuery.viewInsetsOf(context),
            //                                                                 child: LabmageWidget(labOrderNumber: entry.value.first.lab_order_number ?? 0),
            //                                                               );
            //                                                             },
            //                                                           );
            //                                                         }
            //                                                         : null,
            //                                                 child: Opacity(
            //                                                   opacity: 0.5,
            //                                                   child: Container(
            //                                                     width: 40,
            //                                                     height: 40,
            //                                                     decoration: BoxDecoration(color: FlutterFlowThemeNew.of(context).primaryBackground, shape: BoxShape.circle),
            //                                                     child: Align(
            //                                                       alignment: const AlignmentDirectional(0.0, 0.0),
            //                                                       child: Icon(
            //                                                         (entry.value.first.image_count != null && entry.value.first.image_count! > 0) ? Icons.image : Icons.image_not_supported,
            //                                                         color:
            //                                                             (entry.value.first.image_count != null && entry.value.first.image_count! > 0)
            //                                                                 ? FlutterFlowThemeNew.of(context).customColor1
            //                                                                 : FlutterFlowThemeNew.of(context).secondaryText,
            //                                                         size: 20.0,
            //                                                       ),
            //                                                     ),
            //                                                   ),
            //                                                 ),
            //                                               ),
            //                                             ].divide(const SizedBox(width: 4.0)),
            //                                           ), */
            //                                           const SizedBox(width: 12.0),
            //                                           InkWell(
            //                                             splashColor: Colors.transparent,
            //                                             focusColor: Colors.transparent,
            //                                             hoverColor: Colors.transparent,
            //                                             highlightColor: Colors.transparent,
            //                                             onTap: () async {
            //                                               await showModalBottomSheet(
            //                                                 isScrollControlled: true,
            //                                                 backgroundColor: Colors.transparent,
            //                                                 enableDrag: false,
            //                                                 context: context,
            //                                                 builder: (context) {
            //                                                   return Padding(
            //                                                     padding: MediaQuery.viewInsetsOf(context),
            //                                                     child: BottomsheetLabViewMoreWidget(
            //                                                       labItem: entry.value.first,
            //                                                       controller: controller,
            //                                                     ),
            //                                                   );
            //                                                 },
            //                                               );
            //                                             },
            //                                             child: Container(
            //                                               width: 24.0,
            //                                               height: 24.0,
            //                                               decoration: const BoxDecoration(color: Color(0x59A7C6ED), shape: BoxShape.circle),
            //                                               child: Align(
            //                                                 alignment: const AlignmentDirectional(0.0, -0.75),
            //                                                 child: Text(
            //                                                   '...',
            //                                                   style: FlutterFlowThemeNew.of(context).bodyMedium.override(
            //                                                     fontFamily: FlutterFlowThemeNew.of(context).bodyMediumFamily,
            //                                                     letterSpacing: 0.0,
            //                                                     lineHeight: 0.4,
            //                                                     useGoogleFonts: !FlutterFlowThemeNew.of(context).bodyMediumIsCustom,
            //                                                   ),
            //                                                 ),
            //                                               ),
            //                                             ),
            //                                           ),
            //                                         ],
            //                                       ),
            //                                   ],
            //                                 ),
            //                                 // แสดงรายการย่อย (เฉพาะเมื่อเป็น Profile group)
            //                                 if ((entry.value.first.lab_items_sub_group_name ?? '').isNotEmpty)
            //                                   ...entry.value.map((labItem) {
            //                                     return Padding(
            //                                       padding: const EdgeInsets.only(top: 4.0, left: 16.0),
            //                                       child: Row(
            //                                         mainAxisSize: MainAxisSize.max,
            //                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                                         children: [
            //                                           Expanded(
            //                                             child: Text(
            //                                               labItem.lab_items_name ?? '-',
            //                                               overflow: TextOverflow.ellipsis,
            //                                               style: FlutterFlowThemeNew.of(context).bodySmall.override(
            //                                                 fontFamily: FlutterFlowThemeNew.of(context).bodySmallFamily,
            //                                                 color: FlutterFlowThemeNew.of(context).secondaryText,
            //                                                 letterSpacing: 0.0,
            //                                                 useGoogleFonts: !FlutterFlowThemeNew.of(context).bodySmallIsCustom,
            //                                               ),
            //                                             ),
            //                                           ),
            //                                           Row(
            //                                             mainAxisSize: MainAxisSize.max,
            //                                             mainAxisAlignment: MainAxisAlignment.end,
            //                                             children: [
            //                                               ((labItem.lab_order_result ?? '').isEmpty)
            //                                                   ? _buildWatingResultMethod(context)
            //                                                   : _buildOrderResultMethod(
            //                                                     context: context,
            //                                                     orderResult: labItem.lab_order_result,
            //                                                     abnormalResult: labItem.abnormal_result,
            //                                                     color:
            //                                                         (labItem.abnormal_result == 'Y' ||
            //                                                                 controller.getAbnormalStatus(labItem) == 'ผิดปกติ')
            //                                                             ? FlutterFlowThemeNew.of(context).error
            //                                                             : FlutterFlowThemeNew.of(context).success,
            //                                                     colorsList:
            //                                                         (labItem.abnormal_result == 'Y' ||
            //                                                                 controller.getAbnormalStatus(labItem) == 'ผิดปกติ')
            //                                                             ? const [Color(0x19F47A86), Color(0x25BE1E2D)]
            //                                                             : const [Color(0x1A5FD187), Color(0x273AAA5F)],
            //                                                   ),

            //                                               /* Container(
            //                                                 /* width: () {
            //                                                               if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
            //                                                                 return 78.0;
            //                                                               } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
            //                                                                 return 78.0;
            //                                                               } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
            //                                                                 return 108.0;
            //                                                               } else {
            //                                                                 return 108.0;
            //                                                               }
            //                                                             }(), */
            //                                                 decoration: const BoxDecoration(),
            //                                                 child: Row(
            //                                                   mainAxisSize: MainAxisSize.max,
            //                                                   mainAxisAlignment: MainAxisAlignment.end,
            //                                                   children: [
            //                                                     InkWell(
            //                                                       onTap:
            //                                                           (labItem.lab_order_result == null || labItem.lab_order_result == '')
            //                                                               ? null
            //                                                               : () {
            //                                                                 showModalBottomSheet(
            //                                                                   isScrollControlled: true,
            //                                                                   backgroundColor: Colors.transparent,
            //                                                                   isDismissible: false,
            //                                                                   useSafeArea: true,
            //                                                                   context: context,
            //                                                                   builder: (context) {
            //                                                                     return GestureDetector(
            //                                                                       onTap: () {
            //                                                                         FocusScope.of(context).unfocus();
            //                                                                         FocusManager.instance.primaryFocus?.unfocus();
            //                                                                       },
            //                                                                       child: Padding(
            //                                                                         padding: MediaQuery.viewInsetsOf(context),
            //                                                                         child: HistoryLabXrayWidget(itemCode: labItem.lab_items_code ?? 0, hn: controller.hn ?? ''),
            //                                                                       ),
            //                                                                     );
            //                                                                   },
            //                                                                 );
            //                                                               },
            //                                                       child: Opacity(
            //                                                         opacity: 0.5,
            //                                                         child: Container(
            //                                                           width: 40,
            //                                                           height: 40,
            //                                                           decoration: BoxDecoration(color: FlutterFlowThemeNew.of(context).primaryBackground, shape: BoxShape.circle),
            //                                                           child: Align(
            //                                                             alignment: const AlignmentDirectional(0.0, 0.0),
            //                                                             child: Icon(
            //                                                               (labItem.lab_order_result == null || labItem.lab_order_result == '')
            //                                                                   ? Icons.visibility_off
            //                                                                   : Icons.remove_red_eye_sharp,
            //                                                               color:
            //                                                                   (labItem.lab_order_result == null || labItem.lab_order_result == '')
            //                                                                       ? FlutterFlowThemeNew.of(context).secondaryText
            //                                                                       : FlutterFlowThemeNew.of(context).customColor1,
            //                                                               size: 20.0,
            //                                                             ),
            //                                                           ),
            //                                                         ),
            //                                                       ),
            //                                                     ),
            //                                                     InkWell(
            //                                                       onTap:
            //                                                           (labItem.image_count != null && labItem.image_count! > 0)
            //                                                               ? () {
            //                                                                 log('dex>> pic labItem.lab_items_code ${labItem.lab_items_code}');
            //                                                                 showModalBottomSheet(
            //                                                                   isScrollControlled: true,
            //                                                                   backgroundColor: Colors.transparent,
            //                                                                   isDismissible: false,
            //                                                                   useSafeArea: true,
            //                                                                   context: context,
            //                                                                   builder: (context) {
            //                                                                     return Padding(
            //                                                                       padding: MediaQuery.viewInsetsOf(context),
            //                                                                       child: LabmageWidget(labOrderNumber: entry.value.first.lab_order_number ?? 0),
            //                                                                     );
            //                                                                   },
            //                                                                 );
            //                                                               }
            //                                                               : null,
            //                                                       child: Opacity(
            //                                                         opacity: 0.5,
            //                                                         child: Container(
            //                                                           width: 40,
            //                                                           height: 40,
            //                                                           decoration: BoxDecoration(color: FlutterFlowThemeNew.of(context).primaryBackground, shape: BoxShape.circle),
            //                                                           child: Align(
            //                                                             alignment: const AlignmentDirectional(0.0, 0.0),
            //                                                             child: Icon(
            //                                                               (labItem.image_count != null && labItem.image_count! > 0) ? Icons.image : Icons.image_not_supported,
            //                                                               color:
            //                                                                   (labItem.image_count != null && labItem.image_count! > 0)
            //                                                                       ? FlutterFlowThemeNew.of(context).customColor1
            //                                                                       : FlutterFlowThemeNew.of(context).secondaryText,
            //                                                               size: 20.0,
            //                                                             ),
            //                                                           ),
            //                                                         ),
            //                                                       ),
            //                                                     ),
            //                                                   ].divide(const SizedBox(width: 12.0)),
            //                                                 ),
            //                                               ), */
            //                                               const SizedBox(width: 12.0),
            //                                               InkWell(
            //                                                 splashColor: Colors.transparent,
            //                                                 focusColor: Colors.transparent,
            //                                                 hoverColor: Colors.transparent,
            //                                                 highlightColor: Colors.transparent,
            //                                                 onTap: () async {
            //                                                   await showModalBottomSheet(
            //                                                     isScrollControlled: true,
            //                                                     backgroundColor: Colors.transparent,
            //                                                     enableDrag: false,
            //                                                     context: context,
            //                                                     builder: (context) {
            //                                                       return Padding(
            //                                                         padding: MediaQuery.viewInsetsOf(context),
            //                                                         child: BottomsheetLabViewMoreWidget(
            //                                                           labItem: labItem,
            //                                                           controller: controller,
            //                                                         ),
            //                                                       );
            //                                                     },
            //                                                   );
            //                                                 },
            //                                                 child: Container(
            //                                                   width: 24.0,
            //                                                   height: 24.0,
            //                                                   decoration: const BoxDecoration(color: Color(0x59A7C6ED), shape: BoxShape.circle),
            //                                                   child: Align(
            //                                                     alignment: const AlignmentDirectional(0.0, -0.75),
            //                                                     child: Text(
            //                                                       '...',
            //                                                       style: FlutterFlowThemeNew.of(context).bodyMedium.override(
            //                                                         fontFamily: FlutterFlowThemeNew.of(context).bodyMediumFamily,
            //                                                         letterSpacing: 0.0,
            //                                                         lineHeight: 0.4,
            //                                                         useGoogleFonts: !FlutterFlowThemeNew.of(context).bodyMediumIsCustom,
            //                                                       ),
            //                                                     ),
            //                                                   ),
            //                                                 ),
            //                                               ),
            //                                             ],
            //                                           ),
            //                                         ],
            //                                       ),
            //                                     );
            //                                   }),
            //                               ],
            //                             ),
            //                           );
            //                         }),
            //                         if (controller.resultText.isNotEmpty)
            //                           _buildResultTextMethod(context, RtfThaiConverter.rtfToPlainText(controller.resultText)),
            //                       ],
            //                     ),
            //                   ),
            //                 ],
            //               ],
            //             ),
            //           ),
            //         );
            //       },
            //     ),
          ].divide(const SizedBox(height: 8.0)),
        ),
      ),
    );
  }
}

class CameraGridView extends GetView<HomePageController> {
  const CameraGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final estimatedTileWidth = (screenWidth - 52) / 2;
    final cardMinHeight = (estimatedTileWidth * 9 / 16) + 84;
    final cardAspectRatio = (estimatedTileWidth / cardMinHeight).clamp(0.72, 0.95);

    final cameras = List.generate(6, (i) {
      return {'name': 'Camera ${i + 1}', 'online': i % 4 != 0};
    });

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true, // ✅ สำคัญ
        physics: const NeverScrollableScrollPhysics(), // ✅ สำคัญ (ให้ ListView scroll ตัวเดียว)
        padding: const EdgeInsets.all(12),
        itemCount: cameras.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12),
        itemBuilder: (context, index) {
          final cam = cameras[index];
          final online = cam['online'] as bool;

          return Obx(() {
            final previewBytes = controller.cameraPreviewByIndex[index];
            return InkWell(
              onTap: () => controller.openCamera(index),
              borderRadius: BorderRadius.circular(14),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.grey.shade300),
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 4))],
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: previewBytes != null
                            ? Image.memory(previewBytes, fit: BoxFit.cover, gaplessPlayback: true)
                            : Container(
                                color: const Color(0xFFF2F6FA),
                                alignment: Alignment.center,
                                child: Icon(Icons.videocam_rounded, size: 28, color: online ? Colors.green : Colors.red),
                              ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      cam['name'] as String,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
                    ),
                    const SizedBox(height: 2),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(999),
                        color: (online ? Colors.green : Colors.red).withValues(alpha: 0.12),
                      ),
                      child: Text(
                        online ? 'ONLINE' : 'OFFLINE',
                        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: online ? Colors.green : Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
