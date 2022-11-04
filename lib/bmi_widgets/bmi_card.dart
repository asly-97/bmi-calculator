import 'package:flutter/material.dart';
import 'package:bmi_calculator/app_colors.dart';

class BMICard extends StatelessWidget {
  final Color color;
  final Widget? child;
  final Function()? onSelect;

  const BMICard({
    this.color = AppColors.primary,
    this.child,
    this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              blurStyle: BlurStyle.outer,
              color: AppColors.shadow,
              spreadRadius: 0,
              blurRadius: 4,
            )
          ],
        ),
        child: child,
      ),
    );
  }
}
