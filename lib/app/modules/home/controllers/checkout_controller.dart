import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  late TextEditingController cardNameController;
  late TextEditingController cardNumberController;
  late TextEditingController cardExpController;
  late TextEditingController cardCVVController;
  String? orderTypeController;
  Rx<bool> isLoading = false.obs;
  late TextEditingController tableController;

  @override
  void onInit() {
    super.onInit();
    cardNameController = TextEditingController();
    cardNumberController = TextEditingController();
    cardExpController = TextEditingController();
    cardCVVController = TextEditingController();
    orderTypeController = null;
    tableController = TextEditingController();
  }

  Future<void> submit() async {}
}
