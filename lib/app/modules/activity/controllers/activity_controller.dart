import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:body_camera/app/data/models/activity_report_model.dart';
import 'package:body_camera/app/services/user_api_service.dart';

import '../../../../flutter_flow/flutter_flow_animations_pin.dart';
import '../../../../widgets/global_widget.dart';

class ActivityController extends GetxController {
  ActivityController({UserApiService? userApiService})
    : _userApiService = userApiService ?? UserApiService();

  static const bool useMockReports = false;

  final UserApiService _userApiService;
  final count = 0.obs;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = <String, AnimationInfo>{};
  final searchQuery = ''.obs;
  final selectedPriority = DropDownPriority.allPriorityFilter.obs;
  final selectedDate = Rxn<DateTime>();
  final reports = <ActivityReportModel>[].obs;
  final isLoadingReports = true.obs;
  final loadErrorMessage = ''.obs;

  late final FocusNode textFieldFocusNode;
  late final TextEditingController textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  String get allPriorityFilter => DropDownPriority.allPriorityFilter;

  @override
  void onInit() {
    textFieldFocusNode = FocusNode();
    textController = TextEditingController();
    textController.addListener(_handleSearchChanged);
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    await fetchReports();
  }

  @override
  void onClose() {
    textController
      ..removeListener(_handleSearchChanged)
      ..dispose();
    textFieldFocusNode.dispose();
    _userApiService.dispose();
    super.onClose();
  }

  void updatePriorityFilter(String? value) {
    selectedPriority.value = value ?? allPriorityFilter;
  }

  void updateDateFilter(DateTime? value) {
    selectedDate.value = value == null
        ? null
        : DateTime(value.year, value.month, value.day);
  }

  void clearDateFilter() {
    selectedDate.value = null;
  }

  Future<void> fetchReports({bool showLoading = true}) async {
    if (showLoading) {
      isLoadingReports.value = true;
    }

    loadErrorMessage.value = '';

    if (useMockReports) {
      reports.assignAll(_buildMockReports());
      isLoadingReports.value = false;
      return;
    }

    try {
      final resolvedReports = await _userApiService.getReports();
      log(
        'resolvedReports count: ${resolvedReports.length}',
        name: 'ActivityController.fetchReports',
      );
      reports.assignAll(resolvedReports);
    } on UserApiException catch (error) {
      loadErrorMessage.value = error.message;
    } catch (_) {
      loadErrorMessage.value =
          'ไม่สามารถโหลดรายการกิจกรรมได้ กรุณาลองใหม่อีกครั้ง';
    } finally {
      isLoadingReports.value = false;
    }
  }

  void _handleSearchChanged() {
    searchQuery.value = textController.text.trim();
  }

  List<ActivityReportModel> _buildMockReports() {
    final now = DateTime.now();

    ActivityReportModel mockReport({
      required int index,
      required String reportId,
      required int missionId,
      required String missionName,
      required DateTime startTime,
      required DateTime endTime,
      required String missionStatus,
      required String description,
      required int officerId,
      required String officerName,
      required int locationId,
      required String locationName,
      required String deviceCode,
      required String deviceName,
      required String priority,
      required String note,
      required bool active,
      double? latitude,
      double? longitude,
    }) {
      return ActivityReportModel(
        reportId: reportId,
        missionId: missionId,
        missionName: missionName,
        startTime: startTime,
        endTime: endTime,
        latitude: latitude,
        longitude: longitude,
        missionStatus: missionStatus,
        description: description,
        officerId: officerId,
        officerName: officerName,
        locationId: locationId,
        deviceCode: deviceCode,
        priority: priority,
        duration: endTime.difference(startTime).inMinutes,
        note: note,
        locationName: locationName,
        deviceName: deviceName,
        deviceType: 'Body Camera',
        serialNo: 'BWC-${(index + 1).toString().padLeft(4, '0')}',
        active: active,
      );
    }

    return [
      mockReport(
        index: 0,
        reportId: 'ACT-2026-001',
        missionId: 1001,
        missionName: 'ตรวจตราตลาดเช้า',
        startTime: DateTime(now.year, now.month, now.day, 6, 30),
        endTime: DateTime(now.year, now.month, now.day, 7, 45),
        missionStatus: '2',
        description: 'ตรวจความเรียบร้อยบริเวณตลาดสดและทางเข้าออกหลัก',
        officerId: 501,
        officerName: 'ส.ต.อ. ภาคิน',
        locationId: 301,
        locationName: 'ตลาดกลางเมือง',
        deviceCode: 'CAM-001',
        deviceName: 'Body Cam A01',
        priority: 'ปกติ',
        note: 'ประชาชนให้ความร่วมมือดี',
        active: true,
        latitude: 13.7563,
        longitude: 100.5018,
      ),
      mockReport(
        index: 1,
        reportId: 'ACT-2026-002',
        missionId: 1002,
        missionName: 'อำนวยการจราจรหน้าโรงเรียน',
        startTime: DateTime(now.year, now.month, now.day, 7, 0),
        endTime: DateTime(now.year, now.month, now.day, 8, 15),
        missionStatus: '3',
        description: 'จัดระเบียบการรับส่งนักเรียนช่วงเวลาเร่งด่วน',
        officerId: 502,
        officerName: 'ร.ต.ต. ชนาธิป',
        locationId: 302,
        locationName: 'โรงเรียนเทศบาล 1',
        deviceCode: 'CAM-002',
        deviceName: 'Body Cam A02',
        priority: 'เร่งด่วน',
        note: 'พบรถจอดกีดขวาง 2 คัน',
        active: true,
        latitude: 13.7412,
        longitude: 100.5351,
      ),
      mockReport(
        index: 2,
        reportId: 'ACT-2026-003',
        missionId: 1003,
        missionName: 'รับแจ้งเหตุทะเลาะวิวาท',
        startTime: DateTime(now.year, now.month, now.day, 9, 10),
        endTime: DateTime(now.year, now.month, now.day, 10, 5),
        missionStatus: '4',
        description: 'เข้าระงับเหตุทะเลาะวิวาทภายในชุมชนและแยกคู่กรณี',
        officerId: 503,
        officerName: 'ด.ต. ศุภชัย',
        locationId: 303,
        locationName: 'ชุมชนริมคลอง',
        deviceCode: 'CAM-003',
        deviceName: 'Body Cam A03',
        priority: 'สำคัญมาก',
        note: 'ควบคุมสถานการณ์ได้ภายใน 20 นาที',
        active: false,
        latitude: 13.7287,
        longitude: 100.5692,
      ),
      mockReport(
        index: 3,
        reportId: 'ACT-2026-004',
        missionId: 1004,
        missionName: 'ตรวจพื้นที่รอบสถานีขนส่ง',
        startTime: DateTime(now.year, now.month, now.day - 1, 14, 0),
        endTime: DateTime(now.year, now.month, now.day - 1, 15, 10),
        missionStatus: '1',
        description: 'ตรวจตราจุดเสี่ยงและพื้นที่รอโดยสาร',
        officerId: 504,
        officerName: 'ส.ต.ท. กิตติพงษ์',
        locationId: 304,
        locationName: 'สถานีขนส่งผู้โดยสาร',
        deviceCode: 'CAM-004',
        deviceName: 'Body Cam A04',
        priority: 'ต่ำ',
        note: 'ไม่พบเหตุผิดปกติ',
        active: true,
        latitude: 13.7654,
        longitude: 100.5373,
      ),
      mockReport(
        index: 4,
        reportId: 'ACT-2026-005',
        missionId: 1005,
        missionName: 'สนับสนุนงานชุมชนสัมพันธ์',
        startTime: DateTime(now.year, now.month, now.day - 1, 16, 30),
        endTime: DateTime(now.year, now.month, now.day - 1, 17, 20),
        missionStatus: '2',
        description: 'อำนวยความปลอดภัยกิจกรรมพบประชาชน',
        officerId: 505,
        officerName: 'จ.ส.ต. อรรถพล',
        locationId: 305,
        locationName: 'ศาลาประชาคม',
        deviceCode: 'CAM-005',
        deviceName: 'Body Cam A05',
        priority: 'ปกติ',
        note: 'มีผู้เข้าร่วมประมาณ 120 คน',
        active: false,
        latitude: 13.7124,
        longitude: 100.4981,
      ),
      mockReport(
        index: 5,
        reportId: 'ACT-2026-006',
        missionId: 1006,
        missionName: 'ตั้งจุดตรวจช่วงกลางคืน',
        startTime: DateTime(now.year, now.month, now.day - 2, 21, 0),
        endTime: DateTime(now.year, now.month, now.day - 2, 22, 30),
        missionStatus: '3',
        description: 'ตรวจยานพาหนะและบุคคลต้องสงสัยบนถนนสายหลัก',
        officerId: 506,
        officerName: 'ร.ต.อ. ธีรภัทร',
        locationId: 306,
        locationName: 'แยกไฟแดงหน้าอำเภอ',
        deviceCode: 'CAM-006',
        deviceName: 'Body Cam B01',
        priority: 'เร่งด่วน',
        note: 'ตรวจรถ 18 คัน ไม่พบสิ่งผิดกฎหมาย',
        active: true,
        latitude: 13.7791,
        longitude: 100.5134,
      ),
      mockReport(
        index: 6,
        reportId: 'ACT-2026-007',
        missionId: 1007,
        missionName: 'ดูแลความปลอดภัยงานวิ่ง',
        startTime: DateTime(now.year, now.month, now.day + 1, 4, 45),
        endTime: DateTime(now.year, now.month, now.day + 1, 7, 0),
        missionStatus: '2',
        description: 'ประสานเส้นทางและดูแลผู้เข้าร่วมกิจกรรมวิ่งการกุศล',
        officerId: 507,
        officerName: 'ส.ต.ต. ณัฐวุฒิ',
        locationId: 307,
        locationName: 'สวนสาธารณะจังหวัด',
        deviceCode: 'CAM-007',
        deviceName: 'Body Cam B02',
        priority: 'ปกติ',
        note: 'มีทีมแพทย์ standby ตลอดเส้นทาง',
        active: true,
        latitude: 13.7444,
        longitude: 100.5162,
      ),
      mockReport(
        index: 7,
        reportId: 'ACT-2026-008',
        missionId: 1008,
        missionName: 'เฝ้าระวังพื้นที่เสี่ยงน้ำท่วม',
        startTime: DateTime(now.year, now.month, now.day + 1, 10, 15),
        endTime: DateTime(now.year, now.month, now.day + 1, 11, 0),
        missionStatus: '4',
        description: 'ตรวจระดับน้ำและแจ้งเตือนประชาชนในพื้นที่ต่ำ',
        officerId: 508,
        officerName: 'พ.ต.ต. วรพล',
        locationId: 308,
        locationName: 'ชุมชนท้ายวัด',
        deviceCode: 'CAM-008',
        deviceName: 'Body Cam B03',
        priority: 'สำคัญมาก',
        note: 'แนะนำเส้นทางอพยพเบื้องต้นแล้ว',
        active: false,
        latitude: 13.7013,
        longitude: 100.4929,
      ),
      mockReport(
        index: 8,
        reportId: 'ACT-2026-009',
        missionId: 1009,
        missionName: 'ตรวจสอบทรัพย์สินสูญหาย',
        startTime: DateTime(now.year, now.month, now.day + 2, 13, 0),
        endTime: DateTime(now.year, now.month, now.day + 2, 13, 40),
        missionStatus: '1',
        description: 'ลงบันทึกและตรวจสอบกล้องวงจรปิดเบื้องต้น',
        officerId: 509,
        officerName: 'ส.ต.อ. ปริญญา',
        locationId: 309,
        locationName: 'ห้างสรรพสินค้าเซ็นเตอร์พลาซ่า',
        deviceCode: 'CAM-009',
        deviceName: 'Body Cam B04',
        priority: 'ต่ำ',
        note: 'ผู้เสียหายแจ้งกระเป๋าสตางค์หาย',
        active: true,
        latitude: 13.7469,
        longitude: 100.5325,
      ),
      mockReport(
        index: 9,
        reportId: 'ACT-2026-010',
        missionId: 1010,
        missionName: 'เตรียมกำลังก่อนงานเทศกาล',
        startTime: DateTime(now.year, now.month, now.day + 3, 18, 0),
        endTime: DateTime(now.year, now.month, now.day + 3, 19, 30),
        missionStatus: '3',
        description: 'ประชุมชี้แจงแผนกำลังพลและอุปกรณ์ประจำจุด',
        officerId: 510,
        officerName: 'พ.ต.อ. นครินทร์',
        locationId: 310,
        locationName: 'ลานกิจกรรมหน้าศาลากลาง',
        deviceCode: 'CAM-010',
        deviceName: 'Body Cam B05',
        priority: 'เร่งด่วน',
        note: 'ทดสอบสัญญาณวิทยุและกล้องครบทุกชุด',
        active: true,
        latitude: 13.7525,
        longitude: 100.4937,
      ),
    ];
  }

  void increment() => count.value++;
}
