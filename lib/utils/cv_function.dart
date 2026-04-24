// ignore_for_file: camel_case_types

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:android_id/android_id.dart';
import 'package:body_camera/app/config/api_config.dart';
import 'package:body_camera/app/routes/app_pages.dart';
import 'package:body_camera/app/data/models/login_response_model.dart';
import 'package:body_camera/fcm/notification_services.dart';
import 'package:body_camera/utils/config.dart';
import 'package:body_camera/utils/storage_utils.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class cv_func {
  cv_func._();

  static final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();
  static const Duration _defaultRequestTimeout = Duration(seconds: 10);
  static const Duration _defaultAccessTokenRefreshThreshold = Duration.zero;
  static Future<void>? _refreshInFlight;
  static Future<void>? _logoutInFlight;

  static Future<String> getDevice() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (Platform.isAndroid) {
      final androidInfo = await _deviceInfo.androidInfo;
      final deviceId = await AndroidId().getId() ?? '';

      await prefs.setString(GetData.os_version, androidInfo.version.release);
      await prefs.setString(GetData.device_brand, androidInfo.brand);
      await prefs.setString(GetData.device_name, androidInfo.device);
      await prefs.setString(GetData.device_model, androidInfo.model);
      await prefs.setString(GetData.device_id, deviceId);

      log(
        'platform=Android, osVersion=${androidInfo.version.release}, brand=${androidInfo.brand}, device=${androidInfo.device}, model=${androidInfo.model}, deviceId=$deviceId',
        name: 'cv_func.getDevice',
      );
      return deviceId;
    } else if (Platform.isIOS) {
      final iosInfo = await _deviceInfo.iosInfo;
      final deviceId = iosInfo.identifierForVendor ?? '';

      await prefs.setString(GetData.os_version, iosInfo.systemVersion);
      await prefs.setString(GetData.device_brand, 'Apple');
      await prefs.setString(GetData.device_name, iosInfo.name);
      await prefs.setString(GetData.device_model, iosInfo.utsname.machine);
      await prefs.setString(GetData.device_id, deviceId);

      log(
        'platform=iOS, osVersion=${iosInfo.systemVersion}, brand=Apple, device=${iosInfo.name}, model=${iosInfo.utsname.machine}, deviceId=$deviceId',
        name: 'cv_func.getDevice',
      );
      return deviceId;
    }

    return '';
  }

  static Future<String> getDeviceId() async {
    final prefs = await SharedPreferences.getInstance();
    final storedDeviceId =
        prefs.getString(GetData.device_id)?.trim() ??
        prefs.getString(GetData.macaddress)?.trim() ??
        '';

    if (storedDeviceId.isNotEmpty) {
      return storedDeviceId;
    }

    final deviceId = await getDevice();
    if (deviceId.isNotEmpty) {
      return deviceId;
    }

    return prefs.getString(GetData.device_id)?.trim() ??
        prefs.getString(GetData.macaddress)?.trim() ??
        '';
  }

  static Future<String> getValidAccessToken({
    Duration threshold = _defaultAccessTokenRefreshThreshold,
    bool swallowRefreshErrors = false,
    Duration refreshTimeout = _defaultRequestTimeout,
  }) async {
    await refreshAccessTokenIfNeeded(
      threshold: threshold,
      swallowErrors: swallowRefreshErrors,
      timeout: refreshTimeout,
    );
    return GetData.getAccessTokenValue();
  }

  static Future<void> refreshAccessTokenIfNeeded({
    Duration threshold = _defaultAccessTokenRefreshThreshold,
    bool swallowErrors = false,
    Duration timeout = _defaultRequestTimeout,
  }) async {
    try {
      await _refreshAccessTokenIfNeeded(threshold: threshold, timeout: timeout);
    } on CvFunctionException {
      if (!swallowErrors) {
        rethrow;
      }


      return;
    }
  }

  static Future<void> _refreshAccessTokenIfNeeded({
    required Duration threshold,
    required Duration timeout,
  }) async {
    final accessToken = await GetData.getAccessTokenValue();
    if (!_shouldRefreshAccessToken(
      accessToken: accessToken,
      threshold: threshold,
    )) {
      return;
    }

    final inFlightRefresh = _refreshInFlight;
    if (inFlightRefresh != null) {
      await inFlightRefresh;
      return;
    }

    final refreshToken = await GetData.getRefreshTokenValue();
    if (refreshToken.isEmpty) {
      await _logoutAndRedirectToLogin(
        reason: 'Missing refresh token while access token requires refresh.',
      );
      throw const CvFunctionException(
        'ไม่พบ refresh token กรุณาเข้าสู่ระบบใหม่',
      );
    }

    final latestInFlightRefresh = _refreshInFlight;
    if (latestInFlightRefresh != null) {
      await latestInFlightRefresh;
      return;
    }

    final refreshFuture = () async {
      await refreshAccessToken(refreshToken: refreshToken, timeout: timeout);
    }();

    _refreshInFlight = refreshFuture;
    try {
      await refreshFuture;
    } finally {
      if (identical(_refreshInFlight, refreshFuture)) {
        _refreshInFlight = null;
      }
    }
  }

  static Future<void> refreshAccessToken({
    required String refreshToken,
    Duration timeout = _defaultRequestTimeout,
  }) async {
    final trimmedRefreshToken = refreshToken.trim();
    if (trimmedRefreshToken.isEmpty) {
      throw const CvFunctionException(
        'ไม่พบ refresh token สำหรับการรีเฟรช access token',
      );
    }

    dynamic decoded;
    try {
      decoded = await postApiData(
        ApiConfig.refreshUrl,
        body: {'isMobile': true, 'refreshToken': trimmedRefreshToken},
        timeout: timeout,
        includeAccessToken: false,
      );
    } on CvFunctionException catch (error) {
      if (_shouldLogoutAfterRefreshFailure(error)) {
        await _logoutAndRedirectToLogin(reason: error.message);
        throw const CvFunctionException(
          'refresh token ใช้งานไม่ได้หรือหมดอายุ กรุณาเข้าสู่ระบบใหม่',
        );
      }
      rethrow;
    }
    if (decoded == null) {
      throw const CvFunctionException('รูปแบบข้อมูลจากระบบไม่ถูกต้อง: <empty>');
    }

    final refreshJson = _extractLoginResponseMap(decoded);
    if (refreshJson == null) {
      throw CvFunctionException(
        'รูปแบบข้อมูลจากระบบไม่ถูกต้อง: ${_compactBody(_stringifyDecoded(decoded))}',
      );
    }

    final currentUser = await StorageUtils.getCurrentUser();

    late final LoginModel refreshResponse;
    try {
      refreshResponse = LoginModel.fromJson(
        refreshJson,
        fallbackUser: currentUser,
        fallbackRefreshToken: trimmedRefreshToken,
      );
    } on FormatException catch (error) {
      throw CvFunctionException(
        'รูปแบบ accessToken ไม่ถูกต้อง: ${error.message}',
      );
    }

    if (refreshResponse.accessToken.isEmpty) {
      throw CvFunctionException(
        'ข้อมูลตอบกลับจากระบบไม่ครบถ้วน: ${_compactBody(_stringifyDecoded(decoded))}',
      );
    }

    await GetData.saveAuthenticatedSession(
      accessTokenValue: refreshResponse.accessToken,
      refreshTokenValue: refreshResponse.refreshToken,
      user: refreshResponse.userInfo,
    );

    log(
      'Access token refreshed: iat=${refreshResponse.iat}, exp=${refreshResponse.exp}',
      name: 'cv_func.refreshAccessTokenIfNeeded',
    );
  }

  static Future<dynamic> getApiData(
    String url, {
    Duration timeout = _defaultRequestTimeout,
    Map<String, String> extraHeaders = const {},
    bool includeAccessToken = true,
  }) async {
    final trimmedUrl = url.trim();
    if (trimmedUrl.isEmpty) {
      throw const CvFunctionException('กรุณาระบุ URL สำหรับเรียก API');
    }

    final uri = Uri.tryParse(trimmedUrl);
    if (uri == null || !uri.hasScheme) {
      throw CvFunctionException('URL ไม่ถูกต้อง: $trimmedUrl');
    }

    final accessToken = includeAccessToken
        ? await getValidAccessToken(refreshTimeout: timeout)
        : '';
    final headers = <String, String>{
      'Accept': 'application/json',
      if (includeAccessToken && accessToken.isNotEmpty)
        'Authorization': 'Bearer $accessToken',
    };
    headers.addAll(extraHeaders);

    http.Response response;
    try {
      response = await http.get(uri, headers: headers).timeout(timeout);
    } on TimeoutException {
      throw CvFunctionException(
        'เซิร์ฟเวอร์ไม่ตอบกลับภายใน ${timeout.inSeconds} วินาที',
      );
    } on SocketException {
      throw const CvFunctionException(
        'ไม่สามารถเชื่อมต่อเซิร์ฟเวอร์ได้ กรุณาตรวจสอบเครือข่ายหรือ API URL',
      );
    } on http.ClientException catch (error) {
      throw CvFunctionException(error.message);
    }

    final decoded = _decodeJson(response.body);
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw CvFunctionException(
        _extractErrorMessage(decoded) ??
            'โหลดข้อมูลไม่สำเร็จ (HTTP ${response.statusCode})',
        statusCode: response.statusCode,
      );
    }

    log(
      'GET $trimmedUrl -> ${response.statusCode}',
      name: 'cv_func.getApiData',
    );

    if (decoded != null) {
      return decoded;
    }

    final body = response.body.trim();
    return body.isEmpty ? null : body;
  }

  static Future<dynamic> postApiData(
    String url, {
    dynamic body,
    Duration timeout = _defaultRequestTimeout,
    Map<String, String> extraHeaders = const {},
    bool includeAccessToken = false,
  }) async {
    final trimmedUrl = url.trim();
    if (trimmedUrl.isEmpty) {
      throw const CvFunctionException('กรุณาระบุ URL สำหรับเรียก API');
    }

    final uri = Uri.tryParse(trimmedUrl);
    if (uri == null || !uri.hasScheme) {
      throw CvFunctionException('URL ไม่ถูกต้อง: $trimmedUrl');
    }

    final accessToken = includeAccessToken
        ? await getValidAccessToken(refreshTimeout: timeout)
        : '';
    final headers = <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      if (includeAccessToken && accessToken.isNotEmpty)
        'Authorization': 'Bearer $accessToken',
    };
    headers.addAll(extraHeaders);

    http.Response response;
    try {
      response = await http
          .post(uri, headers: headers, body: _encodeRequestBody(body))
          .timeout(timeout);
    } on TimeoutException {
      throw CvFunctionException(
        'เซิร์ฟเวอร์ไม่ตอบกลับภายใน ${timeout.inSeconds} วินาที',
      );
    } on SocketException {
      throw const CvFunctionException(
        'ไม่สามารถเชื่อมต่อเซิร์ฟเวอร์ได้ กรุณาตรวจสอบเครือข่ายหรือ API URL',
      );
    } on http.ClientException catch (error) {
      throw CvFunctionException(error.message);
    }

    final decoded = _decodeJson(response.body);
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw CvFunctionException(
        _extractErrorMessage(decoded) ??
            'ส่งข้อมูลไม่สำเร็จ (HTTP ${response.statusCode})',
        statusCode: response.statusCode,
      );
    }

    log(
      'POST $trimmedUrl -> ${response.statusCode}',
      name: 'cv_func.postApiData',
    );

    if (decoded != null) {
      return decoded;
    }

    final responseBody = response.body.trim();
    return responseBody.isEmpty ? null : responseBody;
  }

  static bool _shouldRefreshAccessToken({
    required String accessToken,
    required Duration threshold,
  }) {
    if (accessToken.isEmpty) {
      return true;
    }

    try {
      if (JwtDecoder.isExpired(accessToken)) {
        return true;
      }

      return JwtDecoder.getRemainingTime(accessToken) <= threshold;
    } catch (_) {
      return true;
    }
  }

  static bool _shouldLogoutAfterRefreshFailure(CvFunctionException error) {
    final statusCode = error.statusCode;
    if (statusCode != null && statusCode >= 400 && statusCode < 500) {
      return true;
    }

    final message = error.message.toLowerCase();
    return message.contains('refresh') ||
        message.contains('token') ||
        message.contains('unauthorized') ||
        message.contains('expired') ||
        message.contains('หมดอายุ');
  }

  static Future<void> _logoutAndRedirectToLogin({String? reason}) async {
    final inFlightLogout = _logoutInFlight;
    if (inFlightLogout != null) {
      await inFlightLogout;
      return;
    }

    final logoutFuture = () async {
      log(
        'Session expired. Logging out and navigating to login. ${reason ?? ''}'
            .trim(),
        name: 'cv_func.logoutAndRedirectToLogin',
      );

      try {
        await NotificationServices.instance.clearSessionData();
      } catch (error, stackTrace) {
        log(
          'Failed to clear notification session data.',
          name: 'cv_func.logoutAndRedirectToLogin',
          error: error,
          stackTrace: stackTrace,
        );
      }

      await StorageUtils.clearAuthenticatedSession();
      await GetData.clearSessionForReLogin(preserveUsername: true);

      if (Get.key.currentState != null && Get.currentRoute != Routes.LOGIN) {
        await Get.offAllNamed(Routes.LOGIN);
      }
    }();

    _logoutInFlight = logoutFuture;
    try {
      await logoutFuture;
    } finally {
      if (identical(_logoutInFlight, logoutFuture)) {
        _logoutInFlight = null;
      }
    }
  }

  static Map<String, dynamic>? _extractLoginResponseMap(dynamic decoded) {
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

  static bool _looksLikeLoginResponseJson(Map<String, dynamic> json) {
    return json.containsKey('accessToken') ||
        json.containsKey('AccessToken') ||
        json.containsKey('refreshToken') ||
        json.containsKey('RefreshToken') ||
        json.containsKey('userInfo') ||
        json.containsKey('UserInfo');
  }

  static String? _extractErrorMessage(dynamic decoded) {
    if (decoded is! Map) {
      return null;
    }

    final json = Map<String, dynamic>.from(decoded);
    final message =
        json['message'] ??
        json['Message'] ??
        json['msg'] ??
        json['error'] ??
        json['detail'];
    return message is String && message.trim().isNotEmpty ? message : null;
  }

  static dynamic _decodeJson(String body) {
    if (body.isEmpty) {
      return null;
    }

    try {
      return jsonDecode(body);
    } catch (_) {
      return null;
    }
  }

  static String _stringifyDecoded(dynamic decoded) {
    if (decoded == null) {
      return '<empty>';
    }
    if (decoded is String) {
      return decoded;
    }

    return jsonEncode(decoded);
  }

  static String? _encodeRequestBody(dynamic body) {
    if (body == null) {
      return null;
    }

    if (body is String) {
      return body;
    }

    return jsonEncode(body);
  }

  static String _compactBody(String body) {
    final compact = body.replaceAll(RegExp(r'\s+'), ' ').trim();
    if (compact.isEmpty) {
      return '<empty>';
    }

    return compact.length > 180 ? '${compact.substring(0, 180)}...' : compact;
  }
}

class CvFunctionException implements Exception {
  const CvFunctionException(this.message, {this.statusCode});

  final String message;
  final int? statusCode;

  @override
  String toString() => 'CvFunctionException: $message';
}
