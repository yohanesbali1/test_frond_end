import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_front_end_dev/app/core/theme/theme.dart';
import 'package:testing_front_end_dev/app/modules/home/views/widget/category.dart';
import 'package:testing_front_end_dev/app/modules/home/views/widget/item.dart';
import 'package:testing_front_end_dev/app/modules/home/views/widget/order.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: bgColor,
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 24,
                        horizontal: 20,
                      ),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 4,
                            children: [
                              Text(
                                'Made Resto',
                                style: GoogleFonts.barlow(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
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
                    CategoryItem(),
                    ProductItem(),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: bgsecondColor),
              width: 400,
              child: SizedBox.expand(child: OrderData()),
            ),
          ],
        ),
      ),
    );
  }
}
