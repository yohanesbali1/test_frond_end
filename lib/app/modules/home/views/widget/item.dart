import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_front_end_dev/app/modules/home/controllers/home_controller.dart';
import 'package:testing_front_end_dev/app/modules/home/views/widget/empty_product.dart';
import 'package:testing_front_end_dev/app/modules/home/views/widget/list_item.dart';

class ProductItem extends GetView<HomeController> {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        children: [
          Row(
            children: [
              Obx(
                () => Text(
                  controller.selectedCategory.value?.name ?? 'All Product',
                  style: GoogleFonts.barlow(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),
          Expanded(
            child: Obx(() {
              final productItem = controller.products;

              if (controller.isLoading.value) {
                return const SizedBox();
              }

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
                  // 🔑 key penting → trigger animasi saat data berubah
                  key: ValueKey(productItem.length),
                  behavior: const ScrollBehavior().copyWith(overscroll: false),
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: productItem.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 28,
                          crossAxisSpacing: 28,
                          childAspectRatio: 0.85,
                          crossAxisCount: 3,
                        ),
                    itemBuilder: (context, index) {
                      return GetBuilder<HomeController>(
                        id: 'item_$index',
                        builder: (_) {
                          return Listener(
                            onPointerDown: (_) => controller.press(index),
                            onPointerUp: (_) {
                              controller.release(index);
                              controller.addOrder(productItem[index]);
                            },
                            onPointerCancel: (_) => controller.release(index),
                            child: AnimatedScale(
                              scale: controller.scaleOf(index),
                              duration: const Duration(milliseconds: 90),
                              curve: Curves.easeOut,
                              child: ListItem(product_item: productItem[index]),
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
