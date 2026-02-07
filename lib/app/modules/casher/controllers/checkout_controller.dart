import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_front_end_dev/app/core/theme/theme.dart';
import 'package:testing_front_end_dev/app/core/widgets/custom_alert.widget.dart';
import 'package:testing_front_end_dev/app/modules/casher/controllers/casher_controller.dart';

class CheckoutController extends GetxController {
  late TextEditingController cardNameController;
  final Rxn<String> cardnameError = Rxn<String>();
  late TextEditingController cardNumberController;
  final Rxn<String> cardnumberError = Rxn<String>();
  late TextEditingController cardExpController;
  final Rxn<String> cardexpError = Rxn<String>();
  late TextEditingController cardCVVController;
  final Rxn<String> cardcvvError = Rxn<String>();
  final Rxn<String> orderTypeController = Rxn<String>();
  final Rxn<String> ordertypeError = Rxn<String>();
  late TextEditingController tableController;
  final Rxn<String> tableError = Rxn<String>();
  Rx<bool> isLoading = false.obs;
  Rx<String> paymentType = "credit".obs;
  final List<Map<String, dynamic>> optionPayment = [
    {"value": "credit", "name": "Credit Card", "icon": Icons.credit_card},
    {"value": "paypal", "name": "PayPal", "icon": Icons.paypal_outlined},
    {"value": "cash", "name": "Cash", "icon": Icons.wallet_outlined},
  ];

  final casher_c = Get.find<CasherController>();

  @override
  void onInit() {
    super.onInit();
    cardNameController = TextEditingController();
    cardNumberController = TextEditingController();
    cardExpController = TextEditingController();
    cardCVVController = TextEditingController();
    tableController = TextEditingController();
  }

  bool validateCardName() {
    final val = cardNameController.text.trim();
    if (val.isEmpty) {
      cardnameError.value = 'Name card is required';
      return false;
    }
    cardnameError.value = null;
    return true;
  }

  bool validateCardNumber() {
    final val = cardNumberController.text.trim();
    if (val.isEmpty) {
      cardnumberError.value = 'number card is required';
      return false;
    }
    if (!RegExp(r'^\d+$').hasMatch(val)) {
      cardnumberError.value = 'number card must be a number';
      return false;
    }
    cardnumberError.value = null;
    return true;
  }

  bool validateCardExp() {
    final val = cardExpController.text.trim();
    if (val.isEmpty) {
      cardexpError.value = 'expiration date is required';
      return false;
    }
    try {
      DateTime.parse(val);
      cardexpError.value = null;
      return true;
    } catch (_) {
      cardexpError.value = 'date format must be yyyy-mm-dd';
      return false;
    }
  }

  bool validateCVV() {
    final val = cardCVVController.text.trim();
    if (!RegExp(r'^\d{3,4}$').hasMatch(val)) {
      cardcvvError.value = 'CVV must be 3-4 digits';
      return false;
    }
    cardcvvError.value = null;
    return true;
  }

  bool validateOrderType() {
    if (orderTypeController.value == null) {
      ordertypeError.value = 'Order must be selected';
      return false;
    }
    ordertypeError.value = null;
    return true;
  }

  bool validateTable() {
    final val = tableController.text.trim();
    if (val.isEmpty) {
      tableError.value = 'Table no is required';
      return false;
    }
    if (!RegExp(r'^\d+$').hasMatch(val)) {
      tableError.value = 'Table no must be a number';
      return false;
    }
    tableError.value = null;
    return true;
  }

  Future<void> submit() async {
    bool isValid = true;
    if (paymentType.value == "credit") {
      isValid = [
        validateCardName(),
        validateCardNumber(),
        validateCardExp(),
        validateCVV(),
        validateOrderType(),
        validateTable(),
      ].every((v) => v);
    }
    if (!isValid) {
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
                "Order Failed",
                textAlign: TextAlign.center,
                style: GoogleFonts.barlow(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: mainColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Check your input data",
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
      Get.back();
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
                    "Order Success",
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

      casher_c.order.clear();
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
                "Order Failed",
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
