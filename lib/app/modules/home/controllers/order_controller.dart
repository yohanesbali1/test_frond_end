import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing_front_end_dev/app/data/models/models.dart';
import 'package:testing_front_end_dev/app/modules/home/controllers/home_controller.dart';

class OrderDetailController extends GetxController {
  OrderModel? order;

  final home_c = Get.find<HomeController>();

  final qtyC = TextEditingController();
  final noteC = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    print(order);
    qtyC.text = order?.qty.toString() ?? '1';
    noteC.text = order?.note ?? '';
  }
}
