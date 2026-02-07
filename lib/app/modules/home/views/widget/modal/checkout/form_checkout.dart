import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_front_end_dev/app/modules/home/controllers/checkout_controller.dart';
import 'package:testing_front_end_dev/app/modules/home/views/widget/modal/checkout/credit_cart.dart';
import 'package:testing_front_end_dev/app/modules/home/views/widget/modal/checkout/option_payment.dart';

class FormCheckout extends GetView<CheckoutController> {
  const FormCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Payment Method",
                  style: GoogleFonts.barlow(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                OptionPayment(),
              ],
            ),
          ),
          Obx(() {
            final paymentSelected = controller.paymentType;
            if (paymentSelected.value == 'credit') return CreditCart();
            return Container();
          }),
        ],
      ),
    );
  }
}
