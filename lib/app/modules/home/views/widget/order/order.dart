import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_front_end_dev/app/core/theme/theme.dart';
import 'package:testing_front_end_dev/app/modules/home/controllers/home_controller.dart';
import 'package:testing_front_end_dev/app/modules/home/controllers/order_controller.dart';
import 'package:testing_front_end_dev/app/modules/home/views/widget/order/count_order.dart';
import 'package:testing_front_end_dev/app/modules/home/views/widget/order/item.dart';

class OrderData extends GetView<HomeController> {
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
              return ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: order.length,
                itemBuilder: (context, index) {
                  return GetBuilder<OrderDetailController>(
                    tag: order[index].id.toString(),
                    key: ValueKey(order[index].id),
                    init: OrderDetailController(order[index]),
                    builder: (controller) {
                      final order =
                          controller.order.value; // bisa ambil langsung
                      return ItemOrder(order: order, controller: controller);
                    },
                  );
                },
              );
            }),
          ),
          CountOrder(),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: mainColor,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Continue to Payment',
                style: GoogleFonts.barlow(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
