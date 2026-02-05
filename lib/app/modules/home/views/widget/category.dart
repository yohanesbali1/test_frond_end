import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_front_end_dev/app/core/theme/theme.dart';
import 'package:testing_front_end_dev/app/modules/home/controllers/home_controller.dart';

class CategoryItem extends GetView<HomeController> {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: borderMain, width: 1)),
      ),
      child: Obx(() {
        final dataCategory = controller.category;
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: dataCategory.map((item) {
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                margin: const EdgeInsets.only(right: 16),
                child: Text(
                  item.name,
                  style: GoogleFonts.barlow(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }).toList(),
          ),
        );
      }),
    );
  }
}
