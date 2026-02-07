import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_front_end_dev/app/core/theme/theme.dart';
import 'package:testing_front_end_dev/app/modules/home/controllers/checkout_controller.dart';

class OptionPayment extends GetView<CheckoutController> {
  const OptionPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Obx(() {
        final paymentSelected = controller.paymentType;
        final dataOptionPayment = controller.optionPayment;
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 8,
            children: List.generate(dataOptionPayment.length, (index) {
              final item = dataOptionPayment[index];
              final isActive = paymentSelected.value == item['value'];

              return GestureDetector(
                onTap: () {
                  paymentSelected.value = item['value'];
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Container(
                    width: 121,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      border: Border.all(
                        color: isActive ? Colors.white : borderMain,
                        width: 1,
                      ),
                    ),
                    child: Column(
                      spacing: 2,
                      children: [
                        Icon(
                          item['icon'],
                          size: 26,
                          color: isActive ? Colors.white : borderMain,
                        ),
                        Text(
                          item['name'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.barlow(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: isActive ? Colors.white : borderMain,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        );
      }),
    );
  }
}
