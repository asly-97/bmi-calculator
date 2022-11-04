import 'package:bmi_calculator/app_colors.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BMIRoundIconButton extends StatelessWidget {
  IconData _icon = Icons.add;
  VoidCallback? onPressed;

  BMIRoundIconButton({this.onPressed});

  BMIRoundIconButton get plus {
    this._icon = Icons.add;
    return this;
  }

  BMIRoundIconButton get minus {
    this._icon = Icons.remove;
    return this;
  }

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      fillColor: AppColors.accent,
      elevation: 6,
      child: Icon(
        _icon,
        size: 40,
      ),
      onPressed: onPressed,
    );
  }
}
