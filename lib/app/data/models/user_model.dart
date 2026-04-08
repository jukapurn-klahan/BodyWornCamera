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
      username: (json['Username'] ?? json['username']) as String? ?? '',
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

  static int _parseInt(dynamic value) {
    if (value is int) {
      return value;
    }
    if (value is String) {
      return int.tryParse(value) ?? 0;
    }
    return 0;
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
