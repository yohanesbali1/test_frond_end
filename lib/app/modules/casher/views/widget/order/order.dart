import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_front_end_dev/app/core/theme/theme.dart';
import 'package:testing_front_end_dev/app/modules/casher/controllers/casher_controller.dart';
import 'package:testing_front_end_dev/app/modules/casher/controllers/order_controller.dart';
import 'package:testing_front_end_dev/app/modules/casher/views/widget/empty_order.dart';
import 'package:testing_front_end_dev/app/modules/casher/views/widget/order/count_order.dart';
import 'package:testing_front_end_dev/app/modules/casher/views/widget/order/item.dart';

class OrderData extends GetView<CasherController> {
  const OrderData({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                Text(
                  "Order",
                  style: GoogleFonts.barlow(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: borderMain, width: 1)),
            ),
            child: Row(
              children: [
                Container(
                  child: Text(
                    "Item",
                    style: GoogleFonts.barlow(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  child: Text(
                    "Qty",
                    style: GoogleFonts.barlow(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                SizedBox(width: 40),
                Container(
                  child: Text(
                    "Price",
                    style: GoogleFonts.barlow(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
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
                        );
                      },
                    );
                  },
                ),
              );
            }),
          ),
          CountOrder(),
          Obx(() {
            return AnimatedScale(
              scale: controller.isLoading.value ? 1.0 : 1.0,
              duration: const Duration(milliseconds: 100),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainColor,
                    disabledBackgroundColor: mainColor.withOpacity(0.6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: controller.order.isEmpty
                      ? null
                      : () async {
                          await controller.submit();
                        },
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: controller.isLoading.value
                        ? SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white.withOpacity(0.8),
                            ),
                          )
                        : Text(
                            "Continue to Payment",
                            style: GoogleFonts.barlow(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
