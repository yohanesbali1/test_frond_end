import 'package:get/get.dart';

import '../controllers/casher_controller.dart';

class CasherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CasherController>(
      () => CasherController(),
    );
  }
}
