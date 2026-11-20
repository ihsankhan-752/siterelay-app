import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/app_colors.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: AppColors.iconBoxColor,
              borderRadius: BorderRadius.circular(7),
            ),
            child: const Icon(
              Icons.hexagon_outlined,
              color: AppColors.accentColor,
              size: 15,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'SiteRelay',
            style: GoogleFonts.inter(
              color: AppColors.primaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
