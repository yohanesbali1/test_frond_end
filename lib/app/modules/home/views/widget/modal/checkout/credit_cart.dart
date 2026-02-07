import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_front_end_dev/app/core/theme/theme.dart';
import 'package:testing_front_end_dev/app/core/widgets/text_form.widget.dart';
import 'package:testing_front_end_dev/app/modules/home/controllers/checkout_controller.dart';

class CreditCart extends GetView<CheckoutController> {
  const CreditCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                CustomInputField(
                  controller: controller.cardNameController,
                  hintText: 'Ardi Nugroho',
                  keyboardType: TextInputType.text,
                  onChanged: (val) => {},
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
                CustomInputField(
                  controller: controller.cardNameController,
                  hintText: '123456789',
                  keyboardType: TextInputType.number,
                  onChanged: (val) => {},
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
                        CustomInputField(
                          controller: controller.cardExpController,
                          hintText: 'Select date',
                          isDate: true,
                          onChanged: (val) => print('Date: $val'),
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
                        CustomInputField(
                          controller: controller.cardCVVController,
                          hintText: '1234',
                          isPassword: true,
                          onChanged: (val) => print('Password: $val'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(height: 1, width: double.infinity, color: borderMain),
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
                          "Order Type",
                          style: GoogleFonts.barlow(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        CustomInputField(
                          isDropdown: true,
                          value: controller.orderTypeController,
                          dropdownItems: ['dine in', 'take away', 'delivery'],
                          hintText: 'Select option',
                          onChanged: (val) => {
                            // setState(() => selectedValue = val),
                          },
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
                          "Table no.",
                          style: GoogleFonts.barlow(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        CustomInputField(
                          controller: controller.tableController,
                          hintText: '001',
                          keyboardType: TextInputType.number,
                          onChanged: (val) => {},
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
