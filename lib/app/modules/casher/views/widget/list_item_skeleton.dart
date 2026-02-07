import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:testing_front_end_dev/app/core/theme/theme.dart';

class ListItemSkeleton extends StatelessWidget {
  const ListItemSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        // Card skeleton
        Container(
          width: double.infinity,
          height: 262,
          margin: const EdgeInsets.only(top: 80),
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
              const SizedBox(height: 32),
              // Name skeleton
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(width: 120, height: 18, color: Colors.white),
              ),
              const SizedBox(height: 8),
              // Price skeleton
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(width: 80, height: 16, color: Colors.white),
              ),
            ],
          ),
        ),
        // Avatar skeleton
        Positioned(
          top: 0,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: CircleAvatar(radius: 72, backgroundColor: Colors.white),
          ),
        ),
      ],
    );
  }
}
