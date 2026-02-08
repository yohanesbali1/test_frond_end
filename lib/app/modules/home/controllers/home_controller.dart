import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt pageIndex = 0.obs;
  var pageController = PageController();

  final List<Map<String, dynamic>> listMenu = [
    {"icon": Icons.home_outlined, 'page_index': 0},
    {"icon": Icons.dashboard_outlined, 'page_index': 1},
  ];
  RxInt animatingIndex = (-1).obs;
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

  void changePage(dynamic payload) {
    pageIndex.value = payload;
    animatingIndex.value = payload;
    pageController.jumpToPage(payload);
    Future.delayed(const Duration(milliseconds: 350), () {
      animatingIndex.value = -1;
    });
  }
}
