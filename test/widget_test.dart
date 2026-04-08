import 'package:body_camera/app/modules/login/controllers/login_controller.dart';
import 'package:body_camera/app/modules/login/views/login_view.dart';
import 'package:body_camera/app/routes/app_pages.dart';
import 'package:body_camera/app/data/models/user_model.dart';
import 'package:body_camera/app/services/user_api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FakeUserApiService extends UserApiService {
  FakeUserApiService({required this.onLogin});

  final Future<UserModel> Function({
    required String username,
    required String passwordHash,
  })
  onLogin;

  @override
  Future<UserModel> login({
    required String username,
    required String passwordHash,
  }) {
    return onLogin(username: username, passwordHash: passwordHash);
  }

  @override
  void dispose() {}
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  setUp(() {
    Get.testMode = true;
    SharedPreferences.setMockInitialValues({});
  });

  tearDown(() {
    Get.reset();
  });

  Finder usernameField() => find.byType(TextFormField).first;

  Finder passwordField() => find.byType(TextFormField).at(1);

  Future<void> pumpLoginPage(
    WidgetTester tester, {
    UserApiService? userApiService,
  }) async {
    tester.view.devicePixelRatio = 1.0;
    tester.view.physicalSize = const Size(390.0, 844.0);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.view.resetPhysicalSize);

    final injectedUserApiService =
        userApiService ??
        FakeUserApiService(
          onLogin:
              ({
                required String username,
                required String passwordHash,
              }) async => UserModel(
                userId: 22,
                username: username,
                passwordHash: '',
                roleId: 1,
                status: 'active',
                createdAt: DateTime.parse('2026-04-01T10:30:38.557Z'),
                updatedAt: DateTime.parse('2026-04-01T10:30:38.557Z'),
              ),
        );

    await tester.pumpWidget(
      GetMaterialApp(
        initialRoute: Routes.LOGIN,
        getPages: [
          GetPage(
            name: Routes.LOGIN,
            page: () => const LoginView(),
            binding: BindingsBuilder(() {
              Get.put(LoginController(userApiService: injectedUserApiService));
            }),
          ),
          GetPage(
            name: Routes.PINCODE,
            page: () =>
                const Scaffold(body: Center(child: Text('Pincode Screen'))),
          ),
        ],
      ),
    );

    await tester.pumpAndSettle();
  }

  group('LoginView', () {
    testWidgets('login button is disabled until both fields are filled', (
      WidgetTester tester,
    ) async {
      await pumpLoginPage(tester);

      ElevatedButton loginButton() =>
          tester.widget<ElevatedButton>(find.byType(ElevatedButton));

      expect(loginButton().onPressed, isNull);

      await tester.enterText(usernameField(), 'user1');
      await tester.pump();
      expect(loginButton().onPressed, isNull);

      await tester.enterText(passwordField(), 'secret123');
      await tester.pump();
      expect(loginButton().onPressed, isNotNull);
    });

    testWidgets('renders the main login form elements', (
      WidgetTester tester,
    ) async {
      await pumpLoginPage(tester);

      expect(find.byType(TextFormField), findsNWidgets(2));
      expect(find.text('ชื่อผู้ใช้งาน'), findsOneWidget);
      expect(find.text('รหัสผ่าน'), findsOneWidget);
      expect(find.text('จำรหัสผ่าน'), findsOneWidget);
      expect(find.text('ลืมรหัสผ่าน?'), findsOneWidget);
      expect(find.text('เข้าสู่ระบบ'), findsOneWidget);
    });

    testWidgets('updates controller values and toggles remember checkbox', (
      WidgetTester tester,
    ) async {
      await pumpLoginPage(tester);

      await tester.enterText(usernameField(), 'user1');
      await tester.enterText(passwordField(), 'secret123');
      await tester.tap(find.byType(Checkbox));
      await tester.pump();

      final controller = Get.find<LoginController>();

      expect(controller.usernameController.text, 'user1');
      expect(controller.passwordController.text, 'secret123');
      // expect(controller.checkboxValue1.value, isTrue);
      expect(tester.widget<Checkbox>(find.byType(Checkbox)).value, isTrue);
    });

    testWidgets('navigates to pincode when login button is pressed', (
      WidgetTester tester,
    ) async {
      await pumpLoginPage(tester);

      await tester.enterText(usernameField(), 'user1');
      await tester.enterText(passwordField(), 'secret123');
      await tester.pump();
      await tester.ensureVisible(find.text('เข้าสู่ระบบ'));
      await tester.tap(find.text('เข้าสู่ระบบ'));
      await tester.pumpAndSettle();

      expect(Get.currentRoute, Routes.PINCODE);
      expect(find.text('Pincode Screen'), findsOneWidget);
    });
  });
}
