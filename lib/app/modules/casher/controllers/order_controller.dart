import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing_front_end_dev/app/data/models/models.dart';
import 'package:testing_front_end_dev/app/modules/casher/controllers/casher_controller.dart';

class OrderDetailController extends GetxController {
  final CasherController casher_c = Get.find();

  final int? orderId;

  late TextEditingController qtyController;
  late TextEditingController noteController;

  late Worker orderWorker;

  OrderDetailController(this.orderId);

  OrderModel get order => casher_c.order.firstWhere((e) => e.id == orderId);

  @override
  void onInit() {
    super.onInit();
    qtyController = TextEditingController(text: order.qty.toString());
    noteController = TextEditingController(text: order.note ?? '');

    orderWorker = ever<List<OrderModel>>(casher_c.order, (_) {
      final current = casher_c.order.firstWhereOrNull((e) => e.id == orderId);

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

    final index = casher_c.order.indexWhere((e) => e.id == orderId);
    if (index == -1) return;

    casher_c.order[index] = casher_c.order[index].copyWith(qty: qty);

    casher_c.order.refresh();
  }

  void updateNote(String note) {
    final index = casher_c.order.indexWhere((e) => e.id == orderId);
    if (index == -1) return;

    casher_c.order[index] = casher_c.order[index].copyWith(note: note);

    casher_c.order.refresh();
  }

  void removeItem() {
    casher_c.order.removeWhere((e) => e.id == orderId);
    casher_c.order.refresh();
  }

  @override
  void onClose() {
    orderWorker.dispose();
    qtyController.dispose();
    noteController.dispose();
    super.onClose();
  }
}
