import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing_front_end_dev/app/core/theme/theme.dart';
import 'package:testing_front_end_dev/app/data/models/models.dart';
import 'package:testing_front_end_dev/app/modules/home/controllers/home_controller.dart';

class ListItem extends GetView<HomeController> {
  final Product product_item;
  const ListItem({required this.product_item});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: double.infinity,
          height: 262,
          margin: const EdgeInsets.only(top: 80), // ruang untuk avatar
          decoration: BoxDecoration(
            color: bgsecondColor,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.only(
            top: 48,
            bottom: 12,
            left: 20,
            right: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 32),
              Text(
                product_item.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: GoogleFonts.barlow(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                product_item.price.toString(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.barlow(fontSize: 16),
              ),
            ],
          ),
        ),

        Positioned(
          top: 0,
          child: CircleAvatar(
            radius: 72,
            backgroundImage: NetworkImage(product_item.image ?? ''),
          ),
        ),
      ],
    );
  }
}
