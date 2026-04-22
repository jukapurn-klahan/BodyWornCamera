class ActivityReportModel {
  const ActivityReportModel({
    required this.reportId,
    required this.missionId,
    required this.missionName,
    required this.startTime,
    required this.endTime,
    required this.latitude,
    required this.longitude,
    required this.missionStatus,
    required this.description,
    required this.officerId,
    required this.officerName,
    required this.locationId,
    required this.deviceCode,
    required this.priority,
    required this.duration,
    required this.note,
    required this.locationName,
    required this.deviceName,
    required this.deviceType,
    required this.serialNo,
    required this.active,
  });

  final String reportId;
  final int missionId;
  final String missionName;
  final DateTime? startTime;
  final DateTime? endTime;
  final double? latitude;
  final double? longitude;
  final String missionStatus;
  final String description;
  final int officerId;
  final String officerName;
  final int locationId;
  final String deviceCode;
  final String priority;
  final int duration;
  final String note;
  final String locationName;
  final String deviceName;
  final String deviceType;
  final String serialNo;
  final bool active;

  factory ActivityReportModel.fromJson(Map<String, dynamic> json) {
    return ActivityReportModel(
      reportId: _readString(json, const ['reportId', 'ReportId']) ?? '',
      missionId: _readInt(json, const ['missionId', 'MissionId']) ?? 0,
      missionName:
          _readString(json, const ['missionName', 'MissionName']) ?? '',
      startTime: _readDateTime(json, const ['startTime', 'StartTime']),
      endTime: _readDateTime(json, const ['endTime', 'EndTime']),
      latitude: _readDouble(json, const ['latitude', 'Latitude']),
      longitude: _readDouble(json, const ['longitude', 'Longitude']),
      missionStatus:
          _readString(json, const ['missionStatus', 'MissionStatus']) ?? '',
      description:
          _readString(json, const ['description', 'Description']) ?? '',
      officerId: _readInt(json, const ['officerId', 'OfficerId']) ?? 0,
      officerName:
          _readString(json, const ['officerName', 'OfficerName']) ?? '',
      locationId: _readInt(json, const ['locationId', 'LocationId']) ?? 0,
      deviceCode: _readString(json, const ['deviceCode', 'DeviceCode']) ?? '',
      priority: _readString(json, const ['priority', 'Priority']) ?? '',
      duration: _readInt(json, const ['duration', 'Duration']) ?? 0,
      note: _readString(json, const ['note', 'Note']) ?? '',
      locationName:
          _readString(json, const ['locationName', 'LocationName']) ?? '',
      deviceName: _readString(json, const ['deviceName', 'DeviceName']) ?? '',
      deviceType: _readString(json, const ['deviceType', 'DeviceType']) ?? '',
      serialNo: _readString(json, const ['serialNo', 'SerialNo']) ?? '',
      active: _readBool(json, const ['active', 'Active']) ?? false,
    );
  }

  static int? _readInt(Map<String, dynamic> json, List<String> keys) {
    for (final key in keys) {
      final value = json[key];
      if (value == null) {
        continue;
      }

      if (value is int) {
        return value;
      }

      final parsed = int.tryParse(value.toString().trim());
      if (parsed != null) {
        return parsed;
      }
    }

    return null;
  }

  static double? _readDouble(Map<String, dynamic> json, List<String> keys) {
    for (final key in keys) {
      final value = json[key];
      if (value == null) {
        continue;
      }

      if (value is double) {
        return value;
      }
      if (value is int) {
        return value.toDouble();
      }

      final parsed = double.tryParse(value.toString().trim());
      if (parsed != null) {
        return parsed;
      }
    }

    return null;
  }

  static String? _readString(Map<String, dynamic> json, List<String> keys) {
    for (final key in keys) {
      final value = json[key];
      if (value == null) {
        continue;
      }

      final resolved = value.toString().trim();
      if (resolved.isNotEmpty) {
        return resolved;
      }
    }

    return null;
  }

  static DateTime? _readDateTime(Map<String, dynamic> json, List<String> keys) {
    for (final key in keys) {
      final value = json[key];
      if (value == null) {
        continue;
      }

      final resolved = value.toString().trim();
      if (resolved.isEmpty) {
        continue;
      }

      final parsed = DateTime.tryParse(resolved);
      if (parsed != null) {
        return parsed;
      }
    }

    return null;
  }

  static bool? _readBool(Map<String, dynamic> json, List<String> keys) {
    for (final key in keys) {
      final value = json[key];
      if (value == null) {
        continue;
      }

      if (value is bool) {
        return value;
      }

      final resolved = value.toString().trim().toLowerCase();
      if (resolved == 'true' || resolved == '1') {
        return true;
      }
      if (resolved == 'false' || resolved == '0') {
        return false;
      }
    }

    return null;
  }
}
