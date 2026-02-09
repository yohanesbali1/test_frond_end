import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing_front_end_dev/app/modules/menu/views/widget/empty_product.dart';
import 'package:testing_front_end_dev/app/modules/menu/controllers/menu_controller.dart';
import 'package:testing_front_end_dev/app/modules/menu/views/widget/item_add.dart';
import 'package:testing_front_end_dev/app/modules/menu/views/widget/list_item.dart';

class ProductItem extends GetView<MenusController> {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        children: [
          Expanded(
            child: Obx(() {
              final productItem = controller.products;

              if (productItem.isEmpty) {
                return const EmptyProduct();
              }
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                switchInCurve: Curves.easeIn,
                switchOutCurve: Curves.easeOut,
                transitionBuilder: (child, animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child: ScrollConfiguration(
                  key: ValueKey(productItem.length),
                  behavior: const ScrollBehavior().copyWith(overscroll: false),
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: productItem.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 28,
                          crossAxisSpacing: 28,
                          childAspectRatio: 0.75,
                          crossAxisCount: 4,
                        ),
                    itemBuilder: (context, index) {
                      return GetBuilder<MenusController>(
                        id: 'item_$index',
                        builder: (_) {
                          return Listener(
                            onPointerDown: (_) => controller.press(index),
                            onPointerUp: (_) {
                              controller.release(index);
                            },
                            onPointerCancel: (_) => controller.release(index),
                            child: AnimatedScale(
                              scale: controller.scaleOf(index),
                              duration: const Duration(milliseconds: 90),
                              curve: Curves.easeOut,
                              child: index == 0
                                  ? GestureDetector(
                                      onTap: () {
                                        controller.openModal();
                                      },
                                      child: ItemAdd(),
                                    )
                                  : ListItems(product_item: productItem[index]),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
