import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing_front_end_dev/app/data/models/models.dart';
import 'package:testing_front_end_dev/app/modules/home/controllers/home_controller.dart';

class OrderDetailController extends GetxController {
  final HomeController home = Get.find();

  final int? orderId;

  late TextEditingController qtyController;
  late TextEditingController noteController;

  late Worker orderWorker;

  OrderDetailController(this.orderId);

  OrderModel get order => home.order.firstWhere((e) => e.id == orderId);

  @override
  void onInit() {
    super.onInit();
    qtyController = TextEditingController(text: order.qty.toString());
    noteController = TextEditingController(text: order.note ?? '');

    orderWorker = ever<List<OrderModel>>(home.order, (_) {
      final current = home.order.firstWhereOrNull((e) => e.id == orderId);

      if (current == null) return;

      if (qtyController.text != current.qty.toString()) {
        qtyController.text = current.qty.toString();
      }

      if (noteController.text != (current.note ?? '')) {
        noteController.text = current.note ?? '';
      }
    });
  }

  void updateQty(int qty) {
    if (qty < 1) qty = 1;

    final index = home.order.indexWhere((e) => e.id == orderId);
    if (index == -1) return;

    home.order[index] = home.order[index].copyWith(qty: qty);

    home.order.refresh();
  }

  void updateNote(String note) {
    final index = home.order.indexWhere((e) => e.id == orderId);
    if (index == -1) return;

    home.order[index] = home.order[index].copyWith(note: note);

    home.order.refresh();
  }

  void removeItem() {
    home.order.removeWhere((e) => e.id == orderId);
    home.order.refresh();
    Get.back();
  }

  @override
  void onClose() {
    orderWorker.dispose();
    qtyController.dispose();
    noteController.dispose();
    super.onClose();
  }
}
