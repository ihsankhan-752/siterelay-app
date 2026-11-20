import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siterelay/views/onboarding/widgets/burndown_widget.dart';
import 'package:siterelay/views/onboarding/widgets/chip_widget.dart';
import 'package:siterelay/views/onboarding/widgets/feature_card_widget.dart';
import 'package:siterelay/views/onboarding/widgets/team_sync_widget.dart';
import 'package:siterelay/views/onboarding/widgets/top_badge_widget.dart';
import 'package:siterelay/views/onboarding/widgets/topbar_widget.dart';
import 'package:siterelay/views/onboarding/widgets/velocity_widget.dart';
import 'package:siterelay/widgets/buttons.dart';

import '../../constant/app_colors.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Column(
          children: [
            TopBarWidget(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TopBadgeWidget(),
                    const SizedBox(height: 14),
                    Text(
                      'Everything Your Team\nNeeds.',
                      style: GoogleFonts.inter(
                        color: AppColors.primaryWhite,
                        fontSize: 26,
                        height: 1.15,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'A single mobile command center built for '
                      'high-performance project execution and site telemetry.',
                      style: GoogleFonts.inter(
                        color: AppColors.mutedColor,
                        fontSize: 12.5,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    FeatureCardWidget(
                      icon: Icons.business_outlined,
                      title: 'Manage Your Company',
                      tag: 'ORG',
                      description:
                          'Structure departments, onboard employees, and '
                          'maintain role-based governance across multiple '
                          'entities.',
                      footer: Row(
                        children: [
                          ChipWidget(
                            icon: Icons.circle,
                            label: 'Multi-Tenant Root',
                            iconColor: AppColors.greenColor,
                            iconSize: 6,
                          ),
                          const SizedBox(width: 8),
                          ChipWidget(
                            icon: Icons.verified_user_outlined,
                            label: 'RBAC Enforced',
                            iconColor: AppColors.mutedColor,
                            iconSize: 11,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    FeatureCardWidget(
                      icon: Icons.view_kanban_outlined,
                      title: 'Organize Projects',
                      tag: 'AGILE',
                      description:
                          'Group initiatives into clear milestones, allocate '
                          'project teams, and monitor deadlines effortlessly.',
                      footer: VelocityWidget(),
                    ),
                    const SizedBox(height: 12),
                    FeatureCardWidget(
                      icon: Icons.show_chart,
                      title: 'Track Tasks and Progress',
                      tag: 'LIVE',
                      tagColor: AppColors.greenColor,
                      description:
                          'Assign actionable tasks, log daily blocker relays, '
                          'and watch burndown velocity in real-time.',
                      footer: BurndownWidget(),
                    ),
                    const SizedBox(height: 14),
                    TeamSyncWidget(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: PrimaryButton(title: "Get Started"),
            ),
          ],
        ),
      ),
    );
  }
}
