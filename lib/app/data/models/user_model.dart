class UserModel {
  const UserModel({
    required this.userId,
    required this.username,
    required this.passwordHash,
    required this.roleId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  final int userId;
  final String username;
  final String passwordHash;
  final int roleId;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  bool get isActive => status.toLowerCase() == 'active';

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: _parseInt(json['UserId'] ?? json['userId']),
      username:
          _readString(json, const ['Username', 'username', 'usermame']) ?? '',
      passwordHash:
          (json['PasswordHash'] ?? json['passwordHash']) as String? ?? '',
      roleId: _parseInt(json['RoleId'] ?? json['roleId']),
      status: (json['Status'] ?? json['status']) as String? ?? '',
      createdAt:
          DateTime.tryParse(
            (json['CreatedAt'] ?? json['createdAt']) as String? ?? '',
          ) ??
          DateTime.fromMillisecondsSinceEpoch(0),
      updatedAt:
          DateTime.tryParse(
            (json['UpdatedAt'] ?? json['updatedAt']) as String? ?? '',
          ) ??
          DateTime.fromMillisecondsSinceEpoch(0),
    );
  }

  factory UserModel.fromJwtClaims(
    Map<String, dynamic> claims, {
    UserModel? fallback,
  }) {
    final normalizedClaims = _normalizedJwtClaims(claims);

    return UserModel(
      userId:
          _readInt(normalizedClaims, const ['userId', 'UserId', 'uid', 'id']) ??
          fallback?.userId ??
          0,
      username:
          _readString(normalizedClaims, const [
            'username',
            'Username',
            'userName',
            'usermame',
            'preferred_username',
            'unique_name',
            'name',
          ]) ??
          _readNonNumericString(normalizedClaims['sub']) ??
          fallback?.username ??
          '',
      passwordHash: fallback?.passwordHash ?? '',
      roleId:
          _readInt(normalizedClaims, const ['roleId', 'RoleId', 'rid']) ??
          fallback?.roleId ??
          0,
      status:
          _readString(normalizedClaims, const ['status', 'Status']) ??
          fallback?.status ??
          '',
      createdAt:
          _readDateTime(normalizedClaims, const ['createdAt', 'CreatedAt']) ??
          fallback?.createdAt ??
          DateTime.fromMillisecondsSinceEpoch(0),
      updatedAt:
          _readDateTime(normalizedClaims, const ['updatedAt', 'UpdatedAt']) ??
          fallback?.updatedAt ??
          DateTime.fromMillisecondsSinceEpoch(0),
    );
  }

  static int _parseInt(dynamic value) {
    if (value is int) {
      return value;
    }
    if (value is String) {
      return int.tryParse(value) ?? 0;
    }
    return 0;
  }

  static int? _readInt(Map<String, dynamic> json, List<String> keys) {
    for (final key in keys) {
      final value = json[key];
      if (value == null) {
        continue;
      }

      final parsed = _parseInt(value);
      if (parsed != 0 || value.toString() == '0') {
        return parsed;
      }
    }

    return null;
  }

  static String? _readString(Map<String, dynamic> json, List<String> keys) {
    for (final key in keys) {
      final value = _stringOrNull(json[key]);
      if (value != null) {
        return value;
      }
    }

    return null;
  }

  static String? _readNonNumericString(dynamic value) {
    final stringValue = _stringOrNull(value);
    if (stringValue == null) {
      return null;
    }

    return int.tryParse(stringValue) == null ? stringValue : null;
  }

  static String? _stringOrNull(dynamic value) {
    if (value == null) {
      return null;
    }

    if (value is String) {
      final trimmed = value.trim();
      return trimmed.isEmpty ? null : trimmed;
    }

    final trimmed = value.toString().trim();
    return trimmed.isEmpty ? null : trimmed;
  }

  static DateTime? _readDateTime(Map<String, dynamic> json, List<String> keys) {
    for (final key in keys) {
      final value = json[key];
      if (value is! String || value.trim().isEmpty) {
        continue;
      }

      final parsed = DateTime.tryParse(value);
      if (parsed != null) {
        return parsed;
      }
    }

    return null;
  }

  static Map<String, dynamic> _normalizedJwtClaims(
    Map<String, dynamic> claims,
  ) {
    final normalizedClaims = Map<String, dynamic>.from(claims);

    for (final key in const ['userInfo', 'UserInfo', 'user', 'User']) {
      final nested = claims[key];
      if (nested is Map) {
        normalizedClaims.addAll(Map<String, dynamic>.from(nested));
      }
    }

    return normalizedClaims;
  }

  Map<String, dynamic> toJson() {
    return {
      'UserId': userId,
      'Username': username,
      'PasswordHash': passwordHash,
      'RoleId': roleId,
      'Status': status,
      'CreatedAt': createdAt.toIso8601String(),
      'UpdatedAt': updatedAt.toIso8601String(),
    };
  }
}
