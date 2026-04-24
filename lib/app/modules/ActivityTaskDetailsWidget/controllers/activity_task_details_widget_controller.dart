import 'dart:developer';

import 'package:expandable/expandable.dart';
import 'package:body_camera/app/data/models/activity_report_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart' as map2;
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart' as latlng2;

import '../../../../utils/app_info_utils.dart';

class ActivityTaskDetailsWidgetController extends GetxController {
  ActivityReportModel? selectedReport;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  late ExpandableController expandableExpandableController1;
  late ExpandableController expandableExpandableController2;
  RxBool checkboxValue = false.obs;
  final count = 0.obs;
  latlng2.LatLng latLng = const latlng2.LatLng(13.674236, 100.509118);
  map2.MapController mapController = map2.MapController();
  final markersMap = <map2.Marker>[].obs;
  final GeolocatorPlatform geolocatorPlatform = GeolocatorPlatform.instance;
  final RxString packageName = AppInfoUtils.cachedPackageName.obs;

  String get tileUserAgentPackageName => packageName.value;
  String get title => _firstNonEmpty([
    selectedReport?.missionName,
    selectedReport?.description,
    selectedReport?.note,
    selectedReport?.deviceName,
  ], fallback: 'กิจกรรม');

  String get reportCode => _firstNonEmpty([
    selectedReport?.reportId,
    (() {
      final report = selectedReport;
      if (report == null || report.missionId <= 0) {
        return null;
      }
      return 'MISSION-${report.missionId}';
    })(),
  ]);

  String get priorityLabel {
    if (selectedReport == null) {
      return '';
    }

    final priority = selectedReport?.priority.trim().toLowerCase() ?? '';
    final missionStatus = selectedReport?.missionStatus.trim() ?? '';

    if (priority == 'สำคัญมาก' || priority == 'high' || missionStatus == '4') {
      return 'สำคัญมาก';
    }
    if (priority == 'เร่งด่วน' ||
        priority == 'urgent' ||
        missionStatus == '3') {
      return 'เร่งด่วน';
    }
    if (priority == 'ต่ำ' || priority == 'low' || missionStatus == '1') {
      return 'ต่ำ';
    }
    return 'ปกติ';
  }

  IconData get priorityIcon {
    switch (priorityLabel) {
      case 'สำคัญมาก':
        return Icons.warning_amber_rounded;
      case 'เร่งด่วน':
        return Icons.priority_high_rounded;
      case 'ต่ำ':
        return Icons.low_priority_rounded;
      default:
        return Icons.info_outline_rounded;
    }
  }

  List<Color> get priorityGradientColors {
    switch (priorityLabel) {
      case 'สำคัญมาก':
        return const [Color(0xFFD32F2F), Color(0xFFFF6B6B)];
      case 'เร่งด่วน':
        return const [Color(0xFFF57C00), Color(0xFFFFB74D)];
      case 'ต่ำ':
        return const [Color(0xFF546E7A), Color(0xFFB0BEC5)];
      default:
        return const [Color(0xFF1976D2), Color(0xFF64B5F6)];
    }
  }

  String get officerName =>
      _firstNonEmpty([selectedReport?.officerName], fallback: '-');

  String get deviceText {
    final deviceName = selectedReport?.deviceName.trim() ?? '';
    final deviceCode = selectedReport?.deviceCode.trim() ?? '';
    final serialNo = selectedReport?.serialNo.trim() ?? '';

    if (deviceName.isNotEmpty && deviceCode.isNotEmpty) {
      return '$deviceName ($deviceCode)';
    }
    return _firstNonEmpty([deviceName, deviceCode, serialNo], fallback: '-');
  }

  String get durationText {
    final duration = selectedReport?.duration ?? 0;
    if (duration > 0) {
      return '$duration นาที';
    }

    final startTime = selectedReport?.startTime;
    final endTime = selectedReport?.endTime;
    if (startTime != null && endTime != null) {
      final resolvedMinutes = endTime.difference(startTime).inMinutes;
      if (resolvedMinutes > 0) {
        return '$resolvedMinutes นาที';
      }
    }

    return '-';
  }

  String get locationText => _firstNonEmpty([
    selectedReport?.locationName,
    selectedReport?.description,
    selectedReport?.note,
    selectedReport?.deviceName,
  ], fallback: '-');

  String get dateText =>
      _formatDate(selectedReport?.startTime ?? selectedReport?.endTime);

  String get startTimeText => _formatTimeValue(selectedReport?.startTime);

  String get endTimeText => _formatTimeValue(selectedReport?.endTime);

  String get timeText =>
      _formatTimeRange(selectedReport?.startTime, selectedReport?.endTime);

  String get latitudeText {
    final latitude = selectedReport?.latitude;
    return latitude == null ? '-' : latitude.toStringAsFixed(4);
  }

  String get longitudeText {
    final longitude = selectedReport?.longitude;
    return longitude == null ? '-' : longitude.toStringAsFixed(4);
  }

  @override
  void onInit() {
    super.onInit();
    selectedReport = Get.arguments is ActivityReportModel
        ? Get.arguments as ActivityReportModel
        : null;
    _syncReportLocation();

    expandableExpandableController1 = ExpandableController(
      initialExpanded: true,
    );
    expandableExpandableController2 = ExpandableController(
      initialExpanded: true,
    );
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    await _loadTileUserAgentPackageName();
    await _getLocation();
  }

  Future<void> _loadTileUserAgentPackageName() async {
    packageName.value = AppInfoUtils.cachedPackageName;

    if (packageName.value == 'unknown') {
      packageName.value = await AppInfoUtils.getPackageName();
    }

    log('PackageName $packageName');
  }

  void _syncReportLocation() {
    final latitude = selectedReport?.latitude;
    final longitude = selectedReport?.longitude;
    if (latitude == null || longitude == null) {
      return;
    }

    latLng = latlng2.LatLng(latitude, longitude);
  }

  Future<void> _getLocation() async {
    markersMap.clear();

    markersMap.add(
      map2.Marker(
        height: 40,
        width: 40,
        builder: (context) => Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Image.asset('assets/images/pin_red.png'),
        ),
        point: latLng,
      ),
    );
    mapController.move(latLng, 15);
    log('latitude2 $latLng');
  }

  String _firstNonEmpty(Iterable<String?> values, {String fallback = ''}) {
    for (final value in values) {
      final resolved = value?.trim() ?? '';
      if (resolved.isNotEmpty) {
        return resolved;
      }
    }
    return fallback;
  }

  String _formatDate(DateTime? value) {
    if (value == null) {
      return '-';
    }

    final day = value.day.toString().padLeft(2, '0');
    final month = value.month.toString().padLeft(2, '0');
    final year = value.year.toString().padLeft(4, '0');
    return '$day/$month/$year';
  }

  String _formatTime(DateTime value) {
    final hour = value.hour.toString().padLeft(2, '0');
    final minute = value.minute.toString().padLeft(2, '0');
    return '$hour:$minute น.';
  }

  String _formatTimeValue(DateTime? value) {
    return value == null ? '-' : _formatTime(value);
  }

  String _formatTimeRange(DateTime? startTime, DateTime? endTime) {
    if (startTime != null && endTime != null) {
      return '${_formatTime(startTime)} - ${_formatTime(endTime)}';
    }
    if (startTime != null) {
      return _formatTime(startTime);
    }
    if (endTime != null) {
      return _formatTime(endTime);
    }
    return '-';
  }

  void increment() => count.value++;
}
