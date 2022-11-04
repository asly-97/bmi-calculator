import 'package:bmi_calculator/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BMIconContent extends StatelessWidget {
  final IconData icon;
  final String label;

  final Color labelColor;

  const BMIconContent({
    required this.icon,
    required this.label,
    this.labelColor = AppColors.secondary,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: kIconSize,
        ),
        const SizedBox(
          height: kGabSize,
        ),
        Text(
          label,
          style: kLabelStyle.copyWith(color: labelColor),
        ),
      ],
    );
  }
}
