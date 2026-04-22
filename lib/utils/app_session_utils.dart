import 'dart:developer';
import 'dart:io';

import 'package:body_camera/app/services/user_api_service.dart';
import 'package:body_camera/fcm/notification_services.dart';
import 'package:body_camera/utils/cv_function.dart';
import 'package:flutter/painting.dart';
import 'package:path_provider/path_provider.dart';

import 'config.dart';
import 'storage_utils.dart';

class AppSessionUtils {
  AppSessionUtils._();

  static const Duration _defaultAccessTokenRefreshThreshold = Duration.zero;

  static Future<String> getValidAccessToken({
    Duration threshold = _defaultAccessTokenRefreshThreshold,
  }) async {
    return cv_func.getValidAccessToken(
      threshold: threshold,
      swallowRefreshErrors: true,
    );
  }

  static Future<Map<String, String>> getAuthorizedJsonHeaders({
    Duration threshold = _defaultAccessTokenRefreshThreshold,
    Map<String, String> extraHeaders = const {},
  }) async {
    final accessToken = await getValidAccessToken(threshold: threshold);
    final headers = <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      if (accessToken.isNotEmpty) 'Authorization': 'Bearer $accessToken',
    };
    headers.addAll(extraHeaders);
    return headers;
  }

  static Future<void> refreshAccessTokenIfNeeded({
    Duration threshold = _defaultAccessTokenRefreshThreshold,
  }) async {
    await cv_func.refreshAccessTokenIfNeeded(
      threshold: threshold,
      swallowErrors: true,
    );
  }

  static Future<void> clearForLogout() async {
    final currentUsername = await GetData.getUsernameValue();
    final hasPinCode = await StorageUtils.hasPinCode();
    final pinCodeOwnerUsername = await StorageUtils.getPinCodeOwnerUsername();

    if (hasPinCode &&
        (pinCodeOwnerUsername == null || pinCodeOwnerUsername.isEmpty) &&
        currentUsername.trim().isNotEmpty) {
      await StorageUtils.setPinCodeOwnerUsername(currentUsername);
    }

    final refreshToken = await GetData.getRefreshTokenValue();
    if (refreshToken.isNotEmpty) {
      final userApiService = UserApiService();
      try {
        await userApiService.logout(refreshToken: refreshToken);
      } catch (error, stackTrace) {
        log(
          'Failed to call logout API.',
          name: 'AppSessionUtils.clearForLogout',
          error: error,
          stackTrace: stackTrace,
        );
      } finally {
        userApiService.dispose();
      }
    }

    await NotificationServices.instance.clearSessionData();
    await StorageUtils.clearAuthenticatedSession();
    await GetData().resetUser();
    _clearImageCache();
    await _clearFileCache();
  }

  static void _clearImageCache() {
    PaintingBinding.instance.imageCache.clear();
    PaintingBinding.instance.imageCache.clearLiveImages();
  }

  static Future<void> _clearFileCache() async {
    final tempDirectory = await getTemporaryDirectory();
    await _deleteDirectoryContents(tempDirectory);

    final cacheDirectory = await getApplicationCacheDirectory();
    if (cacheDirectory.path != tempDirectory.path) {
      await _deleteDirectoryContents(cacheDirectory);
    }
  }

  static Future<void> _deleteDirectoryContents(Directory directory) async {
    if (!await directory.exists()) {
      return;
    }

    await for (final entity in directory.list(followLinks: false)) {
      try {
        await entity.delete(recursive: true);
      } catch (_) {
        // Continue clearing the remaining cache files.
      }
    }
  }
}
