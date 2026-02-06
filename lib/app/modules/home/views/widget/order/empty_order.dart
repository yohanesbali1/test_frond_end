import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyOrder extends StatelessWidget {
  const EmptyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inventory_2_outlined,
            size: 52,
            color: Colors.white.withOpacity(0.4),
          ),
          const SizedBox(height: 10),
          Text(
            'Order is empty',
            style: GoogleFonts.barlow(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 3),
          Text(
            'add product to order',
            style: GoogleFonts.barlow(
              fontSize: 14,
              color: Colors.white.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}
