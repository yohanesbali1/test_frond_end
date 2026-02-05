import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_front_end_dev/app/core/theme/theme.dart';
import 'package:testing_front_end_dev/app/data/models/models.dart';
import 'package:testing_front_end_dev/app/modules/home/controllers/order_controller.dart';

class ItemOrder extends GetView<OrderDetailController> {
  final OrderModel order;
  final int index;
  const ItemOrder({required this.order, required this.index});

  @override
  Widget build(BuildContext context) {
    controller.order = order;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        spacing: 10,
        children: [
          Row(
            spacing: 14,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(order.image ?? ''),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Text(
                      order.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.barlow(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      order.price.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.barlow(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: secondaryTextColor,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                child: Row(
                  spacing: 8,
                  children: [
                    SizedBox(
                      width: 48,
                      height: 48,
                      child: TextField(
                        controller: controller.qtyC,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        onChanged: (val) {
                          controller.home_c.updateNote(index, val);
                        },
                        keyboardType: TextInputType.number,
                        style: GoogleFonts.barlow(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Qty',
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: 14,
                          ),
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
                    Column(
                      spacing: 10,
                      children: [
                        Container(
                          child: Icon(Icons.arrow_circle_up, color: mainColor),
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
                  (order.total).toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
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
                  controller: controller.noteC,

                  onChanged: (val) {
                    controller.home_c.updateNote(index, val);
                  },
                  keyboardType: TextInputType.number,
                  style: GoogleFonts.barlow(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Order Note...',
                    hintStyle: GoogleFonts.barlow(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: secondaryTextColor,
                    ),
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 14,
                    ),
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
  }
}
