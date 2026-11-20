import 'package:flutter/material.dart';

import '../../../constant/app_colors.dart';

Widget dotWidget() {
  Widget dot(bool active) => AnimatedContainer(
    duration: const Duration(milliseconds: 250),
    margin: const EdgeInsets.symmetric(horizontal: 3),
    width: active ? 22 : 6,
    height: 4,
    decoration: BoxDecoration(
      color: active ? AppColors.primaryColor : Colors.white24,
      borderRadius: BorderRadius.circular(2),
    ),
  );

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [dot(true), dot(false), dot(false)],
  );
}
