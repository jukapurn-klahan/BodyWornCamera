import 'package:shared_preferences/shared_preferences.dart';

class StorageUtils {
  StorageUtils._();

  static const String userPinCodeKey = 'user_pin_code';
  static const String authenticatedSessionKey = 'authenticated_session';
  static const String biometricEnabledKey = 'biometric_enabled';
  static const String rememberLoginKey = 'remember_login';
  static const String rememberedUsernameKey = 'remembered_username';
  static const String rememberedPasswordKey = 'remembered_password';
  static SharedPreferences? _prefs;

  static Future<SharedPreferences> _instance() async {
    return _prefs ??= await SharedPreferences.getInstance();
  }

  static Future<void> setPinCode(String pinCode) async {
    final prefs = await _instance();
    await prefs.setString(userPinCodeKey, pinCode);
  }

  static Future<String?> getPinCode() async {
    final prefs = await _instance();
    return prefs.getString(userPinCodeKey);
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
  }

  static Future<void> clearPinCode() async {
    final prefs = await _instance();
    await prefs.remove(userPinCodeKey);
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
