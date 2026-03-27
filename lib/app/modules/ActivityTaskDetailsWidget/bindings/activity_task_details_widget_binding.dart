import 'package:get/get.dart';

import '../controllers/activity_task_details_widget_controller.dart';

class ActivityTaskDetailsWidgetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ActivityTaskDetailsWidgetController>(
      () => ActivityTaskDetailsWidgetController(),
    );
  }
}
