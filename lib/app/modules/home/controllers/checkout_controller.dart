import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class CheckoutController extends GetxController {
  late TextEditingController cardNameController;
  late TextEditingController cardNumberController;
  late TextEditingController cardExpController;
  late TextEditingController cardCVVController;
  String? orderTypeController;
  late TextEditingController tableController;

  @override
  void onInit() {
    super.onInit();
    cardNameController = TextEditingController();
    cardNumberController = TextEditingController();
    cardExpController = TextEditingController();
    cardCVVController = TextEditingController();
    tableController = TextEditingController();
  }
}
