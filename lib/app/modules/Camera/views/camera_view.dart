import 'dart:async';
import 'dart:math' as math;

import 'package:badges/badges.dart' as badges;
import 'package:body_camera/flutter_flow/flutter_flow_icon_button.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

import '../../../../flutter_flow/flutter_flow_theme_new.dart';
import '../../../../widgets/calendar_widget/b_t_date_widget.dart';
import '../controllers/camera_controller.dart';

class CameraView extends GetView<CameraController> {
  const CameraView({super.key});

  Future<void> _openFullscreen(BuildContext context) async {
    if (!controller.isPlayerReady.value) {
      return;
    }

    final navigator = Navigator.of(context);
    await controller.pausePreview();
    try {
      await navigator.push(MaterialPageRoute(builder: (_) => _CameraChewieFullScreen(streamUrl: controller.cameraStreamUrl)));
    } finally {
      await controller.resumePreview();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) {
          return;
        }
        await controller.closeWithPreview();
      },
      child: Scaffold(
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
              await controller.closeWithPreview();
            },
          ),
          title: Text(
            controller.cameraTitle,
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
            boxShadow: [BoxShadow(blurRadius: 4.0, color: Color(0x33000000), offset: Offset(0.0, 0.0))],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final previewHeight = math.min(constraints.maxWidth * 9 / 16, constraints.maxHeight * 0.35);
              return Column(
                children: [
                  SizedBox(
                    height: previewHeight,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
                      child: Obx(() {
                        final player = controller.chewieController;
                        final videoPlayerController = controller.videoPlayerController;
                        final isOffline = controller.isOffline.value;

                        if (isOffline) {
                          return Container(
                            color: Colors.black,
                            alignment: Alignment.center,
                            child: const Text(
                              'OFFLINE',
                              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: 1.0),
                            ),
                          );
                        }

                        if (!controller.isPlayerReady.value || player == null || videoPlayerController == null) {
                          return Container(
                            color: Colors.black,
                            alignment: Alignment.center,
                            child: const SizedBox(width: 28, height: 28, child: CircularProgressIndicator(strokeWidth: 2.8, color: Colors.white)),
                          );
                        }

                        return Stack(
                          fit: StackFit.expand,
                          children: [
                            Container(
                              key: controller.webViewCaptureKey,
                              color: Colors.black,
                              child: Chewie(controller: player),
                            ),
                            Positioned.fill(child: _VideoLoadingOverlay(controller: videoPlayerController)),
                            Positioned(
                              right: 10,
                              bottom: 10,
                              child: DecoratedBox(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                child: IconButton(
                                  tooltip: 'เต็มจอ',

                                  //   onPressed: () =>    AppDialogs.showLoading(),
                                  onPressed: () => _openFullscreen(context),
                                  icon: const Icon(Icons.fullscreen, color: Colors.white, size: 30),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                  const SizedBox(height: 12),

                  /// ===== ปุ่มใต้กล้อง =====
                  Container(
                    width: double.infinity, // 👈 ยืดเต็มซ้ายขวา
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      // ถ้าไม่อยากให้ชิดขอบมาก สามารถโค้งเล็กน้อยได้
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Obx(
                          () => _IconAction(
                            icon: controller.isCapturingSnapshot.value ? Icons.hourglass_top_rounded : Icons.camera_alt,
                            onTap: controller.isCapturingSnapshot.value ? null : () {},
                            //    onTap: controller.isCapturingSnapshot.value ? null : controller.captureSnapshot,
                            color: controller.isCapturingSnapshot.value ? Colors.grey : Colors.black87,
                          ),
                        ),
                        const _IconAction(icon: Icons.videocam),
                        const _IconAction(icon: Icons.volume_up),
                        // _IconAction(icon: Icons.call),
                      ],
                    ),
                  ),

                  /// ===== Control Panel =====
                  // Container(
                  //   margin: const EdgeInsets.all(12),
                  //   padding: const EdgeInsets.symmetric(vertical: 16),
                  //   decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                  //   child: Column(
                  //     children: [
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //         children: [
                  //           _ToggleButton(label: 'พูดคุย', icon: Icons.mic, onTap: controller.toggleMic, value: controller.isMicOn),
                  //           _ToggleButton(label: 'ปรับมุม', icon: Icons.control_camera, onTap: () {}, value: false.obs),
                  //           _ToggleButton(label: 'ปิดสัญญาณเตือน', icon: Icons.flash_on, onTap: controller.toggleAlarm, value: controller.isAlarmOn),
                  //         ],
                  //       ),
                  //       const SizedBox(height: 16),
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //         children: [
                  //           _ToggleButton(label: 'โหมดส่วนตัว', icon: Icons.visibility_off, onTap: controller.togglePrivacy, value: controller.isPrivacyMode),
                  //           _ToggleButton(label: 'แสง', icon: Icons.lightbulb, onTap: controller.toggleLight, value: controller.isLightOn),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  /// ===== Playback =====
                  Padding(
                    padding: const EdgeInsetsDirectional.all(16.0),
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
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: MediaQuery.of(context).viewInsets,
                                      child: const BTDateWidget(firstDate: false, maxPastMonths: 3),
                                    );
                                  },
                                );
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
                                          //       controller: controller.textControllerDate.value,
                                          autofocus: false,
                                          readOnly: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            hintStyle: FlutterFlowThemeNew.of(context).labelLarge.override(
                                              fontFamily: FlutterFlowThemeNew.of(context).labelLargeFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowThemeNew.of(context).labelLargeFamily),
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
                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowThemeNew.of(context).bodyMediumFamily),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                    child: Icon(Icons.calendar_month_rounded, color: FlutterFlowThemeNew.of(context).primary, size: 20.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

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
                      controller: controller.tabBarController,
                      onTap: (i) async {
                        [() async {}, () async {}][i]();
                      },
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: controller.tabBarController,
                      children: [
                        ListView.builder(
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
                                                        style: FlutterFlowThemeNew.of(
                                                          context,
                                                        ).bodyLarge.override(fontFamily: 'Sarabun', lineHeight: 2.0, fontWeight: FontWeight.w500),
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
                        ListView.builder(
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
                                                        'รายการวิดิโอ',
                                                        overflow: TextOverflow.ellipsis,
                                                        maxLines: 1,
                                                        style: FlutterFlowThemeNew.of(
                                                          context,
                                                        ).bodyLarge.override(fontFamily: 'Sarabun', lineHeight: 2.0, fontWeight: FontWeight.w500),
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
                      ],
                    ),
                  ),

                  // Expanded(
                  //   // ✅ สำคัญ
                  //   child: ListView.builder(
                  //     itemCount: 15,
                  //     itemBuilder: (context, index) {
                  //       return Padding(
                  //         padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                  //         child: badges.Badge(
                  //           showBadge: false,
                  //           shape: badges.BadgeShape.circle,
                  //           badgeColor: FlutterFlowThemeNew.of(context).primary,
                  //           elevation: 4.0,
                  //           padding: EdgeInsetsDirectional.fromSTEB(6.0, 6.0, 6.0, 6.0),
                  //           position: badges.BadgePosition.topEnd(end: -5, top: -3),
                  //           animationType: badges.BadgeAnimationType.scale,
                  //           toAnimate: true,
                  //           child: Container(
                  //             width: MediaQuery.of(context).size.width * 1.0,
                  //             decoration: BoxDecoration(
                  //               boxShadow: [BoxShadow(blurRadius: 3.0, color: Color(0x33000000), offset: Offset(0.0, 1.0))],
                  //               color: Colors.white,

                  //               borderRadius: BorderRadius.circular(10.0),
                  //             ),
                  //             child: Row(
                  //               mainAxisSize: MainAxisSize.max,
                  //               children: [
                  //                 Padding(
                  //                   padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                  //                   child: ClipRRect(
                  //                     borderRadius: BorderRadius.circular(8.0),
                  //                     child: Image.asset('assets/images/car.png', width: 50.0, height: 50.0, fit: BoxFit.cover),
                  //                   ),
                  //                 ),
                  //                 Expanded(
                  //                   child: Padding(
                  //                     padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 0.0, 16.0),
                  //                     child: Column(
                  //                       mainAxisSize: MainAxisSize.max,
                  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                       crossAxisAlignment: CrossAxisAlignment.start,
                  //                       children: [
                  //                         Row(
                  //                           mainAxisSize: MainAxisSize.max,
                  //                           mainAxisAlignment: MainAxisAlignment.start,
                  //                           children: [
                  //                             Expanded(
                  //                               child: Padding(
                  //                                 padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                  //                                 child: Text(
                  //                                   'รายการบันทึก',
                  //                                   overflow: TextOverflow.ellipsis,
                  //                                   maxLines: 1,
                  //                                   style: FlutterFlowThemeNew.of(
                  //                                     context,
                  //                                   ).bodyLarge.override(fontFamily: 'Sarabun', lineHeight: 2.0, fontWeight: FontWeight.w500),
                  //                                 ),
                  //                               ),
                  //                             ),
                  //                           ],
                  //                         ),
                  //                         Padding(
                  //                           padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                  //                           child: Text('3k', style: FlutterFlowThemeNew.of(context).bodySmall),
                  //                         ),
                  //                         Padding(
                  //                           padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                  //                           child: Row(
                  //                             mainAxisAlignment: MainAxisAlignment.end,
                  //                             children: [Text('08/01/2569 14:54', style: FlutterFlowThemeNew.of(context).bodySmall)],
                  //                           ),
                  //                         ),
                  //                       ],
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _IconAction extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final Color color;
  const _IconAction({required this.icon, this.onTap, this.color = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Icon(icon, size: 28, color: color),
      ),
    );
  }
}

class _CameraChewieFullScreen extends StatefulWidget {
  final String streamUrl;
  const _CameraChewieFullScreen({required this.streamUrl});

  @override
  State<_CameraChewieFullScreen> createState() => _CameraChewieFullScreenState();
}

class _CameraChewieFullScreenState extends State<_CameraChewieFullScreen> {
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;
  bool _isOffline = false;

  @override
  void initState() {
    super.initState();
    unawaited(_initializeFullscreenPlayer());
    unawaited(SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]));
    unawaited(SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky));
  }

  Future<void> _initializeFullscreenPlayer() async {
    VideoPlayerController? player;
    ChewieController? chewie;
    try {
      player = await CameraController.createStreamPlayer(widget.streamUrl);

      final aspectRatio = player.value.aspectRatio > 0 ? player.value.aspectRatio : 16 / 9;
      chewie = ChewieController(
        videoPlayerController: player,
        aspectRatio: aspectRatio,
        autoPlay: true,
        looping: false,
        showControls: true,
        allowFullScreen: false,
        allowMuting: false,
        allowPlaybackSpeedChanging: false,
        showOptions: false,
        isLive: true,
        materialProgressColors: ChewieProgressColors(
          playedColor: Colors.white,
          handleColor: Colors.white,
          bufferedColor: Colors.white38,
          backgroundColor: Colors.white24,
        ),
      );

      if (!mounted) {
        chewie.dispose();
        await player.dispose();
        return;
      }

      setState(() {
        _videoPlayerController = player;
        _chewieController = chewie;
        _isOffline = false;
      });
    } catch (_) {
      chewie?.dispose();
      if (player != null) {
        await player.dispose();
      }
      if (!mounted) {
        return;
      }
      setState(() {
        _isOffline = true;
      });
    }
  }

  @override
  void dispose() {
    _chewieController?.dispose();
    final player = _videoPlayerController;
    _videoPlayerController = null;
    if (player != null) {
      unawaited(player.dispose());
    }
    unawaited(SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
    unawaited(SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          if (_isOffline)
            const Positioned.fill(
              child: ColoredBox(
                color: Colors.black,
                child: Center(
                  child: Text(
                    'OFFLINE',
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: 1.0),
                  ),
                ),
              ),
            )
          else if (_chewieController == null || _videoPlayerController == null)
            const Positioned.fill(
              child: ColoredBox(
                color: Colors.black,
                child: Center(
                  child: SizedBox(width: 28, height: 28, child: CircularProgressIndicator(strokeWidth: 2.8, color: Colors.white)),
                ),
              ),
            )
          else ...[
            Positioned.fill(
              child: Center(
                child: AspectRatio(
                  aspectRatio: _videoPlayerController!.value.aspectRatio > 0 ? _videoPlayerController!.value.aspectRatio : 16 / 9,
                  child: Chewie(controller: _chewieController!),
                ),
              ),
            ),
            Positioned.fill(child: _VideoLoadingOverlay(controller: _videoPlayerController!)),
          ],
          Positioned(
            top: MediaQuery.paddingOf(context).top + 8,
            left: MediaQuery.paddingOf(context).left + 8,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(999)),
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                tooltip: 'ปิด',
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _VideoLoadingOverlay extends StatelessWidget {
  final VideoPlayerController controller;
  const _VideoLoadingOverlay({required this.controller});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<VideoPlayerValue>(
      valueListenable: controller,
      builder: (context, value, _) {
        final hasError = value.hasError;
        final isLoading = !hasError && (!value.isInitialized || value.isBuffering);

        if (!hasError && !isLoading) {
          return const SizedBox.shrink();
        }

        return IgnorePointer(
          child: ColoredBox(
            color: Colors.black38,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!hasError) const SizedBox(width: 26, height: 26, child: CircularProgressIndicator(strokeWidth: 2.8, color: Colors.white)),
                  if (!hasError) const SizedBox(height: 8),
                  if (hasError)
                    const Text(
                      'OFFLINE',
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: 1.0),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
