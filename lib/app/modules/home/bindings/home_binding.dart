import 'package:get/get.dart';
import 'package:testing_front_end_dev/app/modules/home/controllers/order_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<OrderDetailController>(() => OrderDetailController());
  }
}
