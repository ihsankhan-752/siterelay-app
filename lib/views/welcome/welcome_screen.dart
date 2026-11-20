import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siterelay/constant/app_colors.dart';
import 'package:siterelay/views/splash/splash_screen.dart';
import 'package:siterelay/views/welcome/widgets/dot_widget.dart';
import 'package:siterelay/views/welcome/widgets/hero_widget.dart';
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
              Expanded(child: HeroWidget()),
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
              PrimaryButton(
                title: "Get Started",
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => SplashScreen()),
                  );
                },
              ),
              const SizedBox(height: 10),
              PrimaryButton(
                title: "I already have an account",
                btnColor: AppColors.surfaceColor,
                titleColor: AppColors.primaryWhite,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
