import 'package:flutter/material.dart';
import 'package:siterelay/constant/app_colors.dart';
import 'package:siterelay/views/splash/widgets/progress_bar_widget.dart';

import '../welcome/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2800),
    )..forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed && mounted) {
        Future.delayed(const Duration(milliseconds: 400), () {
          if (!mounted) return;
          Navigator.of(context).pushReplacement(
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 500),
              pageBuilder: (_, __, ___) => const WelcomeScreen(),
              transitionsBuilder: (_, anim, __, child) =>
                  FadeTransition(opacity: anim, child: child),
            ),
          );
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Column(
        children: [
          SizedBox(height: 240),
          Image.asset(
            'assets/images/logo.png',
            errorBuilder: (_, __, ___) => const Icon(
              Icons.hexagon_outlined,
              color: AppColors.primaryColor,
              size: 36,
            ),
          ),
          Spacer(),

          ProgressBarWidget(controller: _controller),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
