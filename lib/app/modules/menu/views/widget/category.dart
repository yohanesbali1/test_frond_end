import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_front_end_dev/app/core/theme/theme.dart';
import 'package:testing_front_end_dev/app/modules/menu/controllers/menu_controller.dart';

class CategoryItem extends GetView<MenusController> {
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
              final isActive = controller.selectedCategory.value?.id == item.id;

              return GestureDetector(
                onTap: () {
                  controller.selectedCategory.value = item;
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: isActive ? mainColor : Colors.transparent,
                        width: 2,
                      ),
                    ),
                  ),
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    style: GoogleFonts.barlow(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: isActive ? mainColor : Colors.white,
                    ),
                    child: Text(item.name),
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
