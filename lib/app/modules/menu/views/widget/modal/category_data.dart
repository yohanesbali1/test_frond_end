import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_front_end_dev/app/core/theme/theme.dart';
import 'package:testing_front_end_dev/app/modules/menu/controllers/form_item_controller.dart';

class CategoryFormItem extends GetView<FormItemController> {
  const CategoryFormItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 20, bottom: 38),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: borderMain, width: 1)),
      ),
      child: Obx(() {
        final dataCategory = controller.menusController.category;
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            spacing: 14,
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
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                    color: isActive ? mainColor : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isActive ? mainColor : borderMain,
                      width: 1,
                    ),
                  ),
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    style: GoogleFonts.barlow(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: isActive ? Colors.white : mainColor,
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
