import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing_front_end_dev/app/core/theme/theme.dart';
import 'package:testing_front_end_dev/app/modules/home/controllers/home_controller.dart';
import 'package:testing_front_end_dev/app/modules/home/controllers/order_controller.dart';
import 'package:testing_front_end_dev/app/modules/home/views/widget/empty_order.dart';
import 'package:testing_front_end_dev/app/modules/home/views/widget/order/count_order.dart';
import 'package:testing_front_end_dev/app/modules/home/views/widget/order/item.dart';

class OrderModal extends GetView<HomeController> {
  const OrderModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: borderMain, width: 1)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 8,
              children: [
                Text(
                  'Confirmation',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Orders #34562',
                  style: TextStyle(
                    fontSize: 16,
                    color: secondaryTextColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              final order = controller.order;
              if (order.isEmpty) return const EmptyOrder();
              return ScrollConfiguration(
                behavior: const ScrollBehavior().copyWith(overscroll: false),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: order.length,
                  itemBuilder: (context, index) {
                    final item = order[index];

                    return GetBuilder<OrderDetailController>(
                      tag: item.id.toString(),
                      key: ValueKey(item.id),
                      init: OrderDetailController(item.id),
                      builder: (controller) {
                        return ItemOrder(
                          order: controller.order,
                          controller: controller,
                          isEditable: false,
                        );
                      },
                    );
                  },
                ),
              );
            }),
          ),
          CountOrder(),
        ],
      ),
    );
  }
}
