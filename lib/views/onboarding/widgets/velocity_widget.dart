import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/app_colors.dart';

class VelocityWidget extends StatelessWidget {
  const VelocityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.innerColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.primaryWhite.withAlpha(12)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sprint 14 Velocity',
                style: GoogleFonts.jetBrainsMono(
                  color: AppColors.mutedColor,
                  fontSize: 9,
                ),
              ),
              Text(
                '88.4%',
                style: GoogleFonts.jetBrainsMono(
                  color: AppColors.primaryColor,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: LinearProgressIndicator(
              value: 0.884,
              minHeight: 5,
              backgroundColor: AppColors.primaryWhite.withAlpha(18),
              valueColor: const AlwaysStoppedAnimation(AppColors.accentColor),
            ),
          ),
        ],
      ),
    );
  }
}
