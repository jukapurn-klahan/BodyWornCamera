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

enum CameraFilterType { all, online, offline }

class HomePageView extends GetView<HomePageController> {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowThemeNew.of(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: controller.scaffoldKey,
        backgroundColor: theme.primary,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, _) => [
            SliverAppBar(
              pinned: false,
              floating: true,
              snap: true,
              automaticallyImplyLeading: false,
              backgroundColor: theme.primary,
              elevation: 0,
              toolbarHeight: 92,
              titleSpacing: 16,
              title: Row(
                children: [
                  Container(
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: theme.secondaryBackground, width: 2),
                    ),
                    child: ClipOval(
                      child: Image.asset('assets/images/profile.png', fit: BoxFit.cover, alignment: Alignment.topCenter),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ตำแหน่ง : เจ้าหน้าที่ตรวจการณ์ภาคสนาม',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.bodySmall.override(
                            fontFamily: theme.bodySmallFamily,
                            color: theme.secondaryBackground.withValues(alpha: 0.85),
                            letterSpacing: 0,
                            fontWeight: FontWeight.w400,
                            useGoogleFonts: !theme.bodySmallIsCustom,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'คุณ ทดสอบระบบ Camera',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.bodyLarge.override(
                            fontFamily: theme.bodyLargeFamily,
                            color: theme.secondaryBackground,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: !theme.bodyLargeIsCustom,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: badges.Badge(
                    badgeContent: Text(
                      '2',
                      style: GoogleFonts.sarabun(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 11),
                    ),
                    showBadge: true,
                    shape: badges.BadgeShape.circle,
                    badgeColor: theme.error,
                    elevation: 0,
                    padding: const EdgeInsets.all(6),
                    position: badges.BadgePosition.topEnd(top: -2, end: -2),
                    animationType: badges.BadgeAnimationType.scale,
                    toAnimate: true,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(999),
                      onTap: () => Get.toNamed(Routes.NOTI_LIST),
                      child: Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.18), shape: BoxShape.circle),
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.notifications_none_rounded, color: theme.secondaryBackground, size: 24),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [const Color(0xFF3FA3F5), const Color(0xFFEAF4FF), theme.primaryBackground],
                stops: const [0.0, 0.18, 1.0],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: ListView(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 124),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'รายการกล้อง',
                    style: theme.titleMedium.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26),
                  ),
                ),
                const SizedBox(height: 12),

          
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 12, offset: const Offset(0, 4))],
                    ),
                    child: TextField(
                      onChanged: controller.onSearchChanged,
                      decoration: InputDecoration(
                        hintText: 'ค้นหากล้อง / จุดติดตั้ง',
                        hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
                        prefixIcon: Icon(Icons.search_rounded, color: Colors.grey.shade500),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                /// filters
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Obx(() {
                    return Row(
                      children: [
                        _FilterChipButton(
                          label: 'ทั้งหมด',
                          selected: controller.selectedFilter.value == CameraFilterType.all,
                          onTap: () => controller.changeFilter(CameraFilterType.all),
                        ),
                        const SizedBox(width: 8),
                        _FilterChipButton(
                          label: 'ออนไลน์',
                          selected: controller.selectedFilter.value == CameraFilterType.online,
                          onTap: () => controller.changeFilter(CameraFilterType.online),
                          selectedColor: Colors.green,
                        ),
                        const SizedBox(width: 8),
                        _FilterChipButton(
                          label: 'ออฟไลน์',
                          selected: controller.selectedFilter.value == CameraFilterType.offline,
                          onTap: () => controller.changeFilter(CameraFilterType.offline),
                          selectedColor: Colors.red,
                        ),
                      ],
                    );
                  }),
                ),

                const SizedBox(height: 10),
                const CameraGridView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CameraGridView extends GetView<HomePageController> {
  const CameraGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final streetImages = ['assets/images/camera1.png', 'assets/images/camera2.png', 'assets/images/camera3.png', 'assets/images/camera4.png'];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(() {
        final cameras = controller.filteredCameras;

        if (cameras.isEmpty) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 40),
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(color: const Color(0xFFF3F6FA), shape: BoxShape.circle),
                  child: Icon(Icons.videocam_off_rounded, size: 36, color: Colors.grey.shade400),
                ),
                const SizedBox(height: 12),
                Text(
                  'ไม่พบรายการกล้อง',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.grey.shade700),
                ),
                const SizedBox(height: 4),
                Text('ลองค้นหาด้วยชื่อกล้องหรือจุดติดตั้ง', style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
              ],
            ),
          );
        }

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          itemCount: cameras.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 14,
            crossAxisSpacing: 14,
            childAspectRatio: 0.82,
          ),
          itemBuilder: (context, index) {
            final cam = cameras[index];
            final streetImage = streetImages[index % streetImages.length];
            return Obx(() {
              final previewBytes = controller.cameraPreviewByIndex[cam.index];

              return InkWell(
                onTap: () => Get.toNamed(Routes.CAMERA, parameters: {'index': cam.index.toString()}),
                splashColor: const Color(0xFF1E88E5).withValues(alpha: 0.08),
                highlightColor: Colors.transparent,
                borderRadius: BorderRadius.circular(24),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFFFFFF), Color(0xFFF8FBFF)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    border: Border.all(color: Colors.white.withValues(alpha: 0.8)),
                    boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 18, offset: const Offset(0, 8))],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                /// ✅ Online → แสดงภาพถนน
                                /// ❌ Offline → แสดง placeholder เดิม
                                cam.isOnline
                                    ? (previewBytes != null
                                          ? Image.memory(previewBytes, fit: BoxFit.cover, gaplessPlayback: true)
                                          : Image.asset(streetImage, fit: BoxFit.cover))
                                    : Container(
                                        color: const Color(0xFFF2F5F9),
                                        child: Center(
                                          child: Container(
                                            width: 74,
                                            height: 74,
                                            decoration: BoxDecoration(color: Colors.red.withValues(alpha: 0.10), shape: BoxShape.circle),
                                            child: const Icon(Icons.videocam_off_rounded, size: 34, color: Color(0xFFF44336)),
                                          ),
                                        ),
                                      ),

                                /// overlay
                                if (cam.isOnline)
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [Colors.transparent, Colors.black.withValues(alpha: 0.18)],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                    ),
                                  ),

                                /// dot status
                                Positioned(top: 10, right: 10, child: _ModernPreviewStatusDot(online: cam.isOnline)),

                                /// LIVE badge (เฉพาะ online)
                                // if (cam.isOnline)
                                //   Positioned(
                                //     bottom: 10,
                                //     left: 10,
                                //     child: Container(
                                //       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                //       decoration: BoxDecoration(color: Colors.black.withValues(alpha: 0.6), borderRadius: BorderRadius.circular(10)),
                                //       child: const Row(
                                //         mainAxisSize: MainAxisSize.min,
                                //         children: [
                                //           Icon(Icons.circle, size: 8, color: Colors.redAccent),
                                //           SizedBox(width: 6),
                                //           Text(
                                //             'LIVE',
                                //             style: TextStyle(color: Colors.white, fontSize: 10.5, fontWeight: FontWeight.w800),
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),

                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                cam.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16, color: Color(0xFF1E2329), height: 1.1),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(color: const Color(0xFFF4F7FB), shape: BoxShape.circle),
                              child: Icon(Icons.arrow_forward_ios_rounded, size: 13, color: Colors.grey.shade500),
                            ),
                          ],
                        ),

                        const SizedBox(height: 6),

                        Row(
                          children: [
                            Icon(Icons.location_on_outlined, size: 14, color: Colors.grey.shade500),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                cam.location,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey.shade600),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              );
            });
          },
        );
      }),
    );
  }
}

class _ModernPreviewStatusDot extends StatelessWidget {
  final bool online;

  const _ModernPreviewStatusDot({required this.online});

  @override
  Widget build(BuildContext context) {
    final color = online ? const Color(0xFF4CAF50) : const Color(0xFFF44336);

    return Container(
      width: 14,
      height: 14,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2.2),
        boxShadow: [BoxShadow(color: color.withValues(alpha: 0.45), blurRadius: 8, offset: const Offset(0, 2))],
      ),
    );
  }
}

class _PreviewStatusDot extends StatelessWidget {
  final bool online;

  const _PreviewStatusDot({required this.online});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: online ? Colors.green : Colors.red,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
      ),
    );
  }
}

class _SummaryBox extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final IconData icon;

  const _SummaryBox({required this.title, required this.value, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.90), borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(color: color.withValues(alpha: 0.12), shape: BoxShape.circle),
            child: Icon(icon, color: color, size: 18),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: color),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterChipButton extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  final Color? selectedColor;

  const _FilterChipButton({required this.label, required this.selected, required this.onTap, this.selectedColor});

  @override
  Widget build(BuildContext context) {
    final color = selectedColor ?? const Color(0xFF1E88E5);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? color : Colors.white,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: selected ? color : Colors.grey.shade300),
          boxShadow: selected ? [BoxShadow(color: color.withValues(alpha: 0.18), blurRadius: 10, offset: const Offset(0, 4))] : [],
        ),
        child: Text(
          label,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: selected ? Colors.white : Colors.grey.shade700),
        ),
      ),
    );
  }
}

class CameraItem {
  final int index;
  final String name;
  final String location;
  final bool isOnline;

  CameraItem({required this.index, required this.name, required this.location, required this.isOnline});
}

class _SummaryChip extends StatelessWidget {
  final String label;
  final Color color;
  final IconData icon;

  const _SummaryChip({required this.label, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(color: color.withOpacity(0.12), borderRadius: BorderRadius.circular(999)),
      child: Row(
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: color),
          ),
        ],
      ),
    );
  }
}
