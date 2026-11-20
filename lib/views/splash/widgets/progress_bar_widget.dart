import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/app_colors.dart';

class ProgressBarWidget extends StatelessWidget {
  final AnimationController controller;
  const ProgressBarWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 56),
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, _) {
          final value = Curves.easeInOut.transform(controller.value);
          return Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: LinearProgressIndicator(
                  value: value,
                  minHeight: 3,
                  backgroundColor: Colors.white.withAlpha(20),
                  valueColor: const AlwaysStoppedAnimation(
                    AppColors.primaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Connected to Edge',
                    style: GoogleFonts.jetBrainsMono(
                      color: AppColors.mutedColor,
                      fontSize: 9,
                    ),
                  ),
                  Text(
                    '${(value * 100).round()}%',
                    style: GoogleFonts.jetBrainsMono(
                      color: Colors.white70,
                      fontSize: 9,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Text(
                'v1.0.0  •  ENTERPRISE READY',
                style: GoogleFonts.inter(
                  color: AppColors.primaryWhite.withValues(alpha: 0.5),
                  fontSize: 10,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
