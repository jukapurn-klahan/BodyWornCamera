import 'package:get/get.dart';

import '../controllers/editpassword_controller.dart';

class EditpasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditpasswordController>(
      () => EditpasswordController(),
    );
  }
}
