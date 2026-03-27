import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppInfoUtils {
  AppInfoUtils._();

  static const String _fallbackPackageName = 'unknown';

  static PackageInfo? _cachedPackageInfo;
  static Future<PackageInfo>? _loadingPackageInfo;
  static bool _didLogMissingPlugin = false;

  static String get cachedPackageName {
    final packageName = _cachedPackageInfo?.packageName.trim() ?? '';
    return packageName.isNotEmpty ? packageName : _fallbackPackageName;
  }

  static Future<void> warmUp() async {
    await getPackageName();
  }

  static Future<PackageInfo> getPackageInfo() async {
    if (_cachedPackageInfo != null) {
      return _cachedPackageInfo!;
    }

    WidgetsFlutterBinding.ensureInitialized();

    _loadingPackageInfo ??= PackageInfo.fromPlatform()
        .then((info) {
          _cachedPackageInfo = info;
          return info;
        })
        .whenComplete(() {
          _loadingPackageInfo = null;
        });

    return _loadingPackageInfo!;
  }

  static Future<String> getPackageName({
    String fallback = _fallbackPackageName,
  }) async {
    try {
      final packageName = (await getPackageInfo()).packageName.trim();
      return packageName.isNotEmpty ? packageName : fallback;
    } on MissingPluginException catch (error, stackTrace) {
      if (!_didLogMissingPlugin) {
        _didLogMissingPlugin = true;
        log(
          'package_info_plus plugin is not registered in this runtime. '
          'Do a full restart after plugin changes.',
          name: 'AppInfoUtils',
          error: error,
          stackTrace: stackTrace,
        );
      }
      return fallback;
    } catch (error, stackTrace) {
      log(
        'Failed to load package name.',
        name: 'AppInfoUtils',
        error: error,
        stackTrace: stackTrace,
      );
      return fallback;
    }
  }
}
