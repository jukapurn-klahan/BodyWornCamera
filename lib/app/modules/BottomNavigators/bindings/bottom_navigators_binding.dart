import 'package:body_camera/app/modules/HomePage/bindings/home_page_binding.dart';
import 'package:get/get.dart';

import '../../HistoryCamera/bindings/history_camera_binding.dart';
import '../../Setting/bindings/setting_binding.dart';
import '../../activity/bindings/activity_binding.dart';
import '../controllers/bottom_navigators_controller.dart';

class BottomNavigatorsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavigatorsController>(() => BottomNavigatorsController());

    HomePageBinding().dependencies();
    HistoryCameraBinding().dependencies();

    ActivityBinding().dependencies();
    SettingBinding().dependencies();
  }
}
