import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'bmi_round_icon_button.dart';

class BMIContentControl extends StatelessWidget {
  String label;
  String unit;
  int value;
  VoidCallback onDecrease;
  VoidCallback onIncrease;

  BMIContentControl({
    required this.label,
    required this.value,
    required this.onDecrease,
    required this.onIncrease,
    this.unit = '',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: kLabelStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              value.toString(),
              style: kValueStyle,
            ),
            Text(
              unit,
              style: kLabelStyle,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BMIRoundIconButton(onPressed: onDecrease).minus,
            SizedBox(
              width: kGabSize,
            ),
            BMIRoundIconButton(onPressed: onIncrease).plus,
          ],
        ),
      ],
    );
  }
}
