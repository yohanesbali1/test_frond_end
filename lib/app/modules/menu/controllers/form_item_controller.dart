import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_front_end_dev/app/core/theme/theme.dart';
import 'package:testing_front_end_dev/app/core/widgets/custom_alert.widget.dart';

import 'package:testing_front_end_dev/app/data/models/models.dart' as models;
import 'package:testing_front_end_dev/app/modules/menu/controllers/menu_controller.dart';

class FormItemController extends GetxController {
  final models.Product? product;
  FormItemController(this.product);

  final TextEditingController productController = TextEditingController();
  final Rxn<String> productError = Rxn<String>();
  final TextEditingController priceController = TextEditingController();
  final Rxn<String> priceError = Rxn<String>();
  final TextEditingController stockController = TextEditingController();
  final Rxn<String> stockError = Rxn<String>();
  final isLoading = false.obs;
  final Rxn<models.Category> selectedCategory = Rxn<models.Category>(
    models.Category(id: 1, name: 'Hot Dish'),
  );

  final MenusController menusController = Get.find();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    if (product != null) {
      productController.text = product!.name;
      priceController.text = product!.price.toString();
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  bool validateProductName() {
    final val = productController.text.trim();
    if (val.isEmpty) {
      productError.value = 'product name is required';
      return false;
    }
    productError.value = null;
    return true;
  }

  bool validatePrice() {
    final val = priceController.text.trim();
    if (val.isEmpty) {
      priceError.value = 'price is required';
      return false;
    }
    if (!RegExp(r'^\d+$').hasMatch(val)) {
      priceError.value = 'price must be a number';
      return false;
    }
    priceError.value = null;
    return true;
  }

  bool validateStock() {
    final val = stockController.text.trim();
    if (val.isEmpty) {
      stockError.value = 'stock is required';
      return false;
    }
    if (!RegExp(r'^\d+$').hasMatch(val)) {
      stockError.value = 'stock must be a number';
      return false;
    }
    stockError.value = null;
    return true;
  }

  Future<void> submit() async {
    bool isValid = [
      validateProductName(),
      validatePrice(),
      validateStock(),
    ].every((v) => v);
    if (!isValid) {
      return;
    }

    CustomDialog.show(type: DialogType.loading, title: "Mengirim data...");

    try {
      await Future.delayed(Duration(seconds: 2));
      if (Get.isDialogOpen ?? false) Get.back();
      CustomDialog.show(
        type: DialogType.success,
        content: Container(
          height: 240,
          width: 400,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  Text(
                    product != null ? "Update Success" : "Create Success",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.barlow(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: mainColor,
                    ),
                  ),
                ],
              ),

              Positioned(
                top: -70, // bebas mau minus juga
                left: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/burger.gif',
                  height: 400,
                  width: 400,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      );
      await Future.delayed(Duration(seconds: 8));
      while (Get.isDialogOpen ?? false) {
        Get.back();
      }
    } catch (e) {
      CustomDialog.show(
        type: DialogType.error,
        content: Container(
          width: 400,
          height: 160,
          child: Column(
            children: [
              Icon(Icons.error_outline_outlined, size: 64, color: Colors.red),
              const SizedBox(height: 18),
              Text(
                product != null
                    ? "Update Product Failed"
                    : "Create Product Failed",
                textAlign: TextAlign.center,
                style: GoogleFonts.barlow(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: mainColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Please try again",
                textAlign: TextAlign.center,
                style: GoogleFonts.barlow(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: secondaryTextColor,
                ),
              ),
            ],
          ),
        ),
      );
      await Future.delayed(Duration(seconds: 2));
      if (Get.isDialogOpen ?? false) Get.back();
    }
  }
}
