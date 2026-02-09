import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_front_end_dev/app/core/widgets/text_form.widget.dart';
import 'package:testing_front_end_dev/app/modules/menu/controllers/form_item_controller.dart';

class FormDatas extends GetView<FormItemController> {
  const FormDatas({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 24,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 8,
              children: [
                Text(
                  "Product Name",
                  style: GoogleFonts.barlow(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                Obx(
                  () => CustomInputField(
                    controller: controller.productController,
                    hintText: 'Spagety...',
                    errorText: controller.productError.value,
                    keyboardType: TextInputType.text,
                    onChanged: (_) => controller.validateProductName(),
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
                  "Price",
                  style: GoogleFonts.barlow(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                Obx(
                  () => CustomInputField(
                    controller: controller.priceController,
                    hintText: '123456789',
                    errorText: controller.priceError.value,
                    keyboardType: TextInputType.number,
                    onChanged: (_) => controller.validatePrice(),
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
                  "Stock",
                  style: GoogleFonts.barlow(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                Obx(
                  () => CustomInputField(
                    controller: controller.stockController,
                    hintText: '12',
                    errorText: controller.stockError.value,
                    keyboardType: TextInputType.number,
                    onChanged: (_) => controller.validateStock(),
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
