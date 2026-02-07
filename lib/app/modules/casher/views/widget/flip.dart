import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing_front_end_dev/app/modules/casher/controllers/flip_controller.dart';
import 'package:testing_front_end_dev/app/modules/casher/views/widget/list_item.dart';

class FlipItemWidget extends StatelessWidget {
  final dynamic productItem;

  FlipItemWidget({super.key, required this.productItem});

  final FlipController controller = Get.put(
    FlipController(),
    tag: UniqueKey().toString(),
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: controller.flip,
      child: AnimatedBuilder(
        animation: controller.animation,
        builder: (context, child) {
          final angle = controller.animation.value * pi;

          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(angle),
            child: angle <= pi / 2
                ? ListItem(product_item: productItem)
                : Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(pi),
                    child: ListItem(product_item: productItem),
                  ),
          );
        },
      ),
    );
  }
}
