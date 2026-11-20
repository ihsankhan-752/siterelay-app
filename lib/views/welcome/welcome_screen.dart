import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siterelay/constant/app_colors.dart';
import 'package:siterelay/views/welcome/widgets/dot_widget.dart';
import 'package:siterelay/widgets/buttons.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
          child: Column(
            children: [
              Expanded(child: _buildHero()),
              const SizedBox(height: 28),
              Text(
                'Manage Work.\nAchieve More.',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 28,
                  height: 1.15,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'SiteRelay unifies your organizations, project teams, and '
                'delivery pipelines into one seamless mobile workspace.',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: AppColors.mutedColor,
                  fontSize: 13,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 22),
              dotWidget(),
              const SizedBox(height: 22),
              PrimaryButton(title: "Get Started"),
              const SizedBox(height: 10),
              _buildSecondaryButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHero() {
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
                child: Image.asset(
                  'assets/images/welcome_hero.png',
                  fit: BoxFit.contain,
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
            Positioned(
              left: 12,
              right: 12,
              bottom: 12,
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
                        color: Colors.white70,
                        fontSize: 8,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.6,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'v2.4',
                      style: GoogleFonts.jetBrainsMono(
                        color: AppColors.mutedColor,
                        fontSize: 9,
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

  Widget _buildSecondaryButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: TextButton(
        onPressed: () {
          // TODO: navigate to login screen
        },
        style: TextButton.styleFrom(
          backgroundColor: AppColors.surfaceHighColor,
          foregroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Text(
          'I Already Have an Account',
          style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
