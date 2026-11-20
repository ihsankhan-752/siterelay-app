import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                    _buildBadge(),
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
                    _buildFeatureCard(
                      icon: Icons.business_outlined,
                      title: 'Manage Your Company',
                      tag: 'ORG',
                      description:
                          'Structure departments, onboard employees, and '
                          'maintain role-based governance across multiple '
                          'entities.',
                      footer: Row(
                        children: [
                          _chip(
                            Icons.circle,
                            'Multi-Tenant Root',
                            iconColor: AppColors.greenColor,
                            iconSize: 6,
                          ),
                          const SizedBox(width: 8),
                          _chip(
                            Icons.verified_user_outlined,
                            'RBAC Enforced',
                            iconColor: AppColors.mutedColor,
                            iconSize: 11,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildFeatureCard(
                      icon: Icons.view_kanban_outlined,
                      title: 'Organize Projects',
                      tag: 'AGILE',
                      description:
                          'Group initiatives into clear milestones, allocate '
                          'project teams, and monitor deadlines effortlessly.',
                      footer: _buildVelocity(),
                    ),
                    const SizedBox(height: 12),
                    _buildFeatureCard(
                      icon: Icons.show_chart,
                      title: 'Track Tasks and Progress',
                      tag: 'LIVE',
                      tagColor: AppColors.greenColor,
                      description:
                          'Assign actionable tasks, log daily blocker relays, '
                          'and watch burndown velocity in real-time.',
                      footer: _buildBurndown(),
                    ),
                    const SizedBox(height: 14),
                    _buildTeamSync(),
                  ],
                ),
              ),
            ),
            _buildBottom(),
          ],
        ),
      ),
    );
  }

  // ───────────────────────── Top bar / header ─────────────────────────

  Widget TopBarWidget() {
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

  Widget _buildBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.accentColor.withAlpha(35),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.accentColor.withAlpha(70)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 5,
            height: 5,
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            'ONBOARDING 03/03',
            style: GoogleFonts.jetBrainsMono(
              color: AppColors.primaryColor,
              fontSize: 9,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.8,
            ),
          ),
        ],
      ),
    );
  }

  // ───────────────────────── Feature card ─────────────────────────

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String tag,
    required String description,
    required Widget footer,
    Color tagColor = AppColors.mutedColor,
  }) {
    final isLive = tagColor == AppColors.greenColor;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.primaryWhite.withAlpha(12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.iconBoxColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: AppColors.primaryColor, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            title,
                            style: GoogleFonts.inter(
                              color: AppColors.primaryWhite,
                              fontSize: 13.5,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: isLive
                                ? AppColors.greenColor.withAlpha(30)
                                : AppColors.primaryWhite.withAlpha(15),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (isLive) ...[
                                Container(
                                  width: 5,
                                  height: 5,
                                  decoration: const BoxDecoration(
                                    color: AppColors.greenColor,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 4),
                              ],
                              Text(
                                tag,
                                style: GoogleFonts.jetBrainsMono(
                                  color: isLive
                                      ? AppColors.greenColor
                                      : AppColors.primaryWhite.withAlpha(179),
                                  fontSize: 8,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      description,
                      style: GoogleFonts.inter(
                        color: AppColors.mutedColor,
                        fontSize: 11.5,
                        height: 1.45,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          footer,
        ],
      ),
    );
  }

  Widget _chip(
    IconData icon,
    String label, {
    required Color iconColor,
    required double iconSize,
  }) {
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

  Widget _buildVelocity() {
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

  Widget _buildBurndown() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.innerColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.primaryWhite.withAlpha(12)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Active Burndown',
                  style: GoogleFonts.jetBrainsMono(
                    color: AppColors.mutedColor,
                    fontSize: 9,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '142/148 done',
                  style: GoogleFonts.jetBrainsMono(
                    color: AppColors.greenColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 90,
            height: 32,
            child: CustomPaint(
              painter: _SparklinePainter(const [
                0.15,
                0.3,
                0.22,
                0.45,
                0.4,
                0.62,
                0.55,
                0.8,
                0.92,
              ], AppColors.greenColor),
            ),
          ),
        ],
      ),
    );
  }

  // ───────────────────────── Team sync pill ─────────────────────────

  Widget _buildTeamSync() {
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

  // ───────────────────────── Bottom area ─────────────────────────

  Widget _buildBottom() {
    return Builder(
      builder: (context) => Padding(
        padding: const EdgeInsets.fromLTRB(20, 4, 20, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [_dot(false), _dot(false), _dot(true)],
            ),
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: navigate to sign up / login screen
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: AppColors.onPrimaryColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Get Started',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.arrow_forward, size: 18),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dot(bool active) => AnimatedContainer(
    duration: const Duration(milliseconds: 250),
    margin: const EdgeInsets.symmetric(horizontal: 3),
    width: active ? 22 : 6,
    height: 4,
    decoration: BoxDecoration(
      color: active
          ? AppColors.primaryColor
          : AppColors.primaryWhite.withAlpha(61),
      borderRadius: BorderRadius.circular(2),
    ),
  );
}

class _SparklinePainter extends CustomPainter {
  final List<double> points;
  final Color color;

  _SparklinePainter(this.points, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    if (points.length < 2) return;

    final dx = size.width / (points.length - 1);
    final path = Path();
    for (var i = 0; i < points.length; i++) {
      final x = i * dx;
      final y = size.height - (points[i] * size.height);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    final fill = Path.from(path)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(
      fill,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [color.withAlpha(70), color.withAlpha(0)],
        ).createShader(Offset.zero & size),
    );

    canvas.drawPath(
      path,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.8
        ..strokeJoin = StrokeJoin.round,
    );
  }

  @override
  bool shouldRepaint(covariant _SparklinePainter old) =>
      old.points != points || old.color != color;
}
