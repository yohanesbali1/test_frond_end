import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_front_end_dev/app/core/theme/theme.dart';
import 'package:testing_front_end_dev/app/modules/home/controllers/home_controller.dart';
import 'package:testing_front_end_dev/app/modules/home/views/widget/list_item.dart';

class ProductItem extends GetView<HomeController> {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        spacing: 30,
        children: [
          Row(
            children: [
              Text(
                "Choso Dishes",
                style: GoogleFonts.barlow(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Obx(() {
            final product_item = controller.products;
            if (controller.isLoading.value) {
              return SizedBox();
            }
            if (product_item.isEmpty) return SizedBox();
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: product_item.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 28,
                crossAxisSpacing: 28,
                childAspectRatio: 0.85,
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                return ListItem(product_item: product_item[index]);
              },
            );
          }),
        ],
      ),
    );
  }
}
