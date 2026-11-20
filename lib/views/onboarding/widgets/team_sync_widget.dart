import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/app_colors.dart';

class TeamSyncWidget extends StatelessWidget {
  const TeamSyncWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Widget avatar(Color color, String text, double left) => Positioned(
      left: left,
      child: Container(
        width: 22,
        height: 22,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.cardColor, width: 2),
        ),
        child: Text(
          text,
          style: GoogleFonts.inter(
            color: AppColors.primaryWhite,
            fontSize: 8,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.primaryWhite.withAlpha(12)),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 56,
            height: 22,
            child: Stack(
              children: [
                avatar(const Color(0xFF3B3F5C), 'JK', 0),
                avatar(const Color(0xFF5B5FC7), 'S', 14),
                avatar(const Color(0xFF4749B3), '+5', 28),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Team sync active in #us-east',
              style: GoogleFonts.inter(
                color: AppColors.primaryWhite.withAlpha(179),
                fontSize: 11,
              ),
            ),
          ),
          const Icon(Icons.sensors, color: AppColors.greenColor, size: 16),
        ],
      ),
    );
  }
}
