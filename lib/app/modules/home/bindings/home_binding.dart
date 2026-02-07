import 'package:get/get.dart';
import 'package:testing_front_end_dev/app/modules/casher/controllers/casher_controller.dart';
import 'package:testing_front_end_dev/app/modules/casher/controllers/checkout_controller.dart';
import 'package:testing_front_end_dev/app/modules/dashboard/controllers/dashboard_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<CasherController>(() => CasherController());
    Get.lazyPut<CheckoutController>(() => CheckoutController(), fenix: true);
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}
