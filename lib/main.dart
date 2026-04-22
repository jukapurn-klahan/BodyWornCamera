import 'dart:async';

import 'package:body_camera/app/routes/app_pages.dart';
import 'package:body_camera/fcm/notification_services.dart';
import 'package:body_camera/firebase_options.dart';
import 'package:body_camera/utils/app_info_utils.dart';
import 'package:body_camera/utils/app_session_utils.dart';
import 'package:body_camera/utils/cv_function.dart';
import 'package:body_camera/utils/storage_utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:intl/date_symbol_data_local.dart';

const bool _enableFirebaseServices = true;

Future<void> _initializeForegroundServices() async {
  if (!_enableFirebaseServices) {
    return;
  }

  try {
    await NotificationServices.instance.initNotifications();
  } catch (_) {}
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (_enableFirebaseServices) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    NotificationServices.registerBackgroundHandler();
  }

  await AppInfoUtils.warmUp();
  await cv_func.getDevice();

  await initializeDateFormatting('th', null);
  final hasPinCode = await StorageUtils.hasPinCode();
  var hasAuthenticatedSession = await StorageUtils.hasAuthenticatedSession();
  if (hasAuthenticatedSession) {
    await AppSessionUtils.refreshAccessTokenIfNeeded();
    hasAuthenticatedSession = await StorageUtils.hasAuthenticatedSession();
  }
  final initialRoute = hasPinCode && hasAuthenticatedSession
      ? Routes.PINCODE
      : AppPages.INITIAL;

  runApp(
    GetMaterialApp(
      title: 'Body Camera',
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      getPages: AppPages.routes,
    ),
  );

  WidgetsBinding.instance.addPostFrameCallback((_) {
    unawaited(_initializeForegroundServices());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Body Camera',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
