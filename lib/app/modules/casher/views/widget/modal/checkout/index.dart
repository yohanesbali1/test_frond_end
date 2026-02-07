import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing_front_end_dev/app/core/theme/theme.dart';
import 'package:testing_front_end_dev/app/modules/casher/controllers/checkout_controller.dart';
import 'package:testing_front_end_dev/app/modules/casher/views/widget/modal/checkout/order.dart';
import 'package:testing_front_end_dev/app/modules/casher/views/widget/modal/checkout/payment.dart';

class CustomRightModal extends GetView<CheckoutController> {
  final double width;

  const CustomRightModal({Key? key, this.width = 820}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Maksimal tinggi = tinggi layar - margin
    final screenHeight = MediaQuery.of(context).size.height;

    return Align(
      alignment: Alignment.centerRight,
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: width,
          height: screenHeight,
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(right: 16, top: 25, bottom: 25),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
          ),
          child: Row(
            children: [
              Expanded(child: OrderModal()),
              Container(width: 1, height: double.infinity, color: borderMain),
              Expanded(child: PeymentModal()),
            ],
          ),
        ),
      ),
    );
  }
}
