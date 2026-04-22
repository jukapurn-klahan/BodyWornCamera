import 'dart:convert';
import 'dart:developer';

import 'package:body_camera/app/config/api_config.dart';
import 'package:body_camera/app/data/models/activity_report_model.dart';
import 'package:body_camera/app/data/models/login_response_model.dart';
import 'package:body_camera/app/data/models/role_master_data_model.dart';
import 'package:body_camera/app/data/models/user_model.dart';
import 'package:body_camera/utils/cv_function.dart';

class UserApiService {
  UserApiService({Duration? requestTimeout})
    : _requestTimeout = requestTimeout ?? const Duration(seconds: 10);

  final Duration _requestTimeout;

  Future<LoginModel> login({
    required String username,
    required String password,
    String deviceId = '',
  }) async {
    final decoded = await _postApiData(
      ApiConfig.loginUrl,
      body: {
        'username': username,
        'password': password,
        'deviceId': deviceId,
        'isMobile': true,
      },
      includeAccessToken: false,
    );
    if (decoded == null) {
      throw const UserApiException('รูปแบบข้อมูลจากระบบไม่ถูกต้อง: <empty>');
    }

    final loginJson = _extractLoginResponseMap(decoded);
    if (loginJson == null) {
      throw UserApiException(
        'รูปแบบข้อมูลจากระบบไม่ถูกต้อง: ${_compactBody(_stringifyDecoded(decoded))}',
      );
    }

    late final LoginModel loginResponse;
    try {
      loginResponse = LoginModel.fromJson(loginJson);
    } on FormatException catch (error) {
      throw UserApiException('รูปแบบ accessToken ไม่ถูกต้อง: ${error.message}');
    }
    if (loginResponse.accessToken.isEmpty ||
        loginResponse.refreshToken.isEmpty) {
      throw UserApiException(
        'ข้อมูลตอบกลับจากระบบไม่ครบถ้วน: ${_compactBody(_stringifyDecoded(decoded))}',
      );
    }

    return loginResponse;
  }

  Future<LoginModel> refresh({
    required String refreshToken,
    UserModel? fallbackUser,
  }) async {
    log('refreshToken : $refreshToken');
    final decoded = await _postApiData(
      ApiConfig.refreshUrl,
      body: {'isMobile': true, 'refreshToken': refreshToken},
      includeAccessToken: false,
    );
    if (decoded == null) {
      throw const UserApiException('รูปแบบข้อมูลจากระบบไม่ถูกต้อง: <empty>');
    }

    final refreshJson = _extractLoginResponseMap(decoded);
    if (refreshJson == null) {
      throw UserApiException(
        'รูปแบบข้อมูลจากระบบไม่ถูกต้อง: ${_compactBody(_stringifyDecoded(decoded))}',
      );
    }

    late final LoginModel refreshResponse;
    try {
      refreshResponse = LoginModel.fromJson(
        refreshJson,
        fallbackUser: fallbackUser,
        fallbackRefreshToken: refreshToken,
      );
    } on FormatException catch (error) {
      throw UserApiException('รูปแบบ accessToken ไม่ถูกต้อง: ${error.message}');
    }
    if (refreshResponse.accessToken.isEmpty) {
      throw UserApiException(
        'ข้อมูลตอบกลับจากระบบไม่ครบถ้วน: ${_compactBody(_stringifyDecoded(decoded))}',
      );
    }

    return refreshResponse;
  }

  Future<void> logout({required String refreshToken}) async {
    final decoded = await _postApiData(
      ApiConfig.logoutUrl,
      body: {'isMobile': true, 'refreshToken': refreshToken},
      includeAccessToken: false,
    );
    log('logout response : $decoded');
  }

  Future<List<UserModel>> getAllUsers() async {
    final decoded = await _getApiData(ApiConfig.getAllUsersUrl);
    if (decoded is! List) {
      throw const UserApiException(
        'Invalid response format. Expected a JSON array.',
      );
    }

    return decoded
        .map(
          (item) => UserModel.fromJson(Map<String, dynamic>.from(item as Map)),
        )
        .toList();
  }

  Future<List<RoleModel>> getRoles() async {
    final decoded = await _getApiData(ApiConfig.getRolesUrl);
    final rolesJson = _extractDataList(decoded);
    if (rolesJson == null) {
      throw UserApiException(
        'รูปแบบข้อมูล role master data ไม่ถูกต้อง: ${_compactBody(jsonEncode(decoded))}',
      );
    }

    return rolesJson.map(RoleModel.fromJson).toList(growable: false);
  }

  Future<List<ActivityReportModel>> getReports() async {
    final decoded = await _getApiData(ApiConfig.getReportUrl);
    final reportsJson = _extractDataList(decoded);
    if (reportsJson == null) {
      throw UserApiException(
        'รูปแบบข้อมูลรายการกิจกรรมไม่ถูกต้อง: ${_compactBody(_stringifyDecoded(decoded))}',
      );
    }

    return reportsJson
        .map(ActivityReportModel.fromJson)
        .toList(growable: false);
  }

  void dispose() {
    // No-op. Network calls go through cv_func helpers.
  }

  Future<dynamic> _getApiData(String url) async {
    try {
      return await cv_func.getApiData(url, timeout: _requestTimeout);
    } on CvFunctionException catch (error) {
      throw UserApiException(error.message);
    }
  }

  Future<dynamic> _postApiData(
    String url, {
    dynamic body,
    bool includeAccessToken = false,
  }) async {
    try {
      return await cv_func.postApiData(
        url,
        body: body,
        timeout: _requestTimeout,
        includeAccessToken: includeAccessToken,
      );
    } on CvFunctionException catch (error) {
      throw UserApiException(error.message);
    }
  }

  Map<String, dynamic>? _extractLoginResponseMap(dynamic decoded) {
    if (decoded is! Map) {
      return null;
    }

    final json = Map<String, dynamic>.from(decoded);
    if (_looksLikeLoginResponseJson(json)) {
      return json;
    }

    final data = json['data'];
    if (data is Map) {
      final dataMap = Map<String, dynamic>.from(data);
      if (_looksLikeLoginResponseJson(dataMap)) {
        return dataMap;
      }
    }

    final result = json['result'];
    if (result is Map) {
      final resultMap = Map<String, dynamic>.from(result);
      if (_looksLikeLoginResponseJson(resultMap)) {
        return resultMap;
      }
    }

    return null;
  }

  List<Map<String, dynamic>>? _extractDataList(dynamic decoded) {
    if (decoded is List) {
      return decoded
          .whereType<Map>()
          .map((item) => Map<String, dynamic>.from(item))
          .toList(growable: false);
    }

    if (decoded is! Map) {
      return null;
    }

    final json = Map<String, dynamic>.from(decoded);
    final data =
        json['data'] ?? json['Data'] ?? json['result'] ?? json['Result'];
    if (data is! List) {
      return null;
    }

    return data
        .whereType<Map>()
        .map((item) => Map<String, dynamic>.from(item))
        .toList(growable: false);
  }

  bool _looksLikeLoginResponseJson(Map<String, dynamic> json) {
    return json.containsKey('accessToken') ||
        json.containsKey('AccessToken') ||
        json.containsKey('refreshToken') ||
        json.containsKey('RefreshToken') ||
        json.containsKey('userInfo') ||
        json.containsKey('UserInfo');
  }

  String _stringifyDecoded(dynamic decoded) {
    if (decoded == null) {
      return '<empty>';
    }
    if (decoded is String) {
      return decoded;
    }
    return jsonEncode(decoded);
  }

  String _compactBody(String body) {
    final compact = body.replaceAll(RegExp(r'\s+'), ' ').trim();
    if (compact.isEmpty) {
      return '<empty>';
    }
    return compact.length > 180 ? '${compact.substring(0, 180)}...' : compact;
  }
}

class UserApiException implements Exception {
  const UserApiException(this.message);

  final String message;

  @override
  String toString() => 'UserApiException: $message';
}
