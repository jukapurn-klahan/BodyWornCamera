import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../flutter_flow/flutter_flow_theme_new.dart';
import '../../../../flutter_flow/flutter_flow_util.dart';
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
                            width: 300.0,
                            height: 300.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(shape: BoxShape.circle),
                            child: Icon(Icons.person_rounded, color: FlutterFlowThemeNew.of(context).secondaryBackground, size: 30.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Obx(
                    () => Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            controller.roleName.value.isEmpty ? 'ระดับ : -' : 'ระดับ : ${controller.roleName.value}',
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
                                  text: controller.usernameValue.value.isEmpty ? '-' : controller.usernameValue.value,
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
                        onTap: () async {},
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

  static final List<CameraItem> _skeletonCameras = List.generate(
    4,
    (index) => CameraItem(index: index, name: 'Camera Loading $index', location: 'กำลังโหลดตำแหน่ง', isOnline: true, deviceCode: 'skeleton-$index'),
  );

  @override
  Widget build(BuildContext context) {
    final streetImages = ['assets/images/camera1.png', 'assets/images/camera2.png', 'assets/images/camera3.png', 'assets/images/camera4.png'];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(() {
        final isLoading = controller.isLoadingCameras.value;
        final cameras = isLoading ? _skeletonCameras : controller.filteredCameras;

        if (!isLoading && cameras.isEmpty) {
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

        return Skeletonizer(
          enabled: isLoading,
          child: GridView.builder(
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
                  onTap: isLoading ? null : () => controller.openCamera(cam),
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
                                  if (isLoading)
                                    Container(color: const Color(0xFFF2F5F9))
                                  else if (cam.isOnline)
                                    previewBytes != null
                                        ? Image.memory(previewBytes, fit: BoxFit.cover, gaplessPlayback: true)
                                        : Image.asset(streetImage, fit: BoxFit.cover)
                                  else
                                    Container(
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
                                  if (!isLoading && cam.isOnline)
                                    Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [Colors.transparent, Colors.black.withValues(alpha: 0.18)],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                      ),
                                    ),
                                  if (!isLoading) Positioned(top: 10, right: 10, child: _ModernPreviewStatusDot(online: cam.isOnline)),
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
          ),
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
  final String deviceCode;

  CameraItem({required this.index, required this.name, required this.location, required this.isOnline, required this.deviceCode});
}
