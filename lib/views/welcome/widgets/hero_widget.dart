import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/app_colors.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.surfaceColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withAlpha(15)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 56),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/welcome.avif',
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const Center(
                      child: Icon(
                        Icons.hub_outlined,
                        color: Color(0xFF8083FF),
                        size: 96,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 12,
              right: 12,
              bottom: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 9,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF0E1118),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white.withAlpha(15)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: AppColors.greenColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'PIPELINES 100% OPERATIONAL',
                      style: GoogleFonts.jetBrainsMono(
                        color: AppColors.primaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.6,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
