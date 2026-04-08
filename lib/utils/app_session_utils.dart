import 'dart:io';

import 'package:body_camera/fcm/notification_services.dart';
import 'package:flutter/painting.dart';
import 'package:path_provider/path_provider.dart';

import 'storage_utils.dart';

class AppSessionUtils {
  AppSessionUtils._();

  static Future<void> clearForLogout() async {
    await NotificationServices.instance.clearSessionData();
    await StorageUtils.clearAll(preserveRememberedLogin: true);
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
