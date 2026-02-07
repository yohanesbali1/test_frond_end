import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:testing_front_end_dev/app/core/theme/theme.dart';
import 'package:testing_front_end_dev/app/modules/home/controllers/home_controller.dart';

class SideBar extends GetView<HomeController> {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: bgBrown,
            ),
            child: Icon(Icons.storefront_outlined, size: 40, color: mainColor),
          ),
          SizedBox(height: 24),
          Obx(
            () => Container(
              width: double.infinity,
              child: Column(
                spacing: 20,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.change_page(0);
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      padding: const EdgeInsets.all(17),
                      decoration: BoxDecoration(
                        color: controller.page_index == 0
                            ? mainColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Icon(
                        Icons.home_outlined,
                        size: 32,
                        color: controller.page_index == 0
                            ? Colors.white
                            : mainColor,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.change_page(1);
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      padding: const EdgeInsets.all(17),
                      decoration: BoxDecoration(
                        color: controller.page_index == 1
                            ? mainColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Icon(
                        Icons.dashboard_outlined,
                        size: 32,
                        color: controller.page_index == 1
                            ? Colors.white
                            : mainColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
