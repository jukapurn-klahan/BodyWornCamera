import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../flutter_flow/flutter_flow_icon_button.dart';
import '../../../../flutter_flow/flutter_flow_theme_new.dart';
import '../../../../flutter_flow/flutter_flow_util.dart';
import '../../../../widgets/global_widget.dart';
import '../../../../widgets/calendar_widget/b_t_date_widget.dart';
import '../../../../widgets/not_found/not_found_widget.dart';
import '../../../routes/app_pages.dart';
import '../controllers/activity_controller.dart';

class ActivityView extends GetView<ActivityController> {
  const ActivityView({super.key});

  static final List<_ActivityTaskItem> _activityTasks = [
    _ActivityTaskItem(
      taskCode: 'SC-001',
      title: 'ออกตรวจพื้นที่ NWL 1',
      date: '01 เม.ย. 2569',
      activityDate: DateTime(2026, 4, 1),
      time: '09:30 น.',
      location: 'พื้นที่ NWL 1',
      description: 'ลงตรวจตามแผนประจำวันและบันทึกผลการปฏิบัติงานเรียบร้อย',
      badgeLabel: 'สำคัญมาก',
      badgeColor: Color(0xFFEF4444),
      badgeBackgroundColor: Color(0xFFFEE2E2),
      badgeIcon: Icons.warning_amber_rounded,
      routeName: Routes.ACTIVITY_TASK_DETAILS_WIDGET,
    ),
    _ActivityTaskItem(
      taskCode: 'SC-002',
      title: 'ออกตรวจพื้นที่ NWL 2',
      date: '01 เม.ย. 2569',
      activityDate: DateTime(2026, 4, 1),
      time: '11:00 น.',
      location: 'พื้นที่ NWL 2',
      description: 'รออนุมัติแผนปรับเส้นทางก่อนเริ่มดำเนินการในรอบถัดไป',
      badgeLabel: 'เร่งด่วน',
      badgeColor: Color(0xFFF59E0B),
      badgeBackgroundColor: Color(0xFFFFEDD5),
      badgeIcon: Icons.priority_high_rounded,
    ),
    _ActivityTaskItem(
      taskCode: 'SC-003',
      title: 'ออกตรวจพื้นที่ NWL 3',
      date: '02 เม.ย. 2569',
      activityDate: DateTime(2026, 4, 2),
      time: '13:45 น.',
      location: 'พื้นที่ NWL 3',
      description: 'ติดตามผลการตรวจซ้ำและอัปเดตสถานะงานให้ศูนย์ควบคุมทราบ',
      badgeLabel: 'ปกติ',
      badgeColor: Color(0xFF2563EB),
      badgeBackgroundColor: Color(0xFFDBEAFE),
      badgeIcon: Icons.info_outline_rounded,
    ),
    _ActivityTaskItem(
      taskCode: 'SC-004',
      title: 'ตรวจติดตามจุดรายงานทั่วไป',
      date: '02 เม.ย. 2569',
      activityDate: DateTime(2026, 4, 2),
      time: '16:00 น.',
      location: 'พื้นที่ NWL 4',
      description: 'ติดตามสถานการณ์ทั่วไปและบันทึกข้อมูลประกอบการสรุปงานประจำวัน',
      badgeLabel: 'ต่ำ',
      badgeColor: Color(0xFF6B7280),
      badgeBackgroundColor: Color(0xFFE5E7EB),
      badgeIcon: Icons.low_priority_rounded,
    ),
  ];

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
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 54.0,
          icon: const Icon(Icons.keyboard_arrow_left_rounded, color: Colors.white, size: 24.0),
          onPressed: () async {},
        ),
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
                final filteredTasks = _getFilteredTasks();
                final hasActiveFilters =
                    controller.searchQuery.value.isNotEmpty ||
                    controller.selectedPriority.value != controller.allPriorityFilter ||
                    controller.selectedDate.value != null;

                return Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: filteredTasks.isEmpty
                      ? const Center(child: NotFoundWidget())
                      : ListView.separated(
                          padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 24.0),
                          physics: const BouncingScrollPhysics(),
                          itemCount: filteredTasks.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 12.0),
                          itemBuilder: (context, index) {
                            final item = filteredTasks[index];
                            return _ActivityTaskCard(item: item, onTap: item.routeName == null ? null : () => Get.toNamed(item.routeName!));
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
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(28.0),
        child: Ink(
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
                    _ActivityTaskCodePill(code: item.taskCode),
                    const SizedBox(width: 12.0),
                    Expanded(
                      child: Text(
                        item.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: FlutterFlowThemeNew.of(context).titleMedium.override(
                          fontFamily: FlutterFlowThemeNew.of(context).titleMediumFamily,
                          color: const Color(0xFF101828),
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.0,
                          useGoogleFonts: !FlutterFlowThemeNew.of(context).titleMediumIsCustom,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LayoutBuilder(
                            builder: (context, constraints) {
                              final dateTimeRow = Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  _ActivityTaskMetaInfo(icon: Icons.calendar_today_rounded, iconColor: const Color(0xFF6B7280), text: item.date),
                                  const SizedBox(width: 14.0),
                                  Container(width: 1.0, height: 20.0, color: const Color(0xFFD5D9E4)),
                                  const SizedBox(width: 14.0),
                                  _ActivityTaskMetaInfo(icon: Icons.access_time_rounded, iconColor: const Color(0xFF1F76D2), text: item.time),
                                ],
                              );

                              final statusPill = _ActivityTaskStatusPill(label: item.badgeLabel, color: item.badgeColor, icon: item.badgeIcon);

                              if (constraints.maxWidth >= 360.0) {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(child: dateTimeRow),
                                    const SizedBox(width: 12.0),
                                    statusPill,
                                  ],
                                );
                              }

                              return Wrap(
                                spacing: 12.0,
                                runSpacing: 10.0,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [dateTimeRow, statusPill],
                              );
                            },
                          ),
                          const SizedBox(height: 12.0),
                          Row(
                            children: [
                              Expanded(
                                child: _ActivityTaskMetaInfo(
                                  icon: Icons.location_on_rounded,
                                  iconColor: const Color(0xFFF25555),
                                  text: item.location,
                                  expandText: true,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14.0),
                          Text(
                            item.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: FlutterFlowThemeNew.of(context).bodyLarge.override(
                              fontFamily: FlutterFlowThemeNew.of(context).bodyLargeFamily,
                              color: const Color(0xFF6B7280),
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.0,
                              useGoogleFonts: !FlutterFlowThemeNew.of(context).bodyLargeIsCustom,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 6.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFFF4FAFF), Color(0xFFDCEBFF)], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(999.0),
        border: Border.all(color: const Color(0xFFB9D6FF)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.sell_outlined, size: 16.0, color: Color(0xFF1D5EC8)),
          const SizedBox(width: 6.0),
          Text(
            code,
            style: const TextStyle(color: Color(0xFF184FA9), fontSize: 14.0, fontWeight: FontWeight.w800, letterSpacing: 0.2),
          ),
        ],
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
  final String? routeName;
}

class PinCodePage extends StatefulWidget {
  const PinCodePage({super.key});

  @override
  State<PinCodePage> createState() => _PinCodePageState();
}

class _PinCodePageState extends State<PinCodePage> {
  final int pinLength = 6;
  String pin = '';
  String errorText = '';

  void onNumberTap(String value) {
    if (pin.length >= pinLength) return;

    setState(() {
      pin += value;
      errorText = '';
    });

    if (pin.length == pinLength) {
      verifyPin();
    }
  }

  void onBackspace() {
    if (pin.isEmpty) return;

    setState(() {
      pin = pin.substring(0, pin.length - 1);
      errorText = '';
    });
  }

  void verifyPin() {
    // ตัวอย่างตรวจสอบ PIN
    const correctPin = '123456';

    Future.delayed(const Duration(milliseconds: 150), () {
      if (!mounted) return;

      if (pin == correctPin) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('เข้าสู่ระบบสำเร็จ')));
      } else {
        setState(() {
          pin = '';
          errorText = 'รหัส PIN ไม่ถูกต้อง';
        });
      }
    });
  }

  Widget buildPinIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pinLength, (index) {
        final isFilled = index < pin.length;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          margin: const EdgeInsets.symmetric(horizontal: 8),
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: isFilled ? const Color(0xFF2563EB) : Colors.transparent,
            border: Border.all(color: isFilled ? const Color(0xFF2563EB) : Colors.grey.shade400, width: 1.8),
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }

  Widget buildKey(String text, {VoidCallback? onTap, Widget? child}) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: onTap,
      child: Container(
        width: 78,
        height: 78,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 12, offset: const Offset(0, 4), color: Colors.black.withValues(alpha: 0.08))],
        ),
        child: Center(
          child: child ?? Text(text, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }

  Widget buildNumberPad() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildKey('1', onTap: () => onNumberTap('1')),
            buildKey('2', onTap: () => onNumberTap('2')),
            buildKey('3', onTap: () => onNumberTap('3')),
          ],
        ),
        const SizedBox(height: 18),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildKey('4', onTap: () => onNumberTap('4')),
            buildKey('5', onTap: () => onNumberTap('5')),
            buildKey('6', onTap: () => onNumberTap('6')),
          ],
        ),
        const SizedBox(height: 18),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildKey('7', onTap: () => onNumberTap('7')),
            buildKey('8', onTap: () => onNumberTap('8')),
            buildKey('9', onTap: () => onNumberTap('9')),
          ],
        ),
        const SizedBox(height: 18),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildKey(
              '',
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('เรียกใช้งานสแกนนิ้วมือ')));
              },
              child: const Icon(Icons.fingerprint, size: 30),
            ),
            buildKey('0', onTap: () => onNumberTap('0')),
            buildKey('', onTap: onBackspace, child: const Icon(Icons.backspace_outlined, size: 28)),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                width: 88,
                height: 88,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFE8F0FF),
                  boxShadow: [BoxShadow(blurRadius: 14, color: Colors.black.withValues(alpha: 0.06), offset: const Offset(0, 4))],
                ),
                child: const Icon(Icons.lock_outline_rounded, size: 42, color: Color(0xFF2563EB)),
              ),
              const SizedBox(height: 24),
              const Text('กรอกรหัส PIN', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text('เพื่อเข้าสู่ระบบอย่างปลอดภัย', style: TextStyle(fontSize: 15, color: Colors.grey.shade600)),
              const SizedBox(height: 30),
              buildPinIndicator(),
              const SizedBox(height: 18),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: Text(
                  errorText,
                  key: ValueKey(errorText),
                  style: const TextStyle(color: Colors.red, fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              const Spacer(),
              buildNumberPad(),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {},
                child: const Text('ลืมรหัส PIN?', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
