import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_front_end_dev/app/core/widgets/text_form.widget.dart';
import 'package:testing_front_end_dev/app/modules/casher/controllers/checkout_controller.dart';

class CreditCart extends GetView<CheckoutController> {
  const CreditCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 24),
      child: Column(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 8,
              children: [
                Text(
                  "Cardholder Name",
                  style: GoogleFonts.barlow(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                Obx(
                  () => CustomInputField(
                    controller: controller.cardNameController,
                    hintText: 'Ardi Nugroho',
                    errorText: controller.cardnameError.value,
                    keyboardType: TextInputType.text,
                    onChanged: (_) => controller.validateCardName(),
                  ),
                ),
              ],
            ),
          ),

          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 8,
              children: [
                Text(
                  "Card Number",
                  style: GoogleFonts.barlow(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                Obx(
                  () => CustomInputField(
                    controller: controller.cardNumberController,
                    hintText: '123456789',
                    errorText: controller.cardnumberError.value,
                    keyboardType: TextInputType.number,
                    onChanged: (_) => controller.validateCardNumber(),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              spacing: 13,
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      spacing: 8,
                      children: [
                        Text(
                          "Expiration Date",
                          style: GoogleFonts.barlow(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        Obx(
                          () => CustomInputField(
                            controller: controller.cardExpController,
                            hintText: 'Select date',
                            errorText: controller.cardexpError.value,
                            isDate: true,
                            onChanged: (_) => controller.validateCardNumber(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      spacing: 8,
                      children: [
                        Text(
                          "CVV",
                          style: GoogleFonts.barlow(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        Obx(
                          () => CustomInputField(
                            controller: controller.cardCVVController,
                            hintText: 'CVV',
                            isPassword: true,
                            errorText: controller.cardcvvError.value,
                            onChanged: (_) => controller.validateCVV(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
