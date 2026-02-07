import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/casher_controller.dart';

class CasherView extends GetView<CasherController> {
  const CasherView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CasherView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CasherView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
