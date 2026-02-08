import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_front_end_dev/app/core/theme/theme.dart';
import 'package:testing_front_end_dev/app/modules/dashboard/views/widget/list_card.dart';
import 'package:testing_front_end_dev/app/modules/dashboard/views/widget/most_order.dart';
import 'package:testing_front_end_dev/app/modules/dashboard/views/widget/most_type_order.dart';
import 'package:testing_front_end_dev/app/modules/dashboard/views/widget/order_report.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: null,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 24,
            children: [
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 4,
                              children: [
                                Text(
                                  'Dashboard',
                                  style: GoogleFonts.barlow(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Text(
                                  controller.date,
                                  style: GoogleFonts.barlow(fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 1,
                        decoration: BoxDecoration(color: borderMain),
                      ),
                      ListCard(),
                      OrderReport(),
                    ],
                  ),
                ),
              ),
              Container(
                width: 372,
                child: Column(
                  spacing: 24,
                  children: [
                    Expanded(
                      flex: controller.isShow.value ? 1 : 2,
                      child: MostOrder(),
                    ),
                    Obx(
                      () => Expanded(
                        flex: controller.isShow.value ? 1 : 0,
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          switchInCurve: Curves.easeInOut,
                          switchOutCurve: Curves.easeInOut,
                          child: controller.isShow.value
                              ? MostTypeOrder()
                              : const SizedBox.shrink(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
