import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/app_colors.dart';

class ChipWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconColor;
  final double iconSize;

  const ChipWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.iconColor,
    required this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.innerColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.primaryWhite.withAlpha(12)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: iconSize, color: iconColor),
          const SizedBox(width: 5),
          Text(
            label,
            style: GoogleFonts.inter(
              color: AppColors.primaryWhite.withAlpha(179),
              fontSize: 9.5,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
