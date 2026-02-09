import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_front_end_dev/app/core/theme/theme.dart';
import 'package:testing_front_end_dev/app/core/widgets/text_form.widget.dart';
import 'package:testing_front_end_dev/app/modules/casher/views/widget/category.dart';
import 'package:testing_front_end_dev/app/modules/casher/views/widget/item.dart';
import 'package:testing_front_end_dev/app/modules/casher/views/widget/order/order.dart';

import '../controllers/casher_controller.dart';

class CasherView extends GetView<CasherController> {
  const CasherView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: bgColor,
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 24,
                      horizontal: 20,
                    ),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 4,
                          children: [
                            Text(
                              'Made Resto',
                              style: GoogleFonts.barlow(
                                fontSize: 28,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              controller.date,
                              style: GoogleFonts.barlow(fontSize: 16),
                            ),
                          ],
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 260,
                          child: CustomInputField(
                            controller: controller.searchController,
                            hintText: 'Search for food, coffee, etc...',
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              controller.searchProduct(value);
                            },
                            prefix: Icon(
                              Icons.search_sharp,
                              size: 22,
                              color: secondaryTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CategoryItem(),
                  Expanded(child: ProductItem()),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(color: bgsecondColor),
              width: 400,
              child: SizedBox.expand(child: OrderData()),
            ),
          ],
        ),
      ),
    );
  }
}
