import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rxn<int> page_index = Rxn<int>(0);
  var pageController = PageController();

  final List<Map<String, dynamic>> ListMenu = [
    {"icon": Icons.home_outlined, 'page_index': 0},
    {"icon": Icons.dashboard_outlined, 'page_index': 1},
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

  void change_page(dynamic payload) {
    page_index.value = payload;
    pageController.jumpToPage(payload);
  }
}
