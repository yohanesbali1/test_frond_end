import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_front_end_dev/app/core/theme/theme.dart';
import 'package:testing_front_end_dev/app/core/widgets/text_form.widget.dart';
import 'package:testing_front_end_dev/app/modules/casher/controllers/checkout_controller.dart';

class OrderTable extends GetView<CheckoutController> {
  const OrderTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: borderMain, width: 1)),
      ),
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
                  Obx(
                    () => CustomInputField(
                      isDropdown: true,
                      value: controller.orderTypeController.value,
                      dropdownItems: ['dine in', 'take away', 'delivery'],
                      hintText: 'Select Type',
                      errorText: controller.ordertypeError.value,
                      onChanged: (value) {
                        controller.orderTypeController.value = value;
                        return controller.validateOrderType();
                      },
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
                    "Table no.",
                    style: GoogleFonts.barlow(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Obx(
                    () => CustomInputField(
                      controller: controller.tableController,
                      hintText: '001',
                      errorText: controller.tableError.value,
                      keyboardType: TextInputType.number,
                      onChanged: (_) => controller.validateTable(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
