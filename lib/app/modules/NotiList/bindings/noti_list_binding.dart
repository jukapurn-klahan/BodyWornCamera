import 'package:get/get.dart';

import '../controllers/noti_list_controller.dart';

class NotiListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotiListController>(
      () => NotiListController(),
    );
  }
}
