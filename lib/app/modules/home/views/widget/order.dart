import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_front_end_dev/app/core/theme/theme.dart';
import 'package:testing_front_end_dev/app/modules/home/controllers/home_controller.dart';

class OrderData extends GetView<HomeController> {
  const OrderData({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              children: [
                Text(
                  "Order",
                  style: GoogleFonts.barlow(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: borderMain, width: 1)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Item",
                    style: GoogleFonts.barlow(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Price",
                    style: GoogleFonts.barlow(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Quantity",
                    style: GoogleFonts.barlow(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Obx(() {
            final order = controller.order;
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: order.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                  child: Column(
                    spacing: 10,
                    children: [
                      Row(
                        spacing: 14,
                        children: [
                          CircleAvatar(
                            radius: 48,
                            backgroundImage: NetworkImage(order[index].image),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 4,
                            children: [
                              Text(
                                order[index].name,
                                style: GoogleFonts.barlow(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                order[index].price.toString(),
                                style: GoogleFonts.barlow(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: secondaryTextColor,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Container(
                            child: Row(
                              children: [
                                Column(
                                  spacing: 10,
                                  children: [
                                    Container(
                                      child: Icon(
                                        Icons.arrow_circle_up,
                                        color: mainColor,
                                      ),
                                    ),
                                    Container(
                                      child: Icon(
                                        Icons.arrow_circle_down,
                                        color: mainColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Text(
                              (order[index].qty * order[index].price)
                                  .toString(),
                              style: GoogleFonts.barlow(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        spacing: 20,
                        children: [
                          Expanded(
                            child: TextField(
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]'),
                                ),
                              ],

                              keyboardType: TextInputType.number,
                              style: GoogleFonts.barlow(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              decoration: InputDecoration(
                                fillColor: bgInput,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: borderMain, // border pas fokus
                                    width: 2,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: borderMain, // border normal
                                    width: 1,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: mainColor, // border pas fokus
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              border: Border.all(color: mainColor, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(Icons.delete, color: redColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          }),
        ],
      ),
    );
  }
}
