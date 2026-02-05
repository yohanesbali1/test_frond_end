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
            spacing: 32,
            children: List.generate(dataCategory.length, (index) {
              final item = dataCategory[index];
              final isActive = controller.selectedIndex.value == index;

              return GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: isActive ? mainColor : Colors.transparent,
                        width: 2,
                      ),
                    ),
                  ),
                  child: Text(
                    item.name,
                    style: GoogleFonts.barlow(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: isActive ? mainColor : Colors.white,
                    ),
                  ),
                ),
              );
            }),
          ),
        );
      }),
    );
  }
}
