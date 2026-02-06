import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlipController extends GetxController with SingleGetTickerProviderMixin {
  late AnimationController animation;
  var isFront = true.obs;

  @override
  void onInit() {
    super.onInit();
    animation = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
  }

  void flip() {
    if (isFront.value) {
      animation.forward();
    } else {
      animation.reverse();
    }
    isFront.toggle();
  }

  @override
  void onClose() {
    animation.dispose();
    super.onClose();
  }
}
