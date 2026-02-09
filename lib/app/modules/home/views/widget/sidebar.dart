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
              padding: const EdgeInsets.all(6),
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
          Obx(() {
            const double itemSize = 56;
            const double spacing = 40;

            return SizedBox(
              width: double.infinity,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    top: controller.pageIndex.value * (itemSize + spacing),
                    left: 13,
                    child: SizedBox(
                      width: 104,
                      height: 88,
                      child: Container(
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            bottomLeft: Radius.circular(24),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      spacing: spacing - 32,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(controller.listMenu.length, (
                        index,
                      ) {
                        final item = controller.listMenu[index];
                        final isActive =
                            controller.pageIndex.value == item['page_index'];

                        return GestureDetector(
                          onTap: () {
                            controller.changePage(item['page_index']);
                          },
                          child: Container(
                            height: 62,
                            width: 62,
                            margin: const EdgeInsets.only(top: 13, bottom: 13),
                            padding: const EdgeInsets.all(17),
                            decoration: BoxDecoration(
                              color: isActive ? mainColor : Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              item['icon'],
                              size: 28,
                              color: isActive ? Colors.white : mainColor,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
