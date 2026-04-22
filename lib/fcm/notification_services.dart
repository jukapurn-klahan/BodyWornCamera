import 'dart:convert';
import 'dart:developer';

import 'package:body_camera/app/routes/app_pages.dart';
import 'package:body_camera/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:http/http.dart' as http;

const bool _enableApplePushNotifications = bool.fromEnvironment(
  'ENABLE_APPLE_PUSH_NOTIFICATIONS',
  defaultValue: false,
);

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    log(
      'Background message received: ${message.messageId}',
      name: 'NotificationServices',
    );
  } catch (error, stackTrace) {
    log(
      'Failed to process background message.',
      name: 'NotificationServices',
      error: error,
      stackTrace: stackTrace,
    );
  }
}

class NotificationServices {
  NotificationServices._();

  static final NotificationServices instance = NotificationServices._();

  static const AndroidNotificationChannel _androidChannel =
      AndroidNotificationChannel(
        'fcm_high_importance_channel',
        'FCM Notifications',
        description: 'Channel for FCM foreground notifications',
        importance: Importance.high,
      );

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;

  static void registerBackgroundHandler() {
    if (!supportsRemoteMessaging) {
      return;
    }
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }

  static bool get supportsRemoteMessaging {
    if (kIsWeb) {
      return false;
    }
    if (defaultTargetPlatform == TargetPlatform.android) {
      return true;
    }
    if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.macOS) {
      return _enableApplePushNotifications;
    }
    return false;
  }

  static Future<String> getAccessToken() async {
    final serviceAccountJson = {
      "type": "service_account",
      "project_id": "nwl-bodyworncamera-2026",
      "private_key_id": "2e8d55838b93413de30ffa7e0e97b2adc9df1352",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQC5RIyrpzWgZ55f\naAlt7IAEGg0MH+b6ICeaxdE+9CAMoOvEdyeDvcEPsZ+toSg4hg0O3005elQEC/WA\nla0TMRfpU+4ooTyA3zGqvvRJOAOjgRTN1QdamiiwLyYwkN1I4uzco06XVpoOqCHD\nr8Z7mELw559Mqq0CrOD7aH8Nqf8cpfcLSUsfvn7OS3ticVq+aFFO59nnUJ8K94E2\n7F79Y2pMhfhlYumYuLut8EWrfBqY5dl1IknK4wEI79oBTWToFPCZDB/PRBCkbZxk\nWSJGhezNyvD8bvADz7dm4HzcG83DvPTFYflCyiLJ/rjyYoMgWRjzFwyRK4uaI06+\nx0sQcAPfAgMBAAECggEALtrR0sW2j8s05/8ZR2YlGCR4gUT+Nurz6TY3TbsS8e6u\nweC6qxxN28i50AEueWEZo1XBI5S289EMdUklXPGxEO8Lj9X7RcJsvriNcokKjori\nNo42TmkneitqdqTkef7+FWztvuOFkchexa1KPs7Kuz9w78RIfiE3ww1x+IQyQ02d\nylXLWxrMVMycfchzabZl/Y5GypqATbXtW9h3Lhik16EaQKVAe9qo3Us0o8iAzMZr\novtkQusvvj5rhPgn2HR58G7I0g1sDrChZ2193x5iZqsVSNK+MbT7zIJKIYziMqaB\nuub3oH1jCvxkYv1pkx/GqJJasJZOBMxj7pUDHdEI7QKBgQDdC8o+EgXHxRAwsWjP\njVYvKwscPuKD4eP2JnzDrqi3nmElzFkv5U1HmZ3eAXsRNBo5ygFz7B7WG8SDT5Es\ndG9wLlzSvbBRUot0ufW8IBWYsW5mZmEbXe/HYXndiuHP53s3Lhe22rPUg9yKlbVv\n2HQyogH4bg+BG0TRTEoTumK22wKBgQDWkGlc2J4qUbHUsLHIp3h2vD4adqsOHRBg\nNuPZND49YjEeeDVtGvybJjbd5h2KODlpO4zXaPEWkgnxDLqrzdm3a1R8X20ODRYu\nbgWAcbsxMhP2zk5Iuo2s21lwALOe1PqV3eVOx25zxQi2rWWbv4tZvCRbnJhzwSWS\n8J/9CkJMTQKBgHh7OaO1XRMy1Q1FVZRzO/t/oZGmsP4jPIZpGe3qoCldGSRqCl6x\nw/p3v3VHJ1YMKRNAiKQvmesnvWe5Ea7CVA84Jf3zyEu7Cyn3RfphHoRYiY0k1l79\nR3lMJwla7pPMXvuHkwNml0gJC0c6LGem+kayyRIooyjCvTK7O1EfcTirAoGAKAYe\nMVyS/G/qzTL8puJefT+WEheqxuIzCM+UZxLwvUCQyw8/YA/VqRdSyse/IOZmBzQ9\njH0d48jwI8/tDllC0I0r4Ftom2NjjNunGROeCIo/4R0Qy05JWUI9h8AJwYoXCFex\nC6X1+5B4lKL5vjjXxLBs0839PjJ8UNGj9m6weU0CgYBgl8kh+wsBLO/Mt1cK+HFU\nTU3+2jQYM20i7NyHuOnyVqWkujGcRnGvRyJY7rIozZx4/35Sa0awZsbSj5a86yaD\nDnj1/YuAg5ybvFazWIIyDQBFIXpsnNSN9dLfLQp03RgZOIRBk6hk/cHpXeBrGCp4\nLhF3wCHG4BK9fVWobjMlBw==\n-----END PRIVATE KEY-----\n",
      "client_email":
          "firebase-adminsdk-fbsvc@nwl-bodyworncamera-2026.iam.gserviceaccount.com",
      "client_id": "100053140888440319827",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-fbsvc%40nwl-bodyworncamera-2026.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com",
    };

    List<String> scopes = [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging",
    ];
    http.Client client = await auth.clientViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
    );

    auth.AccessCredentials credentials = await auth
        .obtainAccessCredentialsViaServiceAccount(
          auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
          scopes,
          client,
        );
    client.close();

    log('accessToken : ${credentials.accessToken.data}');
    return credentials.accessToken.data;
  }

  Future<void> initNotifications() async {
    if (_isInitialized) {
      return;
    }
    _isInitialized = true;

    try {
      await _initLocalNotifications();
      if (!supportsRemoteMessaging) {
        log(
          'Remote notifications are disabled on this platform/build. '
          'On Apple platforms, enable them only when using a provisioning '
          'profile that supports Push Notifications.',
          name: 'NotificationServices',
        );
        return;
      }
      await _requestFcmPermission();
      await _setForegroundPresentationOptions();
      _registerForegroundMessageHandler();
      _registerNotificationOpenHandler();
      _registerTokenRefreshHandler();
      await _handleInitialMessage();
    } on MissingPluginException catch (error, stackTrace) {
      log(
        'firebase_messaging plugin is not registered in this runtime. '
        'Do a full restart after plugin changes.',
        name: 'NotificationServices',
        error: error,
        stackTrace: stackTrace,
      );
    } catch (error, stackTrace) {
      log(
        'Failed to initialize notifications.',
        name: 'NotificationServices',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> showTestNotification({
    String title = 'แจ้งเตือนการตรวจจับ',
    String body = '',
  }) async {
    if (!_isInitialized) {
      await initNotifications();
    }
    if (!_canUseLocalNotifications) {
      return;
    }

    await _localNotifications.show(
      DateTime.now().millisecondsSinceEpoch.remainder(0x7fffffff),
      title,
      body,
      _notificationDetails,
      payload: jsonEncode({
        'route': Routes.NOTI_LIST,
        'data': <String, dynamic>{},
      }),
    );
  }

  Future<void> clearSessionData() async {
    try {
      await _localNotifications.cancelAll();
    } catch (error, stackTrace) {
      log(
        'Failed to clear local notifications.',
        name: 'NotificationServices',
        error: error,
        stackTrace: stackTrace,
      );
    }

    try {
      if (!supportsRemoteMessaging) {
        return;
      }
      await _firebaseMessaging.deleteToken();
    } catch (error, stackTrace) {
      log(
        'Failed to delete FCM token.',
        name: 'NotificationServices',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> _requestFcmPermission() async {
    if (kIsWeb || _isApplePlatform) {
      final setting = await _firebaseMessaging.requestPermission();
      log(
        'FCM permission: ${setting.authorizationStatus}',
        name: 'NotificationServices',
      );
    } else if (_isAndroidPlatform) {
      final setting = await _firebaseMessaging.getNotificationSettings();
      log(
        'FCM permission: ${setting.authorizationStatus}',
        name: 'NotificationServices',
      );
    }
  }

  Future<void> _initLocalNotifications() async {
    if (!_canUseLocalNotifications) {
      return;
    }

    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const iosSettings = DarwinInitializationSettings();
    const initializationSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _localNotifications.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: _onLocalNotificationTapped,
    );

    if (_isAndroidPlatform) {
      final androidPlugin = _localNotifications
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >();
      await androidPlugin?.createNotificationChannel(_androidChannel);
      await androidPlugin?.requestNotificationsPermission();
    }

    if (_isApplePlatform) {
      final darwinPlugin = _localNotifications
          .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin
          >();
      await darwinPlugin?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
    }
  }

  Future<void> _setForegroundPresentationOptions() async {
    if (!_isApplePlatform) {
      return;
    }

    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  void _registerForegroundMessageHandler() {
    FirebaseMessaging.onMessage.listen((message) async {
      log(
        'Foreground message received: ${message.messageId}',
        name: 'NotificationServices',
      );

      await _showForegroundNotification(message);
    });
  }

  void _registerNotificationOpenHandler() {
    FirebaseMessaging.onMessageOpenedApp.listen(_handleRemoteMessageNavigation);
  }

  void _registerTokenRefreshHandler() {
    _firebaseMessaging.onTokenRefresh.listen((token) {
      log('FCM token refreshed: $token', name: 'NotificationServices');
    });
  }

  Future<void> _handleInitialMessage() async {
    final initialMessage = await _firebaseMessaging.getInitialMessage();
    if (initialMessage == null) {
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handleRemoteMessageNavigation(initialMessage);
    });
  }

  Future<String?> getCurrentFcmToken() async {
    if (!supportsRemoteMessaging) {
      return null;
    }

    try {
      if (_isApplePlatform) {
        final apnsToken = await _waitForApnsToken();
        if (apnsToken == null || apnsToken.isEmpty) {
          log(
            'APNS token is not ready yet. Skip initial FCM token fetch; '
            'token refresh listener will handle it when available.',
            name: 'NotificationServices',
          );
          return null;
        }
      }

      final token = await _firebaseMessaging.getToken();
      if (token != null && token.isNotEmpty) {
        log('FCM token: $token', name: 'NotificationServices');
        return token;
      }
    } on FirebaseException catch (error, stackTrace) {
      if (error.code == 'apns-token-not-set') {
        log(
          'APNS token has not been received yet. '
          'Skip initial FCM token fetch for now.',
          name: 'NotificationServices',
          error: error,
          stackTrace: stackTrace,
        );
        return null;
      }

      log(
        'Failed to fetch FCM token.',
        name: 'NotificationServices',
        error: error,
        stackTrace: stackTrace,
      );
    } catch (error, stackTrace) {
      log(
        'Failed to fetch FCM token.',
        name: 'NotificationServices',
        error: error,
        stackTrace: stackTrace,
      );
    }
    return null;
  }

  Future<String?> _waitForApnsToken({
    Duration timeout = const Duration(seconds: 5),
    Duration pollInterval = const Duration(milliseconds: 400),
  }) async {
    final stopAt = DateTime.now().add(timeout);
    while (DateTime.now().isBefore(stopAt)) {
      final apnsToken = await _firebaseMessaging.getAPNSToken();
      if (apnsToken != null && apnsToken.isNotEmpty) {
        return apnsToken;
      }
      await Future<void>.delayed(pollInterval);
    }
    return null;
  }

  Future<void> _showForegroundNotification(RemoteMessage message) async {
    if (!_canUseLocalNotifications) {
      return;
    }

    final title =
        message.notification?.title ??
        message.data['title']?.toString() ??
        'Notification';
    final body =
        message.notification?.body ?? message.data['body']?.toString() ?? '';

    await _localNotifications.show(
      _notificationIdFromMessage(message),
      title,
      body,
      _notificationDetails,
      payload: jsonEncode({
        'route': _resolveRoute(message.data),
        'data': message.data,
      }),
    );
  }

  NotificationDetails get _notificationDetails {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'fcm_high_importance_channel',
        'FCM Notifications',
        channelDescription: 'Channel for FCM foreground notifications',
        importance: Importance.high,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(),
    );
  }

  void _onLocalNotificationTapped(NotificationResponse response) {
    final payload = response.payload;
    if (payload == null || payload.isEmpty) {
      _navigateToRoute(route: Routes.NOTI_LIST);
      return;
    }

    try {
      final decoded = jsonDecode(payload);
      if (decoded is! Map) {
        _navigateToRoute(route: Routes.NOTI_LIST);
        return;
      }

      final route = decoded['route'] as String?;
      final arguments = _toStringDynamicMap(decoded['data']);
      _navigateToRoute(route: route ?? Routes.NOTI_LIST, arguments: arguments);
    } catch (error, stackTrace) {
      log(
        'Failed to parse local notification payload.',
        name: 'NotificationServices',
        error: error,
        stackTrace: stackTrace,
      );
      _navigateToRoute(route: Routes.NOTI_LIST);
    }
  }

  void _handleRemoteMessageNavigation(RemoteMessage message) {
    _navigateToRoute(
      route: _resolveRoute(message.data),
      arguments: message.data,
    );
  }

  void _navigateToRoute({
    required String route,
    Map<String, dynamic>? arguments,
  }) {
    final normalizedRoute = route.trim().isEmpty ? Routes.NOTI_LIST : route;

    void navigate() {
      try {
        Get.toNamed(normalizedRoute, arguments: arguments);
      } catch (error, stackTrace) {
        log(
          'Route "$normalizedRoute" was not found. Falling back to notification list.',
          name: 'NotificationServices',
          error: error,
          stackTrace: stackTrace,
        );
        Get.toNamed(Routes.NOTI_LIST, arguments: arguments);
      }
    }

    if (Get.key.currentState == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) => navigate());
      return;
    }

    navigate();
  }

  int _notificationIdFromMessage(RemoteMessage message) {
    final id = message.messageId;
    if (id == null || id.isEmpty) {
      return DateTime.now().millisecondsSinceEpoch.remainder(0x7fffffff);
    }
    return id.hashCode & 0x7fffffff;
  }

  String _resolveRoute(Map<String, dynamic> data) {
    final candidate = data['route'] ?? data['screen'] ?? data['targetRoute'];
    if (candidate is String && candidate.trim().isNotEmpty) {
      return candidate;
    }
    return Routes.NOTI_LIST;
  }

  Map<String, dynamic>? _toStringDynamicMap(dynamic input) {
    if (input is! Map) {
      return null;
    }
    return input.map((key, value) => MapEntry(key.toString(), value));
  }

  bool get _canUseLocalNotifications {
    return !kIsWeb && (_isAndroidPlatform || _isApplePlatform);
  }

  bool get _isApplePlatform {
    return defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.macOS;
  }

  bool get _isAndroidPlatform {
    return defaultTargetPlatform == TargetPlatform.android;
  }
}
