import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController

  final count = 0.obs;
  final date = DateFormat('dd MMMM yyyy').format(DateTime.now());
  final RxBool isShow = RxBool(true);
  final List<Map<String, dynamic>> listDataCard = [
    {
      "percent": 32.40,
      "value": 151248138,
      "name": "Total Revenue",
      "icon": Icons.attach_money_outlined,
      "icon_color": Colors.deepPurpleAccent,
      "withCurrency": true,
    },
    {
      "percent": -12.40,
      "value": 23.456,
      "name": "Total Dish Orderd",
      "icon": Icons.bookmark_border,
      "icon_color": Colors.orange,
      "withCurrency": false,
    },
    {
      "percent": 2.40,
      "value": 1234,
      "name": "Total Customer",
      "icon": Icons.groups_2_outlined,
      "icon_color": Colors.lightBlueAccent,
      "withCurrency": false,
    },
  ];

  final RxList<Map<String, dynamic>> orderDataCard = [
    {
      "customer": "Sofian Hadi",
      "menu": "Spicy seasoned seafood noodles ",
      "totalPayment": 43000,
      "status": "Completed",
    },
    {
      "customer": "Kadek",
      "menu": "Salted Pasta with mushroom sauce ",
      "totalPayment": 33000,
      "status": "Completed",
    },
  ].obs;
  final RxList<Map<String, dynamic>> mostorderDataCard = [
    {
      "menu": "Spicy seasoned seafood noodles",
      "total": 200,
      "image":
          "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
    },
    {
      "menu": "Salted pasta with mushroom sauce ",
      "total": 100,
      "image":
          "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
    },
  ].obs;

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
