import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:body_camera/app/config/api_config.dart';
import 'package:body_camera/app/data/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserApiService {
  UserApiService({http.Client? client, Duration? requestTimeout})
    : _client = client ?? http.Client(),
      _requestTimeout = requestTimeout ?? const Duration(seconds: 10);

  final http.Client _client;
  final Duration _requestTimeout;

  Future<UserModel?> login({required String username, required String passwordHash}) async {
    http.Response response;
    try {
      response = await _client
          .post(
            ApiConfig.loginUri,
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({'username': username, 'passwordHash': passwordHash}),
          )
          .timeout(_requestTimeout);
    } on TimeoutException {
      throw UserApiException('เซิร์ฟเวอร์ไม่ตอบกลับภายใน ${_requestTimeout.inSeconds} วินาที');
    } on SocketException {
      throw const UserApiException('ไม่สามารถเชื่อมต่อเซิร์ฟเวอร์ได้ กรุณาตรวจสอบเครือข่ายหรือ API URL');
    } on http.ClientException catch (error) {
      throw UserApiException(error.message);
    }

    final decoded = _decodeJson(response.body);
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw UserApiException(_extractErrorMessage(decoded) ?? 'เข้าสู่ระบบไม่สำเร็จ (HTTP ${response.statusCode})');
    }

    if (decoded == null) {
      return null;
    }

    final userJson = _extractUserMap(decoded);
    if (userJson == null) {
      throw UserApiException('รูปแบบข้อมูลจากระบบไม่ถูกต้อง: ${_compactBody(response.body)}');
    }

    return UserModel.fromJson(userJson);
  }

  Future<List<UserModel>> getAllUsers() async {
    final response = await _client.get(ApiConfig.getAllUsersUri);

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw UserApiException('Failed to load users. Status code: ${response.statusCode}');
    }

    final decoded = jsonDecode(response.body);
    if (decoded is! List) {
      throw const UserApiException('Invalid response format. Expected a JSON array.');
    }

    return decoded.map((item) => UserModel.fromJson(Map<String, dynamic>.from(item as Map))).toList();
  }

  void dispose() {
    _client.close();
  }

  Map<String, dynamic>? _extractUserMap(dynamic decoded) {
    if (decoded is! Map) {
      return null;
    }

    final json = Map<String, dynamic>.from(decoded);
    if (_looksLikeUserJson(json)) {
      return json;
    }

    final data = json['data'];
    if (data is Map) {
      final dataMap = Map<String, dynamic>.from(data);
      if (_looksLikeUserJson(dataMap)) {
        return dataMap;
      }
    }

    final user = json['user'];
    if (user is Map) {
      final userMap = Map<String, dynamic>.from(user);
      if (_looksLikeUserJson(userMap)) {
        return userMap;
      }
    }

    return null;
  }

  bool _looksLikeUserJson(Map<String, dynamic> json) {
    return json.containsKey('UserId') || json.containsKey('Username') || json.containsKey('userId') || json.containsKey('username');
  }

  String? _extractErrorMessage(dynamic decoded) {
    if (decoded is! Map) {
      return null;
    }

    final json = Map<String, dynamic>.from(decoded);
    final message = json['message'] ?? json['error'] ?? json['detail'];
    return message is String && message.trim().isNotEmpty ? message : null;
  }

  dynamic _decodeJson(String body) {
    if (body.isEmpty) {
      return null;
    }

    try {
      return jsonDecode(body);
    } catch (_) {
      return null;
    }
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
