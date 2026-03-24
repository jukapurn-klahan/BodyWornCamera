import 'package:get/get.dart';

import '../controllers/history_camera_controller.dart';

class HistoryCameraBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryCameraController>(
      () => HistoryCameraController(),
    );
  }
}
