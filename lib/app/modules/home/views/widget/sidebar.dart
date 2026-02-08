import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:testing_front_end_dev/app/core/theme/theme.dart';
import 'package:testing_front_end_dev/app/modules/home/controllers/home_controller.dart';

class SideBar extends GetView<HomeController> {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(24),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: bgBrown,
              ),
              child: Icon(
                Icons.storefront_outlined,
                size: 40,
                color: mainColor,
              ),
            ),
          ),
          SizedBox(height: 24),
          Obx(
            () => Container(
              width: double.infinity,
              child: Column(
                spacing: 20,
                children: List.generate(controller.ListMenu.length, (index) {
                  final item = controller.ListMenu[index];
                  return GestureDetector(
                    onTap: () {
                      controller.change_page(item['page_index']);
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      padding: const EdgeInsets.all(17),
                      decoration: BoxDecoration(
                        color: controller.page_index == item['page_index']
                            ? mainColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Icon(
                        item['icon'],
                        size: 32,
                        color: controller.page_index == item['page_index']
                            ? Colors.white
                            : mainColor,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
