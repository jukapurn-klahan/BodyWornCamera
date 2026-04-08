import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../flutter_flow/flutter_flow_button_tabbar.dart';
import '../../../../flutter_flow/flutter_flow_icon_button.dart';
import '../../../../flutter_flow/flutter_flow_theme_new.dart';
import '../controllers/noti_list_controller.dart';

class NotiListView extends GetView<NotiListController> {
  const NotiListView({super.key});

  static const List<_NotificationItem> _allNotifications = [
    _NotificationItem(
      dateLabel: '15 มกราคม 2568',
      category: _NotificationCategory.task,
      title: 'ตรวจพื้นที่เสี่ยงภัย บริเวณตลาดสด',
      subtitle: 'เขตเทศบาล 2',
      time: '14:30 น.',
      unread: false,
      badgeColor: Color(0xFFFF8A00),
      badgeIcon: Icons.assignment_rounded,
      taskCode: 'SC-001',
      taskLocation: 'ตลาดสดเทศบาลเมือง',
      taskDescription: 'ลงพื้นที่ตรวจสอบความปลอดภัย หลังได้รับรายงานน้ำท่วมขังและไฟฟ้าขัดข้องบางจุด',
      taskPriorityLabel: 'สำคัญมาก',
      taskPriorityBackgroundColor: Color(0xFFFFE6E6),
      taskPriorityForegroundColor: Color(0xFFD92D20),
    ),
    _NotificationItem(
      dateLabel: '15 มกราคม 2568',
      category: _NotificationCategory.detectCamera,
      title: 'ตรวจพบบุคคลในพื้นที่เฝ้าระวังช่วงกลางคืน',
      subtitle: 'กล้อง Parking 02 • บันทึกภาพ 3 เฟรม',
      time: '00:48 น.',
      unread: false,
      avatarAssetPath: 'assets/images/camera2.png',
      badgeColor: Color(0xFF329BFF),
      badgeIcon: Icons.videocam_rounded,
    ),
    _NotificationItem(
      dateLabel: '15 มกราคม 2568',
      category: _NotificationCategory.task,
      title: 'ตรวจเยี่ยมกลุ่มเปราะบางในชุมชน',
      subtitle: 'เขตเทศบาล 2',
      time: '15:10 น.',
      unread: false,
      badgeColor: Color(0xFFFF8A00),
      badgeIcon: Icons.task_alt_rounded,
      taskCode: 'SC-002',
      taskLocation: 'ชุมชนเทศบาล 2',
      taskDescription: 'ประเมินสภาพความเป็นอยู่และติดตามการช่วยเหลือผู้สูงอายุและผู้ป่วยติดบ้านในพื้นที่',
      taskPriorityLabel: 'เร่งด่วน',
      taskPriorityBackgroundColor: Color(0xFFFFF3D8),
      taskPriorityForegroundColor: Color(0xFFB56A00),
    ),
    _NotificationItem(
      dateLabel: '09 กุมภาพันธ์ 2569',
      category: _NotificationCategory.detectCamera,
      title: 'พบการเคลื่อนไหวผิดปกติบริเวณทางเข้าอาคาร A',
      subtitle: 'กล้อง Entrance A • ความมั่นใจ 92%',
      time: '13:02 น.',
      unread: true,
      avatarAssetPath: 'assets/images/camera1.png',
      badgeColor: Color(0xFF329BFF),
      badgeIcon: Icons.videocam_rounded,
    ),
    _NotificationItem(
      dateLabel: '10 กุมภาพันธ์ 2569',
      category: _NotificationCategory.detectCamera,
      title: 'ตรวจพบบุคคลในพื้นที่เฝ้าระวังช่วงกลางคืน',
      subtitle: 'กล้อง Parking 02 • บันทึกภาพ 3 เฟรม',
      time: '00:48 น.',
      unread: true,
      avatarAssetPath: 'assets/images/camera2.png',
      badgeColor: Color(0xFF329BFF),
      badgeIcon: Icons.videocam_rounded,
    ),
  ];

  List<_NotificationSectionData> _sectionsForTab(int tabIndex) {
    final items = switch (tabIndex) {
      1 => _allNotifications.where((item) => item.category == _NotificationCategory.task).toList(),
      2 => _allNotifications.where((item) => item.category == _NotificationCategory.detectCamera).toList(),
      _ => _allNotifications,
    };

    final sections = <String, List<_NotificationItem>>{};
    for (final item in items) {
      sections.putIfAbsent(item.dateLabel, () => <_NotificationItem>[]).add(item);
    }

    return sections.entries.map((entry) => _NotificationSectionData(dateLabel: entry.key, items: entry.value)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowThemeNew.of(context);
    final tabController = controller.tabBarController;

    if (tabController == null) {
      return const SizedBox.shrink();
    }

    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: theme.primary,
      appBar: AppBar(
        backgroundColor: theme.primary,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 54.0,
          icon: const Icon(Icons.keyboard_arrow_left_rounded, color: Colors.white, size: 28.0),
          onPressed: () async {
            Get.back();
          },
        ),
        title: Text(
          'แจ้งเตือน',
          textAlign: TextAlign.center,
          style: theme.headlineSmall.override(
            fontFamily: theme.headlineSmallFamily,
            color: theme.secondaryBackground,
            fontSize: 22.0,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.0,
            useGoogleFonts: !theme.headlineSmallIsCustom,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 12.0, 8.0),
            child: Image.asset('assets/images/noti.png', width: 48.0, height: 48.0, fit: BoxFit.contain),
          ),
        ],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: theme.primaryBackground,
          boxShadow: const [BoxShadow(blurRadius: 12.0, color: Color(0x1A000000), offset: Offset(0.0, -2.0))],
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        ),
        child: SafeArea(
          top: false,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 560.0),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(color: theme.secondaryBackground, borderRadius: BorderRadius.circular(26.0)),
                      child: Column(
                        children: [
                          _NotificationTabs(controller: tabController),
                          Expanded(
                            child: TabBarView(
                              controller: tabController,
                              children: List.generate(
                                NotiListController.tabLabels.length,
                                (index) => _NotificationTabContent(sections: _sectionsForTab(index)),
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
        ),
      ),
    );
  }
}

class _NotificationTabs extends StatelessWidget {
  const _NotificationTabs({required this.controller});

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return Align(
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
        tabs: NotiListController.tabLabels.map((label) => Tab(text: label)).toList(growable: false),
        controller: controller,
      ),
    );
  }
}

class _NotificationTabContent extends StatelessWidget {
  const _NotificationTabContent({required this.sections});

  final List<_NotificationSectionData> sections;

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowThemeNew.of(context);

    if (sections.isEmpty) {
      return Center(
        child: Text(
          'ไม่มีรายการแจ้งเตือน',
          style: theme.bodyMedium.override(
            fontFamily: theme.bodyMediumFamily,
            color: theme.secondaryText,
            letterSpacing: 0.0,
            useGoogleFonts: !theme.bodyMediumIsCustom,
          ),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 28.0),
      physics: const BouncingScrollPhysics(),
      itemCount: sections.length,
      separatorBuilder: (_, __) => const SizedBox(height: 18.0),
      itemBuilder: (context, index) {
        final section = sections[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              section.dateLabel,
              style: theme.headlineSmall.override(
                fontFamily: theme.headlineSmallFamily,
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.0,
                useGoogleFonts: !theme.headlineSmallIsCustom,
              ),
            ),
            const SizedBox(height: 12.0),
            _NotificationCard(items: section.items),
          ],
        );
      },
    );
  }
}

class _NotificationCard extends StatelessWidget {
  const _NotificationCard({required this.items});

  final List<_NotificationItem> items;

  @override
  Widget build(BuildContext context) {
    final blocks = <Widget>[];
    final bufferedItems = <_NotificationItem>[];

    void flushBufferedItems() {
      if (bufferedItems.isEmpty) {
        return;
      }

      blocks.add(_GroupedNotificationCard(items: List<_NotificationItem>.of(bufferedItems)));
      bufferedItems.clear();
    }

    for (final item in items) {
      if (item.category == _NotificationCategory.task) {
        flushBufferedItems();
        blocks.add(_TaskNotificationCard(item: item));
      } else {
        bufferedItems.add(item);
      }
    }

    flushBufferedItems();

    if (blocks.length == 1) {
      return blocks.first;
    }

    return Column(
      children: List.generate(blocks.length, (index) {
        final isLast = index == blocks.length - 1;
        return Padding(
          padding: EdgeInsets.only(bottom: isLast ? 0.0 : 16.0),
          child: blocks[index],
        );
      }),
    );
  }
}

class _GroupedNotificationCard extends StatelessWidget {
  const _GroupedNotificationCard({required this.items});

  final List<_NotificationItem> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28.0),
        boxShadow: const [BoxShadow(blurRadius: 18.0, color: Color(0x14000000), offset: Offset(0.0, 6.0))],
      ),
      child: Column(
        children: List.generate(items.length, (index) {
          final isLast = index == items.length - 1;
          return Column(
            children: [
              _NotificationRow(item: items[index]),
              if (!isLast)
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 22.0, 0.0),
                  child: Divider(height: 1.0, thickness: 1.0, color: Color(0xFFE4EBF4)),
                ),
            ],
          );
        }),
      ),
    );
  }
}

class _NotificationRow extends StatelessWidget {
  const _NotificationRow({required this.item});

  final _NotificationItem item;

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowThemeNew.of(context);
    final isDetectCamera = item.category == _NotificationCategory.detectCamera;

    return Padding(
      padding: const EdgeInsets.fromLTRB(22.0, 18.0, 22.0, 18.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _NotificationThumbnail(item: item),
          const SizedBox(width: 14.0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: _NotificationCategoryChip(category: item.category),
                        ),
                      ),
                      const SizedBox(width: 12.0),
                      _NotificationStatusMeta(item: item),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    item.title,
                    maxLines: isDetectCamera ? 3 : 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.titleLarge.override(
                      fontFamily: theme.titleLargeFamily,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.0,
                      useGoogleFonts: !theme.titleLargeIsCustom,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    item.subtitle,
                    maxLines: isDetectCamera ? 2 : 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.bodyMedium.override(
                      fontFamily: theme.bodyMediumFamily,
                      color: theme.secondaryText,
                      letterSpacing: 0.0,
                      useGoogleFonts: !theme.bodyMediumIsCustom,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TaskNotificationCard extends StatelessWidget {
  const _TaskNotificationCard({required this.item});

  final _NotificationItem item;

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowThemeNew.of(context);
    final stripBaseColor = item.taskPriorityBackgroundColor ?? const Color(0xFFFDE9E9);
    final priorityColor = item.taskPriorityForegroundColor ?? const Color(0xFFD92D20);
    final location = item.taskLocation ?? item.subtitle;
    final description = item.taskDescription;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28.0),
        boxShadow: const [BoxShadow(blurRadius: 18.0, color: Color(0x14000000), offset: Offset(0.0, 6.0))],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18.0, 16.0, 16.0, 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: _TaskCodePill(code: item.taskCode ?? '-'),
                  ),
                ),
                if (item.taskPriorityLabel != null) ...[
                  const SizedBox(width: 12.0),
                  _TaskPriorityPill(label: item.taskPriorityLabel!, color: priorityColor),
                ],
              ],
            ),
            const SizedBox(height: 18.0),
            Text(
              item.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.titleLarge.override(
                fontFamily: theme.titleLargeFamily,
                color: const Color(0xFF101828),
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.0,
                useGoogleFonts: !theme.titleLargeIsCustom,
              ),
            ),
            const SizedBox(height: 14.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          _TaskMetaInfo(icon: Icons.access_time_rounded, iconColor: const Color(0xFF1F76D2), text: item.time),
                          if (location.isNotEmpty) ...[
                            const SizedBox(width: 14.0),
                            Container(width: 1.0, height: 20.0, color: const Color(0xFFD5D9E4)),
                            const SizedBox(width: 14.0),
                            Expanded(
                              child: _TaskMetaInfo(
                                icon: Icons.location_on_rounded,
                                iconColor: const Color(0xFFF25555),
                                text: location,
                                expandText: true,
                              ),
                            ),
                          ],
                        ],
                      ),

                      // if (description != null && description.isNotEmpty) ...[
                      //   const SizedBox(height: 14.0),
                      //   Text(
                      //     description,
                      //     maxLines: 2,
                      //     overflow: TextOverflow.ellipsis,
                      //     style: theme.bodyLarge.override(
                      //       fontFamily: theme.bodyLargeFamily,
                      //       color: const Color(0xFF6B7280),
                      //       fontSize: 15.0,
                      //       fontWeight: FontWeight.w500,
                      //       letterSpacing: 0.0,
                      //       useGoogleFonts: !theme.bodyLargeIsCustom,
                      //     ),
                      //   ),
                      // ],
                    ],
                  ),
                ),
                // const SizedBox(width: 10.0),
                // const Padding(
                //   padding: EdgeInsets.only(top: 6.0),
                //   child: Icon(Icons.chevron_right_rounded, color: Color(0xFF2A6FD6), size: 38.0),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _NotificationStatusMeta extends StatelessWidget {
  const _NotificationStatusMeta({required this.item});

  final _NotificationItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (item.unread) ...[const _UnreadDot(), const SizedBox(width: 6.0)],
        _NotificationTimeLabel(time: item.time),
      ],
    );
  }
}

class _NotificationTimeLabel extends StatelessWidget {
  const _NotificationTimeLabel({required this.time});

  final String time;

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowThemeNew.of(context);

    return Text(
      time,
      style: theme.bodyMedium.override(
        fontFamily: theme.bodyMediumFamily,
        color: theme.secondaryText,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.0,
        useGoogleFonts: !theme.bodyMediumIsCustom,
      ),
    );
  }
}

class _UnreadDot extends StatelessWidget {
  const _UnreadDot();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 9.0,
      height: 9.0,
      decoration: const BoxDecoration(color: Color(0xFF2A6FD6), shape: BoxShape.circle),
    );
  }
}

class _TaskCodePill extends StatelessWidget {
  const _TaskCodePill({required this.code});

  final String code;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFFF4FAFF), Color(0xFFDCEBFF)], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(999.0),
        border: Border.all(color: const Color(0xFFB9D6FF)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.sell_outlined, size: 18.0, color: Color(0xFF1D5EC8)),
          const SizedBox(width: 8.0),
          Text(
            code,
            style: const TextStyle(color: Color(0xFF184FA9), fontSize: 16.0, fontWeight: FontWeight.w800, letterSpacing: 0.3),
          ),
        ],
      ),
    );
  }
}

class _TaskPriorityPill extends StatelessWidget {
  const _TaskPriorityPill({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14.0, 9.0, 16.0, 9.0),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(999.0)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.warning_amber_rounded, color: Colors.white, size: 20.0),
          const SizedBox(width: 6.0),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

class _TaskMetaInfo extends StatelessWidget {
  const _TaskMetaInfo({required this.icon, required this.iconColor, required this.text, this.expandText = false});

  final IconData icon;
  final Color iconColor;
  final String text;
  final bool expandText;

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowThemeNew.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: iconColor, size: 22.0),
        const SizedBox(width: 8.0),
        if (expandText)
          Expanded(
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.bodyLarge.override(
                fontFamily: theme.bodyLargeFamily,
                color: const Color(0xFF4B5563),
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.0,
                useGoogleFonts: !theme.bodyLargeIsCustom,
              ),
            ),
          )
        else
          Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.bodyLarge.override(
              fontFamily: theme.bodyLargeFamily,
              color: const Color(0xFF4B5563),
              fontSize: 15.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.0,
              useGoogleFonts: !theme.bodyLargeIsCustom,
            ),
          ),
      ],
    );
  }
}

class _NotificationCategoryChip extends StatelessWidget {
  const _NotificationCategoryChip({required this.category});

  final _NotificationCategory category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      decoration: BoxDecoration(color: category.chipBackgroundColor, borderRadius: BorderRadius.circular(999.0)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(category.chipIcon, size: 14.0, color: category.chipForegroundColor),
          const SizedBox(width: 6.0),
          Text(
            category.label,
            style: TextStyle(color: category.chipForegroundColor, fontSize: 12.0, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

class _NotificationThumbnail extends StatelessWidget {
  const _NotificationThumbnail({required this.item});

  final _NotificationItem item;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18.0),
      child: SizedBox(
        width: 96.0,
        height: 88.0,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(item.avatarAssetPath!, fit: BoxFit.cover),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Color(0x08000000), Color(0x7A000000)], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
            ),
            Positioned(
              left: 8.0,
              top: 8.0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                decoration: BoxDecoration(color: const Color(0xCC0E2035), borderRadius: BorderRadius.circular(999.0)),
                child: const Text(
                  'CAM',
                  style: TextStyle(color: Colors.white, fontSize: 11.0, fontWeight: FontWeight.w700, letterSpacing: 0.3),
                ),
              ),
            ),
            Positioned(
              right: 8.0,
              bottom: 8.0,
              child: Container(
                width: 26.0,
                height: 26.0,
                decoration: BoxDecoration(
                  color: item.badgeColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2.0),
                ),
                child: Icon(item.badgeIcon, color: Colors.white, size: 14.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum _NotificationCategory { task, detectCamera }

extension _NotificationCategoryTheme on _NotificationCategory {
  String get label => switch (this) {
    _NotificationCategory.task => 'กิจกรรม/ภารกิจ',
    _NotificationCategory.detectCamera => 'Detect Camera',
  };

  IconData get chipIcon => switch (this) {
    _NotificationCategory.task => Icons.assignment_rounded,
    _NotificationCategory.detectCamera => Icons.videocam_rounded,
  };

  Color get chipBackgroundColor => switch (this) {
    _NotificationCategory.task => const Color(0xFFFFF0DF),
    _NotificationCategory.detectCamera => const Color(0xFFE8F4FF),
  };

  Color get chipForegroundColor => switch (this) {
    _NotificationCategory.task => const Color(0xFFD97706),
    _NotificationCategory.detectCamera => const Color(0xFF1265C5),
  };
}

class _NotificationItem {
  const _NotificationItem({
    required this.dateLabel,
    required this.category,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.unread,
    required this.badgeColor,
    required this.badgeIcon,
    this.avatarAssetPath,
    this.taskCode,
    this.taskLocation,
    this.taskDescription,
    this.taskPriorityLabel,
    this.taskPriorityBackgroundColor,
    this.taskPriorityForegroundColor,
  });

  final String dateLabel;
  final _NotificationCategory category;
  final String title;
  final String subtitle;
  final String time;
  final bool unread;
  final Color badgeColor;
  final IconData badgeIcon;
  final String? avatarAssetPath;
  final String? taskCode;
  final String? taskLocation;
  final String? taskDescription;
  final String? taskPriorityLabel;
  final Color? taskPriorityBackgroundColor;
  final Color? taskPriorityForegroundColor;
}

class _NotificationSectionData {
  const _NotificationSectionData({required this.dateLabel, required this.items});

  final String dateLabel;
  final List<_NotificationItem> items;
}
