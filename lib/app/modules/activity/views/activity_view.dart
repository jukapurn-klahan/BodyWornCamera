import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:body_camera/app/data/models/activity_report_model.dart';

import '../../../../flutter_flow/flutter_flow_theme_new.dart';
import '../../../../flutter_flow/flutter_flow_util.dart';
import '../../../../widgets/global_widget.dart';
import '../../../../widgets/calendar_widget/b_t_date_widget.dart';
import '../../../routes/app_pages.dart';
import '../controllers/activity_controller.dart';

class ActivityView extends GetView<ActivityController> {
  const ActivityView({super.key});

  List<_ActivityTaskItem> get _activityTasks => controller.reports.map(_mapReportToTaskItem).toList(growable: false);

  List<_ActivityTaskItem> _getFilteredTasks() {
    final query = controller.searchQuery.value.toLowerCase();
    final selectedPriority = controller.selectedPriority.value;
    final selectedDate = controller.selectedDate.value;

    return _activityTasks.where((item) {
      final searchableContent = [
        item.taskCode,
        item.title,
        item.date,
        item.time,
        item.location,
        item.description,
        item.badgeLabel,
      ].join(' ').toLowerCase();

      final matchesQuery = query.isEmpty || searchableContent.contains(query);
      final matchesPriority = selectedPriority == controller.allPriorityFilter || item.badgeLabel == selectedPriority;
      final matchesDate = selectedDate == null || _isSameDate(item.activityDate, selectedDate);

      return matchesQuery && matchesPriority && matchesDate;
    }).toList();
  }

  bool _isSameDate(DateTime left, DateTime right) {
    return left.year == right.year && left.month == right.month && left.day == right.day;
  }

  String _formatThaiShortDate(DateTime date) {
    const thaiMonths = ['ม.ค.', 'ก.พ.', 'มี.ค.', 'เม.ย.', 'พ.ค.', 'มิ.ย.', 'ก.ค.', 'ส.ค.', 'ก.ย.', 'ต.ค.', 'พ.ย.', 'ธ.ค.'];

    return '${date.day.toString().padLeft(2, '0')} ${thaiMonths[date.month - 1]} ${date.year + 543}';
  }

  String _formatTime(DateTime date) {
    final hour = date.hour.toString().padLeft(2, '0');
    final minute = date.minute.toString().padLeft(2, '0');
    return '$hour:$minute น.';
  }

  String _formatTimeRange(DateTime? startTime, DateTime? endTime, {required int durationInMinutes}) {
    if (startTime != null && endTime != null) {
      return '${_formatTime(startTime)} - ${_formatTime(endTime)}';
    }
    if (startTime != null) {
      return _formatTime(startTime);
    }
    if (endTime != null) {
      return _formatTime(endTime);
    }
    if (durationInMinutes > 0) {
      return '$durationInMinutes นาที';
    }
    return '-';
  }

  String _firstNonEmpty(Iterable<String?> values, {String fallback = '-'}) {
    for (final value in values) {
      final resolved = value?.trim() ?? '';
      if (resolved.isNotEmpty) {
        return resolved;
      }
    }
    return fallback;
  }

  _ActivityTaskStatusStyle _resolveTaskStatusStyle(ActivityReportModel report) {
    final priority = report.priority.trim().toLowerCase();
    final missionStatus = report.missionStatus.trim();

    if (priority == 'สำคัญมาก' || priority == 'high' || missionStatus == '4') {
      return const _ActivityTaskStatusStyle(
        label: 'สำคัญมาก',
        color: Color(0xFFEF4444),
        backgroundColor: Color(0xFFFEE2E2),
        icon: Icons.warning_amber_rounded,
      );
    }

    if (priority == 'เร่งด่วน' || priority == 'urgent' || missionStatus == '3') {
      return const _ActivityTaskStatusStyle(
        label: 'เร่งด่วน',
        color: Color(0xFFF59E0B),
        backgroundColor: Color(0xFFFFEDD5),
        icon: Icons.priority_high_rounded,
      );
    }

    if (priority == 'ต่ำ' || priority == 'low' || missionStatus == '1') {
      return const _ActivityTaskStatusStyle(
        label: 'ต่ำ',
        color: Color(0xFF6B7280),
        backgroundColor: Color(0xFFE5E7EB),
        icon: Icons.low_priority_rounded,
      );
    }

    return const _ActivityTaskStatusStyle(
      label: 'ปกติ',
      color: Color(0xFF2563EB),
      backgroundColor: Color(0xFFDBEAFE),
      icon: Icons.info_outline_rounded,
    );
  }

  _ActivityTaskItem _mapReportToTaskItem(ActivityReportModel report) {
    final activityDate = report.startTime ?? report.endTime ?? DateTime.now();
    final statusStyle = _resolveTaskStatusStyle(report);

    return _ActivityTaskItem(
      taskCode: _firstNonEmpty([report.reportId, report.missionId > 0 ? 'MISSION-${report.missionId}' : null]),
      title: _firstNonEmpty([report.missionName, report.description, report.note, report.deviceName], fallback: 'กิจกรรม'),
      date: _formatThaiShortDate(activityDate),
      activityDate: DateTime(activityDate.year, activityDate.month, activityDate.day),
      time: _formatTimeRange(report.startTime, report.endTime, durationInMinutes: report.duration),
      location: _firstNonEmpty([report.locationName, report.deviceName, report.deviceCode]),
      description: _firstNonEmpty([report.description, report.note, report.officerName], fallback: 'ไม่ระบุรายละเอียด'),
      badgeLabel: statusStyle.label,
      badgeColor: statusStyle.color,
      badgeBackgroundColor: statusStyle.backgroundColor,
      badgeIcon: statusStyle.icon,
      detailArguments: report,
      routeName: Routes.ACTIVITY_TASK_DETAILS_WIDGET,
    );
  }

  Future<void> _openActivityTaskDetails(_ActivityTaskItem item) async {
    final routeName = item.routeName;
    if (routeName == null || routeName.isEmpty) {
      return;
    }

    await Get.toNamed(routeName, arguments: item.detailArguments);
  }

  Future<void> _pickFilterDate(BuildContext context) async {
    final result = await showModalBottomSheet<List<dynamic>>(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(padding: MediaQuery.of(context).viewInsets, child: const BTDateWidget());
      },
    );

    if (result == null || result.isEmpty) {
      return;
    }

    final rawDate = result.first?.toString();
    final parsedDate = rawDate == null ? null : DateTime.tryParse(rawDate);
    if (parsedDate != null) {
      controller.updateDateFilter(parsedDate);
    }
  }

  InputDecoration _buildFilterDecoration({
    required FlutterFlowThemeNew theme,
    required String hintText,
    required Widget prefixIcon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      isDense: true,
      hintText: hintText,
      filled: true,
      fillColor: theme.secondaryBackground,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: theme.alternate, width: 1.0),
        borderRadius: BorderRadius.circular(18.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: theme.primary, width: 1.0),
        borderRadius: BorderRadius.circular(18.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowThemeNew.of(context);

    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: theme.primary,
      appBar: AppBar(
        backgroundColor: theme.primary,
        automaticallyImplyLeading: false,

        title: Text(
          'รายการกิจกรรม',
          textAlign: TextAlign.center,
          style: theme.titleSmall.override(
            fontFamily: theme.titleSmallFamily,
            color: theme.secondaryBackground,
            letterSpacing: 0.0,
            useGoogleFonts: !theme.titleSmallIsCustom,
          ),
        ),
        actions: const [],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: theme.primaryBackground,
          boxShadow: const [BoxShadow(blurRadius: 4.0, color: Color(0x33000000), offset: Offset(0.0, 0.0))],
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.all(16.0),
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
                        hintStyle: theme.bodyMedium.override(
                          fontFamily: theme.bodyMediumFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts: !theme.bodyMediumIsCustom,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0x00000000), width: 1.0),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: theme.customColor5, width: 1.0),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: theme.error, width: 1.0),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: theme.error, width: 1.0),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        filled: true,
                        fillColor: theme.secondaryBackground,
                        prefixIcon: const Icon(Icons.search_rounded, size: 20.0),
                      ),
                      style: theme.titleSmall.override(
                        fontFamily: theme.titleSmallFamily,
                        letterSpacing: 0.0,
                        useGoogleFonts: !theme.titleSmallIsCustom,
                      ),
                      cursorColor: theme.primary,
                      validator: controller.textControllerValidator.asValidator(context),
                    ),
                  ),
                  Obx(() {
                    final selectedDate = controller.selectedDate.value;

                    return Row(
                      children: [
                        Expanded(
                          child: DropDownPriority(
                            key: ValueKey(controller.selectedPriority.value),
                            selectItem: controller.selectedPriority.value,
                            onChangeds: controller.updatePriorityFilter,
                            checkErrorIcon: false,
                            textHint: 'ความสำคัญ',
                            popupTitleText: 'เลือกระดับความสำคัญ',
                            setColor: const Color(0xFF101828),
                            hintColor: theme.secondaryText,
                          ),
                        ),
                        const SizedBox(width: 12.0),
                        Expanded(
                          child: TextFormField(
                            key: ValueKey(selectedDate?.millisecondsSinceEpoch),
                            initialValue: selectedDate == null ? '' : _formatThaiShortDate(selectedDate),
                            readOnly: true,
                            showCursor: false,
                            onTap: () => _pickFilterDate(context),
                            decoration: _buildFilterDecoration(
                              theme: theme,
                              hintText: 'เลือกวันที่',
                              prefixIcon: const Icon(Icons.calendar_month_rounded, size: 20.0),
                              suffixIcon: selectedDate != null
                                  ? IconButton(
                                      onPressed: controller.clearDateFilter,
                                      icon: const Icon(Icons.close_rounded, size: 18.0),
                                      color: theme.secondaryText,
                                      tooltip: 'ล้างวันที่',
                                    )
                                  : Icon(Icons.keyboard_arrow_down_rounded, color: theme.secondaryText, size: 20.0),
                            ),
                            style: theme.bodyMedium.override(
                              fontFamily: theme.bodyMediumFamily,
                              color: const Color(0xFF101828),
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.0,
                              useGoogleFonts: !theme.bodyMediumIsCustom,
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ].divide(const SizedBox(height: 12.0)),
              ),
            ),
            const Divider(height: 1.0, thickness: 1.0, color: Color(0xFFD7D8D9)),
            Expanded(
              child: Obx(() {
                if (controller.isLoadingReports.value) {
                  return Center(child: CircularProgressIndicator(color: theme.primary));
                }

                final filteredTasks = _getFilteredTasks();
                final hasActiveFilters =
                    controller.searchQuery.value.isNotEmpty ||
                    controller.selectedPriority.value != controller.allPriorityFilter ||
                    controller.selectedDate.value != null;
                final hasLoadError = controller.loadErrorMessage.value.isNotEmpty && controller.reports.isEmpty;

                return Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: hasLoadError
                      ? _ActivityLoadErrorState(message: controller.loadErrorMessage.value, onRetry: controller.fetchReports)
                      : filteredTasks.isEmpty
                      ? _ActivityEmptyState(hasActiveFilters: hasActiveFilters)
                      : ListView.separated(
                          padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 24.0),
                          physics: const BouncingScrollPhysics(),
                          itemCount: filteredTasks.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 12.0),
                          itemBuilder: (context, index) {
                            final item = filteredTasks[index];
                            return _ActivityTaskCard(item: item, onTap: item.routeName == null ? null : () => _openActivityTaskDetails(item));
                          },
                        ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActivityTaskCard extends StatelessWidget {
  const _ActivityTaskCard({required this.item, this.onTap});

  final _ActivityTaskItem item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowThemeNew.of(context);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(28.0),
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28.0),
            border: Border.all(color: const Color(0xFFE7ECF3), width: 1.0),
            boxShadow: const [BoxShadow(blurRadius: 16.0, color: Color(0x12000000), offset: Offset(0.0, 6.0))],
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 16.0, 18.0, 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// รหัสงาน + สถานะ
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: _ActivityTaskCodePill(code: item.taskCode),
                      ),
                    ),
                    const SizedBox(width: 12.0),
                    _ActivityTaskStatusPill(label: item.badgeLabel, color: item.badgeColor, icon: item.badgeIcon),
                  ],
                ),

                const SizedBox(height: 14.0),

                /// หัวข้อ
                Text(
                  item.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.titleMedium.override(
                    fontFamily: theme.titleMediumFamily,
                    color: const Color(0xFF101828),
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.0,
                    useGoogleFonts: !theme.titleMediumIsCustom,
                  ),
                ),

                const SizedBox(height: 14.0),

                /// วัน + เวลา
                Wrap(
                  spacing: 12.0,
                  runSpacing: 10.0,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    _ActivityTaskMetaInfo(icon: Icons.calendar_today_rounded, iconColor: const Color(0xFF6B7280), text: item.date),
                    Container(width: 1.0, height: 18.0, color: const Color(0xFFD5D9E4)),
                    _ActivityTaskMetaInfo(icon: Icons.access_time_rounded, iconColor: const Color(0xFF1F76D2), text: item.time),
                  ],
                ),

                const SizedBox(height: 12.0),

                /// สถานที่
                _ActivityTaskMetaInfo(icon: Icons.location_on_rounded, iconColor: const Color(0xFFF25555), text: item.location, expandText: true),

                const SizedBox(height: 14.0),

                Container(width: double.infinity, height: 1.0, color: const Color(0xFFF1F4F8)),

                const SizedBox(height: 12.0),

                /// รายละเอียด
                Text(
                  item.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.bodyLarge.override(
                    fontFamily: theme.bodyLargeFamily,
                    color: const Color(0xFF667085),
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.0,
                    useGoogleFonts: !theme.bodyLargeIsCustom,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class _ActivityTaskCodePill extends StatelessWidget {
  const _ActivityTaskCodePill({required this.code});

  final String code;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 7.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F6FC),
        borderRadius: BorderRadius.circular(999.0),
        border: Border.all(color: const Color(0xFFD7E3F4), width: 1.0),
      ),
      child: Text(
        code,
        style: FlutterFlowThemeNew.of(context).bodyMedium.override(
          fontFamily: FlutterFlowThemeNew.of(context).bodyMediumFamily,
          color: const Color(0xFF2457A5),
          fontSize: 12.5,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.2,
          useGoogleFonts: !FlutterFlowThemeNew.of(context).bodyMediumIsCustom,
        ),
      ),
    );
  }
}

class _ActivityTaskStatusPill extends StatelessWidget {
  const _ActivityTaskStatusPill({required this.label, required this.color, required this.icon});

  final String label;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final gradientColors = switch (label) {
      'สำคัญมาก' => const [Color(0xFFD32F2F), Color(0xFFFF6B6B)],
      'เร่งด่วน' => const [Color(0xFFF57C00), Color(0xFFFFB74D)],
      'ปกติ' => const [Color(0xFF1976D2), Color(0xFF64B5F6)],
      'ต่ำ' => const [Color(0xFF546E7A), Color(0xFFB0BEC5)],
      _ => [color, color.withValues(alpha: 0.8)],
    };

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          stops: const [0.0, 1.0],
          begin: const AlignmentDirectional(1.0, 0.87),
          end: const AlignmentDirectional(-1.0, -0.87),
        ),
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(10.0, 6.0, 12.0, 6.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Icon(icon, color: FlutterFlowThemeNew.of(context).secondaryBackground, size: 16.0),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Text(
                label,
                style: FlutterFlowThemeNew.of(context).labelSmall.override(
                  fontFamily: FlutterFlowThemeNew.of(context).labelSmallFamily,
                  color: FlutterFlowThemeNew.of(context).secondaryBackground,
                  fontSize: 12.0,
                  letterSpacing: 0.0,
                  shadows: const [Shadow(color: Color(0x0F6C6C6C), offset: Offset(2.0, 2.0), blurRadius: 2.0)],
                  useGoogleFonts: !FlutterFlowThemeNew.of(context).labelSmallIsCustom,
                ),
              ),
            ),
          ].divide(const SizedBox(width: 6.0)),
        ),
      ),
    );
  }
}

class _ActivityTaskMetaInfo extends StatelessWidget {
  const _ActivityTaskMetaInfo({required this.icon, required this.iconColor, required this.text, this.expandText = false});

  final IconData icon;
  final Color iconColor;
  final String text;
  final bool expandText;

  @override
  Widget build(BuildContext context) {
    final textWidget = Text(
      text,
      maxLines: expandText ? 2 : 1,
      overflow: TextOverflow.ellipsis,
      style: FlutterFlowThemeNew.of(context).bodyMedium.override(
        fontFamily: FlutterFlowThemeNew.of(context).bodyMediumFamily,
        color: const Color(0xFF475467),
        fontSize: 13.5,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.0,
        useGoogleFonts: !FlutterFlowThemeNew.of(context).bodyMediumIsCustom,
      ),
    );

    return Row(
      mainAxisSize: expandText ? MainAxisSize.max : MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 1.0),
          child: Icon(icon, size: 16.0, color: iconColor),
        ),
        const SizedBox(width: 8.0),
        if (expandText) Expanded(child: textWidget) else textWidget,
      ],
    );
  }
}

class _ActivityLoadErrorState extends StatelessWidget {
  const _ActivityLoadErrorState({required this.message, required this.onRetry});

  final String message;
  final Future<void> Function({bool showLoading}) onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowThemeNew.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 72.0,
              height: 72.0,
              decoration: BoxDecoration(color: const Color(0xFFFFF3F2), borderRadius: BorderRadius.circular(24.0)),
              child: const Icon(Icons.cloud_off_rounded, color: Color(0xFFD92D20), size: 34.0),
            ),
            const SizedBox(height: 16.0),
            Text(
              'โหลดรายการกิจกรรมไม่สำเร็จ',
              textAlign: TextAlign.center,
              style: theme.titleMedium.override(
                fontFamily: theme.titleMediumFamily,
                color: const Color(0xFF101828),
                fontWeight: FontWeight.w700,
                letterSpacing: 0.0,
                useGoogleFonts: !theme.titleMediumIsCustom,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              message,
              textAlign: TextAlign.center,
              style: theme.bodyMedium.override(
                fontFamily: theme.bodyMediumFamily,
                color: const Color(0xFF667085),
                letterSpacing: 0.0,
                useGoogleFonts: !theme.bodyMediumIsCustom,
              ),
            ),
            const SizedBox(height: 18.0),
            ElevatedButton.icon(
              onPressed: () => onRetry(),
              icon: const Icon(Icons.refresh_rounded, size: 18.0),
              label: const Text('ลองอีกครั้ง'),
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.primary,
                foregroundColor: theme.secondaryBackground,
                padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                elevation: 0.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActivityEmptyState extends StatelessWidget {
  const _ActivityEmptyState({required this.hasActiveFilters});

  final bool hasActiveFilters;

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowThemeNew.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 72.0,
              height: 72.0,
              decoration: BoxDecoration(color: const Color(0xFFEAF2FF), borderRadius: BorderRadius.circular(24.0)),
              child: Icon(Icons.filter_alt_off_rounded, color: theme.primary, size: 34.0),
            ),
            const SizedBox(height: 16.0),
            Text(
              hasActiveFilters ? 'ไม่พบกิจกรรมตามตัวกรอง' : 'ยังไม่มีรายการกิจกรรม',
              textAlign: TextAlign.center,
              style: theme.titleMedium.override(
                fontFamily: theme.titleMediumFamily,
                color: const Color(0xFF101828),
                fontWeight: FontWeight.w700,
                letterSpacing: 0.0,
                useGoogleFonts: !theme.titleMediumIsCustom,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              hasActiveFilters ? 'ลองเปลี่ยนลำดับความสำคัญ คำค้นหา หรือวันที่ แล้วค้นหาอีกครั้ง' : 'เมื่อมีกิจกรรมใหม่ รายการจะแสดงที่หน้านี้',
              textAlign: TextAlign.center,
              style: theme.bodyMedium.override(
                fontFamily: theme.bodyMediumFamily,
                color: const Color(0xFF667085),
                letterSpacing: 0.0,
                useGoogleFonts: !theme.bodyMediumIsCustom,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActivityTaskStatusStyle {
  const _ActivityTaskStatusStyle({required this.label, required this.color, required this.backgroundColor, required this.icon});

  final String label;
  final Color color;
  final Color backgroundColor;
  final IconData icon;
}

class _ActivityTaskItem {
  const _ActivityTaskItem({
    required this.taskCode,
    required this.title,
    required this.date,
    required this.activityDate,
    required this.time,
    required this.location,
    required this.description,
    required this.badgeLabel,
    required this.badgeColor,
    required this.badgeBackgroundColor,
    required this.badgeIcon,
    this.detailArguments,
    this.routeName,
  });

  final String taskCode;
  final String title;
  final String date;
  final DateTime activityDate;
  final String time;
  final String location;
  final String description;
  final String badgeLabel;
  final Color badgeColor;
  final Color badgeBackgroundColor;
  final IconData badgeIcon;
  final Object? detailArguments;
  final String? routeName;
}
