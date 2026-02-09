import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_front_end_dev/app/core/theme/theme.dart';
import 'package:testing_front_end_dev/app/modules/dashboard/controllers/dashboard_controller.dart';

class MostOrder extends GetView<DashboardController> {
  const MostOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: bgsecondColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: borderMain, width: 1)),
            ),
            child: Row(
              children: [
                Text(
                  'Most Order',
                  style: GoogleFonts.barlow(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(overscroll: false),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: controller.mostorderDataCard.length,
                itemBuilder: (context, index) {
                  final data = controller.mostorderDataCard[index];

                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      spacing: 16,
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: bgColor,
                          backgroundImage: NetworkImage(data['image'] ?? ''),
                        ),
                        Column(
                          spacing: 4,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              data['menu'] ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.barlow(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "${data['total'] ?? ''} dishes ordered",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.barlow(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Obx(
            () => SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  disabledBackgroundColor: controller.isShow.value
                      ? mainColor.withOpacity(0.6)
                      : redColor.withOpacity(0.6),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: controller.isShow.value ? mainColor : redColor,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  controller.isShow(!controller.isShow.value);
                },
                child: Text(
                  "${controller.isShow.value ? 'View All' : 'Hide'} Most Order",
                  style: GoogleFonts.barlow(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: controller.isShow.value ? mainColor : redColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
