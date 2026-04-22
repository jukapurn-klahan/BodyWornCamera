import 'package:jwt_decoder/jwt_decoder.dart';

import 'user_model.dart';

class LoginModel {
  const LoginModel({
    required this.accessToken,
    required this.refreshToken,
    required this.userInfo,
    required this.jwtPayload,
    required this.iat,
    required this.exp,
  });

  final String accessToken;
  final String refreshToken;
  final UserModel userInfo;
  final Map<String, dynamic> jwtPayload;
  final int? iat;
  final int? exp;

  factory LoginModel.fromJson(
    Map<String, dynamic> json, {
    UserModel? fallbackUser,
    String fallbackRefreshToken = '',
  }) {
    final accessToken = _readString(json, const ['accessToken', 'AccessToken']);
    final decodedPayload = accessToken.isEmpty
        ? const <String, dynamic>{}
        : JwtDecoder.decode(accessToken);
    final jwtPayload = _extractJwtTiming(decodedPayload);
    final userInfoJson = _extractMap(
      json['userInfo'] ?? json['UserInfo'] ?? json['user'] ?? json['User'],
    );
    final resolvedUser = userInfoJson != null
        ? UserModel.fromJson(userInfoJson)
        : (fallbackUser ?? UserModel.fromJson(const <String, dynamic>{}));
    final resolvedRefreshToken = _readString(json, const [
      'refreshToken',
      'RefreshToken',
    ]).trim();

    return LoginModel(
      accessToken: accessToken,
      refreshToken: resolvedRefreshToken.isEmpty
          ? fallbackRefreshToken
          : resolvedRefreshToken,
      userInfo: resolvedUser,
      jwtPayload: jwtPayload,
      iat: _readInt(jwtPayload['iat']),
      exp: _readInt(jwtPayload['exp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'userInfo': userInfo.toJson(),
      'jwtPayload': jwtPayload,
      'iat': iat,
      'exp': exp,
    };
  }

  static String _readString(Map<String, dynamic> json, List<String> keys) {
    for (final key in keys) {
      final value = json[key];
      if (value is String) {
        return value;
      }
    }

    return '';
  }

  static Map<String, dynamic>? _extractMap(dynamic value) {
    if (value is Map) {
      return Map<String, dynamic>.from(value);
    }

    return null;
  }

  static Map<String, dynamic> _extractJwtTiming(Map<String, dynamic> payload) {
    final result = <String, dynamic>{};
    if (payload.containsKey('iat')) {
      result['iat'] = payload['iat'];
    }
    if (payload.containsKey('exp')) {
      result['exp'] = payload['exp'];
    }
    return result;
  }

  static int? _readInt(dynamic value) {
    if (value is int) {
      return value;
    }
    if (value is String) {
      return int.tryParse(value);
    }
    return null;
  }
}
