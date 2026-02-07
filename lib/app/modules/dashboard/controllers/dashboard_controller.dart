import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController

  final count = 0.obs;
  final date = DateFormat('dd MMMM yyyy').format(DateTime.now());
  final List<Map<String, dynamic>> listDataCard = [
    {
      "percent": 32.40,
      "value": 151248138,
      "name": "Total Revenue",
      "icon": Icons.attach_money_outlined,
    },
    {
      "percent": -12.40,
      "value": 23.456,
      "name": "Total Dish Orderd",
      "icon": Icons.bookmark_border,
    },
    {
      "percent": 2.40,
      "value": 1234,
      "name": "Total Customer",
      "icon": Icons.groups_2_outlined,
    },
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
