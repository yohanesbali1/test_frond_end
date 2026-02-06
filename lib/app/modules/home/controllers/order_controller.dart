import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing_front_end_dev/app/data/models/models.dart';
import 'package:testing_front_end_dev/app/modules/home/controllers/home_controller.dart';

class OrderDetailController extends GetxController {
  final home_c = Get.find<HomeController>();

  Rx<OrderModel> order;
  late TextEditingController qtyController;
  late TextEditingController noteController;
  OrderDetailController(OrderModel order) : order = order.obs {
    qtyController = TextEditingController(
      text: order.qty > 0 ? order.qty.toString() : '1',
    );
    noteController = TextEditingController(text: order.note ?? "");
  }

  @override
  void onInit() {
    super.onInit();
  }

  void updateNote(String note) {
    order.value = order.value.copyWith(note: note);
    update();
  }

  void updateQty(int qty) {
    if (qty < 1) qty = 1;
    order.value = order.value.copyWith(qty: qty);
    update();
  }

  void removeItem() {
    home_c.order.removeWhere((e) => e.id == order.value.id);
    Get.delete<OrderDetailController>(
      tag: order.value.id.toString(),
      force: true,
    );
  }
}
