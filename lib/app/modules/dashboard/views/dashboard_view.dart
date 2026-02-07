import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:testing_front_end_dev/app/core/theme/theme.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: null,
      body: const Center(
        child: Text('DashboardView is working', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
