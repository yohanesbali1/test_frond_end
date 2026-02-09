import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_front_end_dev/app/core/theme/theme.dart';
import 'package:testing_front_end_dev/app/modules/menu/controllers/form_item_controller.dart';
import 'package:testing_front_end_dev/app/modules/menu/views/widget/modal/category_data.dart';
import 'package:testing_front_end_dev/app/modules/menu/views/widget/modal/form_data.dart';

class CustomRightModal extends GetView<FormItemController> {
  final double width;

  const CustomRightModal({Key? key, this.width = 440}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Maksimal tinggi = tinggi layar - margin
    final screenHeight = MediaQuery.of(context).size.height;

    return Align(
      alignment: Alignment.centerRight,
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: width,
          height: screenHeight,
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(right: 16, top: 25, bottom: 25),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                controller.product != null ? "Edit Dish" : "Add New Dish",
                style: GoogleFonts.barlow(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              CategoryFormItem(),
              Expanded(child: FormDatas()),
              Obx(() {
                return AnimatedScale(
                  scale: 1.0,
                  duration: const Duration(milliseconds: 100),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 48,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              disabledBackgroundColor: Colors.transparent
                                  .withOpacity(0.6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(color: mainColor, width: 2),
                              ),
                            ),
                            onPressed: controller.isLoading.value
                                ? null
                                : () async {
                                    Get.back();
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
                                      "Cancel",
                                      style: GoogleFonts.barlow(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: SizedBox(
                          height: 48,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: mainColor,
                              disabledBackgroundColor: mainColor.withOpacity(
                                0.6,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: controller.isLoading.value
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
                                      "Save",
                                      style: GoogleFonts.barlow(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
