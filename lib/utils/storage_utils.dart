import 'dart:convert';

import 'package:body_camera/app/data/models/role_master_data_model.dart';
import 'package:body_camera/app/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageUtils {
  StorageUtils._();

  static const String userPinCodeKey = 'user_pin_code';
  static const String pinCodeOwnerUsernameKey = 'pin_code_owner_username';
  static const String authenticatedSessionKey = 'authenticated_session';
  static const String biometricEnabledKey = 'biometric_enabled';
  static const String rememberLoginKey = 'remember_login';
  static const String rememberedUsernameKey = 'remembered_username';
  static const String rememberedPasswordKey = 'remembered_password';
  static const String accessTokenKey = 'access_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String currentUserKey = 'current_user';
  static const String roleMasterDataKey = 'role_master_data';
  static SharedPreferences? _prefs;

  static Future<SharedPreferences> _instance() async {
    return _prefs ??= await SharedPreferences.getInstance();
  }

  static Future<void> setPinCode(String pinCode) async {
    final prefs = await _instance();
    await prefs.setString(userPinCodeKey, pinCode);
  }

  static Future<void> setPinCodeOwnerUsername(String username) async {
    final prefs = await _instance();
    final normalizedUsername = username.trim();

    if (normalizedUsername.isEmpty) {
      await prefs.remove(pinCodeOwnerUsernameKey);
      return;
    }

    await prefs.setString(pinCodeOwnerUsernameKey, normalizedUsername);
  }

  static Future<String?> getPinCode() async {
    final prefs = await _instance();
    return prefs.getString(userPinCodeKey);
  }

  static Future<String?> getPinCodeOwnerUsername() async {
    final prefs = await _instance();
    final username = prefs.getString(pinCodeOwnerUsernameKey)?.trim();

    if (username == null || username.isEmpty) {
      return null;
    }

    return username;
  }

  static Future<bool> hasPinCode() async {
    final prefs = await _instance();
    final pinCode = prefs.getString(userPinCodeKey);
    return pinCode != null && pinCode.isNotEmpty;
  }

  static Future<void> setAuthenticatedSession(bool value) async {
    final prefs = await _instance();
    await prefs.setBool(authenticatedSessionKey, value);
  }

  static Future<void> setAccessToken(String value) async {
    final prefs = await _instance();
    await prefs.setString(accessTokenKey, value);
  }

  static Future<String?> getAccessToken() async {
    final prefs = await _instance();
    return prefs.getString(accessTokenKey);
  }

  static Future<void> setRefreshToken(String value) async {
    final prefs = await _instance();
    await prefs.setString(refreshTokenKey, value);
  }

  static Future<String?> getRefreshToken() async {
    final prefs = await _instance();
    return prefs.getString(refreshTokenKey);
  }

  static Future<void> setCurrentUser(UserModel user) async {
    final prefs = await _instance();
    await prefs.setString(currentUserKey, jsonEncode(user.toJson()));
  }

  static Future<UserModel?> getCurrentUser() async {
    final prefs = await _instance();
    final rawUser = prefs.getString(currentUserKey);
    if (rawUser == null || rawUser.isEmpty) {
      return null;
    }

    try {
      final decoded = jsonDecode(rawUser);
      if (decoded is Map) {
        return UserModel.fromJson(Map<String, dynamic>.from(decoded));
      }
    } catch (_) {
      return null;
    }

    return null;
  }

  static Future<void> saveRoleMasterData(List<RoleModel> roles) async {
    final prefs = await _instance();
    await prefs.setString(
      roleMasterDataKey,
      jsonEncode(roles.map((role) => role.toJson()).toList()),
    );
  }

  static Future<List<RoleModel>> getRoleMasterData() async {
    final prefs = await _instance();
    final rawData = prefs.getString(roleMasterDataKey);
    if (rawData == null || rawData.isEmpty) {
      return const <RoleModel>[];
    }

    try {
      final decoded = jsonDecode(rawData);
      if (decoded is! List) {
        return const <RoleModel>[];
      }

      return decoded
          .whereType<Map>()
          .map((item) => RoleModel.fromJson(Map<String, dynamic>.from(item)))
          .toList(growable: false);
    } catch (_) {
      return const <RoleModel>[];
    }
  }

  static Future<RoleModel?> getRoleMasterDataById(int roleId) async {
    final roles = await getRoleMasterData();
    for (final role in roles) {
      if (role.roleId == roleId) {
        return role;
      }
    }
    return null;
  }

  static Future<void> setBiometricEnabled(bool value) async {
    final prefs = await _instance();
    await prefs.setBool(biometricEnabledKey, value);
  }

  static Future<void> setRememberLogin(bool value) async {
    final prefs = await _instance();
    await prefs.setBool(rememberLoginKey, value);
  }

  static Future<bool> isRememberLoginEnabled() async {
    final prefs = await _instance();
    return prefs.getBool(rememberLoginKey) ?? false;
  }

  static Future<void> setRememberedUsername(String username) async {
    final prefs = await _instance();
    await prefs.setString(rememberedUsernameKey, username);
  }

  static Future<String?> getRememberedUsername() async {
    final prefs = await _instance();
    return prefs.getString(rememberedUsernameKey);
  }

  static Future<void> setRememberedPassword(String password) async {
    final prefs = await _instance();
    await prefs.setString(rememberedPasswordKey, password);
  }

  static Future<String?> getRememberedPassword() async {
    final prefs = await _instance();
    return prefs.getString(rememberedPasswordKey);
  }

  static Future<void> saveRememberedLogin({
    required String username,
    required String password,
  }) async {
    final prefs = await _instance();
    await prefs.setBool(rememberLoginKey, true);
    await prefs.setString(rememberedUsernameKey, username);
    await prefs.setString(rememberedPasswordKey, password);
  }

  static Future<void> clearRememberedLogin() async {
    final prefs = await _instance();
    await prefs.remove(rememberLoginKey);
    await prefs.remove(rememberedUsernameKey);
    await prefs.remove(rememberedPasswordKey);
  }

  static Future<bool> hasAuthenticatedSession() async {
    final prefs = await _instance();
    return prefs.getBool(authenticatedSessionKey) ?? false;
  }

  static Future<bool> isBiometricEnabled() async {
    final prefs = await _instance();
    return prefs.getBool(biometricEnabledKey) ?? false;
  }

  static Future<void> clearAuthenticatedSession() async {
    final prefs = await _instance();
    await prefs.remove(authenticatedSessionKey);
    await prefs.remove(accessTokenKey);
    await prefs.remove(refreshTokenKey);
    await prefs.remove(currentUserKey);
    await prefs.remove(roleMasterDataKey);
  }

  static Future<void> clearPinCode() async {
    final prefs = await _instance();
    await prefs.remove(userPinCodeKey);
    await prefs.remove(pinCodeOwnerUsernameKey);
  }

  static Future<void> clearAll({bool preserveRememberedLogin = false}) async {
    final prefs = await _instance();
    var shouldRestoreRememberedLogin = false;
    String? rememberedUsername;
    String? rememberedPassword;

    if (preserveRememberedLogin) {
      shouldRestoreRememberedLogin = prefs.getBool(rememberLoginKey) ?? false;
      rememberedUsername = prefs.getString(rememberedUsernameKey);
      rememberedPassword = prefs.getString(rememberedPasswordKey);
    }

    await prefs.clear();

    if (preserveRememberedLogin && shouldRestoreRememberedLogin) {
      await prefs.setBool(rememberLoginKey, true);
      if (rememberedUsername != null) {
        await prefs.setString(rememberedUsernameKey, rememberedUsername);
      }
      if (rememberedPassword != null) {
        await prefs.setString(rememberedPasswordKey, rememberedPassword);
      }
    }

    _prefs = null;
  }
}
