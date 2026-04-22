import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as image;

import 'package:body_camera/app/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

import 'storage_utils.dart';

class GetData {
  static bool isValidPhoneNumber(String phoneNumber) {
    final RegExp regex = RegExp(r'^0\d{9}$');
    return regex.hasMatch(phoneNumber);
  }

  // static String MD5(String input) {
  //   var md5En = md5.convert(utf8.encode(input)).toString().toLowerCase();
  //   return md5En;
  // }

  // static String SHA256(String input) {
  //   var SHA256En = sha256.convert(utf8.encode(input + 'royalthaipolice4.0!@#\$%')).toString().toLowerCase();
  //   return SHA256En;
  // }

  Future<Map<String, dynamic>> DeviceInfo() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    final deviceInfo = await deviceInfoPlugin.deviceInfo;
    return deviceInfo.data;
  }

  static String userId = "user_id";
  static String usermame = "user_mame";
  static String RoleId = "role_id";

  static String os_version = "os_version";
  static String device_brand = "device_brand";
  static String device_name = "device_name";
  static String device_model = "device_model";
  static String device_id = "device_id";
  static String macaddress = "macaddress";

  static String accessToken = "accessToken";
  static String refreshToken = "refreshToken";

  //otp
  static String motp_key = "app_key_police";
  static String motp_secret = "app_secret_police";
  static String motp_lasttime = "app_otp_lasttime";
  static String motp_token_data = "app_otp_token_data";
  static String motp_token_phone = "app_otp_phone";

  static bool UserLoginActive = false;

  //cache
  static String mobile_cache_version = "mobile_cache_version";
  static String mobile_cache_update = "mobile_cache_update";
  static String mobile_data_cache_update = "mobile_data_cache_update";

  //tracking
  static String mReceiveLocation = "mReceiveLocation";

  //licenseplate
  static String mchk_licenseplate = "mchk_licenseplate";

  Future<void> resetUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(userId, 0);
    //  await prefs.setString(mlocalcode, "");
    await prefs.setString(usermame, "");
    await prefs.setInt(RoleId, 0);
    await prefs.setString(accessToken, "");
    await prefs.setString(refreshToken, "");
    UserLoginActive = false;

    await prefs.setString(os_version, "");
    await prefs.setString(device_brand, "");
    await prefs.setString(device_name, "");
    await prefs.setString(device_model, "");
    await prefs.setString(device_id, "");
    await prefs.setString(macaddress, "");
  }

  static Future<void> clearSessionForReLogin({
    bool preserveUsername = true,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final preservedUsername = preserveUsername
        ? prefs.getString(usermame)?.trim() ?? ''
        : '';

    await prefs.setInt(userId, 0);
    await prefs.setString(usermame, preservedUsername);
    await prefs.setInt(RoleId, 0);
    await prefs.setString(accessToken, "");
    await prefs.setString(refreshToken, "");
    UserLoginActive = false;
  }

  Future<void> userLogOut() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(userId, 0);
    await prefs.setString(usermame, "");
    await prefs.setInt(RoleId, 0);
    await prefs.setString(accessToken, "");
    await prefs.setString(refreshToken, "");
    await prefs.setString(device_id, "");
    UserLoginActive = false;
    // await prefs.setInt(mregister, 0);
    // await prefs.setString(mlocalcode, "");
    // await prefs.setString(mregister_name, "");
    // await prefs.setString(mfirst_name, "");
    // await prefs.setString(mlast_name, "");
    // await prefs.setString(mlocalcode_name, "");
    // await prefs.setString(mtraffy_code, "");
    // await prefs.setInt(mlogin, 0);
    // await prefs.setBool(mlogin_status, false);
    // await prefs.setInt(msign_typegroup, 0);
    // await prefs.setInt(mposition, 0);
  }

  static Future<void> saveLoginSession({
    required int userIdValue,
    required String usernameValue,
    required int roleIdValue,
    required String accessTokenValue,
    required String refreshTokenValue,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(userId, userIdValue);
    await prefs.setString(usermame, usernameValue);
    await prefs.setInt(RoleId, roleIdValue);
    await prefs.setString(accessToken, accessTokenValue);
    await prefs.setString(refreshToken, refreshTokenValue);
    UserLoginActive = true;
  }

  static Future<void> saveAuthenticatedSession({required String accessTokenValue, required String refreshTokenValue, required UserModel user}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(StorageUtils.authenticatedSessionKey, true);
    await prefs.setString(StorageUtils.accessTokenKey, accessTokenValue);
    await prefs.setString(StorageUtils.refreshTokenKey, refreshTokenValue);
    await prefs.setString(StorageUtils.currentUserKey, jsonEncode(user.toJson()));

    await saveLoginSession(
      userIdValue: user.userId,
      usernameValue: user.username,
      roleIdValue: user.roleId,
      accessTokenValue: accessTokenValue,
      refreshTokenValue: refreshTokenValue,
    );
  }

  static Future<String> getRefreshTokenValue() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(refreshToken)?.trim() ?? '';
  }

  static Future<String> getAccessTokenValue() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(accessToken)?.trim() ?? '';
  }

  static Future<String> getUsernameValue() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(usermame)?.trim() ?? '';
  }

  static Future<int> getRoleIdValue() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(RoleId) ?? 0;
  }

  List<Map<String, dynamic>> removeDuplicateNames(List<Map<String, dynamic>> list) {
    Set<String> seenNames = Set<String>();
    List<Map<String, dynamic>> uniqueList = [];

    for (Map<String, dynamic> item in list) {
      if (!seenNames.contains(item["name"])) {
        seenNames.add(item["name"]);
        uniqueList.add(item);
      }
    }

    return uniqueList;
  }

  Future<bool> requestLocationPermission() async {
    PermissionStatus _status = await Permission.location.status;
    if (!_status.isGranted) {
      await Permission.location.request();
      _status = await Permission.location.status;
    }
    return _status.isGranted;
  }

  Future<bool> requestCameraPermission() async {
    PermissionStatus _status = await Permission.camera.status;
    if (!_status.isDenied) {
      await Permission.camera.request();
      _status = await Permission.camera.status;
    }
    return _status.isGranted;
  }

  Future<bool> requestPhotoPermission() async {
    if (Platform.isAndroid) {
      PermissionStatus _status = await Permission.storage.status;
      if (!_status.isDenied) {
        await Permission.storage.request();
        _status = await Permission.storage.status;
      }
      return _status.isGranted;
    } else if (Platform.isIOS) {
      PermissionStatus _status = await Permission.photos.status;
      if (!_status.isDenied) {
        await Permission.photos.request();
        _status = await Permission.photos.status;
      }
      return _status.isGranted;
    } else {
      return false;
    }
  }

  Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  void permissionAlert(BuildContext context, Permission permission) async {
    final state = await permission.request();
    if (!state.isGranted) {
      openAppSettings();
    }
  }

  Future<bool> permissionNotification() async {
    bool state = false;
    await Permission.notification.isDenied.then((value) {
      log("Permission notification value >${value}");
      state = !value;
      if (value) {
        Permission.notification.request();
      }
    });
    return state;
  }

  Future<bool> permissionLocation() async {
    bool state = false;
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }
    permission = await Geolocator.checkPermission();
    if ((permission != LocationPermission.always && permission != LocationPermission.whileInUse)) {
      openAppSettings();
    } else {
      Position pos = await Geolocator.getCurrentPosition();
      log(name: 'permissionLocation', '${pos.toString()}');
      state = true;
    }

    return state;
  }

  Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    bool locationState = false;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      locationState = false;
    }

    permission = await Geolocator.checkPermission();
    log("permission > ${permission}");
    if ((permission == LocationPermission.denied) || (permission == LocationPermission.deniedForever)) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        locationState = false;
      }
    } else {
      final position = await Geolocator.getCurrentPosition();
      if (!position.isMocked) {
        locationState = true;
      }
    }

    // if (permission == LocationPermission.deniedForever) {
    //   // Permissions are denied forever, handle appropriately.
    //   locationState = false;
    // }

    return locationState;
  }

  static String uint8ListToBase64(Uint8List data) {
    String base64String = base64Encode(data);
    return base64String;
  }

  static Uint8List stringToUint8List(String text) {
    List<int> bytes = utf8.encode(text);
    return Uint8List.fromList(bytes);
  }

  //image
  static Uint8List resizeImage(Uint8List data, int size) {
    Uint8List resizedData = data;
    image.Image? img = image.decodeImage(data);
    image.Image resized;
    if (img!.width > img.height) {
      resized = image.copyResize(img, width: size, height: size);
    } else {
      resized = image.copyResize(img, width: size, height: size);
    }
    resizedData = image.encodeJpg(resized);
    return resizedData;
  }

  static Uint8List resizeImageThumb(Uint8List data) {
    Uint8List resizedData = data;
    image.Image? img = image.decodeImage(data);
    image.Image resized;
    if (img!.width > img.height) {
      resized = image.copyResize(img, width: 128, height: 96);
    } else {
      resized = image.copyResize(img, width: 96, height: 128);
    }
    resizedData = image.encodeJpg(resized);
    return resizedData;
  }

  int difDateTimeToMinutes(DateTime a, DateTime b) {
    Duration difference = b.difference(a);

    int minutes = difference.inMinutes;

    return minutes;
  }

  static Future<bool> isWorking() async {
    return true;
    /*
    try {
      final values = await GetData().getVariable('APP_CONNECT');

      if (values.isEmpty || values == null) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      return false;
    }
    */
  }
}
