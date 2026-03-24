import 'package:get/get.dart';

import '../modules/BottomNavigators/bindings/bottom_navigators_binding.dart';
import '../modules/BottomNavigators/views/bottom_navigators_view.dart';
import '../modules/Camera/bindings/camera_binding.dart';
import '../modules/Camera/views/camera_view.dart';
import '../modules/HistoryCamera/bindings/history_camera_binding.dart';
import '../modules/HistoryCamera/views/history_camera_view.dart';
import '../modules/HomePage/bindings/home_page_binding.dart';
import '../modules/HomePage/views/home_page_view.dart';
import '../modules/NotiList/bindings/noti_list_binding.dart';
import '../modules/NotiList/views/noti_list_view.dart';
import '../modules/Pincode/bindings/pincode_binding.dart';
import '../modules/Pincode/views/pincode_view.dart';
import '../modules/Setting/bindings/setting_binding.dart';
import '../modules/Setting/views/setting_view.dart';
import '../modules/activity/bindings/activity_binding.dart';
import '../modules/activity/views/activity_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
        name: _Paths.PROFILE,
        page: () => const ProfileView(),
        binding: ProfileBinding()),
    GetPage(
        name: _Paths.LOGIN,
        page: () => const LoginView(),
        binding: LoginBinding()),
    GetPage(
      name: _Paths.BOTTOM_NAVIGATORS,
      page: () => const BottomNavigatorsView(),
      binding: BottomNavigatorsBinding(),
    ),
    GetPage(
      name: _Paths.HOME_PAGE,
      page: () => const HomePageView(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: _Paths.CAMERA,
      page: () => const CameraView(),
      binding: CameraBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY_CAMERA,
      page: () => const HistoryCameraView(),
      binding: HistoryCameraBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => const SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.PINCODE,
      page: () => const PincodeView(),
      binding: PincodeBinding(),
    ),
    GetPage(
      name: _Paths.NOTI_LIST,
      page: () => const NotiListView(),
      binding: NotiListBinding(),
    ),
    GetPage(
      name: _Paths.ACTIVITY,
      page: () => const ActivityView(),
      binding: ActivityBinding(),
    ),
  ];
}
