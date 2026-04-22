class RoleModel {
  const RoleModel({required this.roleId, required this.roleName, required this.securityLevel});

  final int roleId;
  final String roleName;
  final int securityLevel;

  factory RoleModel.fromJson(Map<String, dynamic> json) {
    return RoleModel(
      roleId: _parseInt(json['RoleId'] ?? json['roleId']),
      roleName: (json['RoleName'] ?? json['roleName']) as String? ?? '',
      securityLevel: _parseInt(json['SecurityLevel'] ?? json['securityLevel']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'RoleId': roleId, 'RoleName': roleName, 'SecurityLevel': securityLevel};
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
}
