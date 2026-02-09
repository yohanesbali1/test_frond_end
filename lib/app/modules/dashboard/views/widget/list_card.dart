import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_front_end_dev/app/core/helper/helper.dart';
import 'package:testing_front_end_dev/app/core/theme/theme.dart';
import 'package:testing_front_end_dev/app/modules/dashboard/controllers/dashboard_controller.dart';

class ListCard extends GetView<DashboardController> {
  const ListCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 24),
      child: Row(
        children: List.generate(controller.listDataCard.length, (index) {
          final dataCard = controller.listDataCard;
          final item = dataCard[index];
          return Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 24),
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: bgsecondColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 10,
                children: [
                  Row(
                    spacing: 10,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          item['icon'],
                          size: 22,
                          color: item['icon_color'],
                        ),
                      ),
                      Text(
                        "${item['percent'] >= 0 ? '+' : ''}${item['percent'].toString()}%",
                        style: GoogleFonts.barlow(
                          color: item['percent'] >= 0
                              ? Colors.green
                              : Colors.red,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: item['percent'] >= 0
                            ? Colors.green
                            : Colors.redAccent,
                        child: Icon(
                          item['percent'] >= 0
                              ? Icons.arrow_upward
                              : Icons.arrow_downward,
                          color: Colors.white,
                          size: 12,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    Helper.formatRupiah(
                      item['value'].toDouble(),
                      withRp: item['withCurrency'],
                    ),
                    style: GoogleFonts.barlow(
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    item['name'],
                    style: GoogleFonts.barlow(
                      fontSize: 14,
                      color: secondaryTextColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
