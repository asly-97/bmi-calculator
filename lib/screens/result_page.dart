import 'package:bmi_calculator/bmi_widgets/bmi_card.dart';
import 'package:bmi_calculator/bmi_widgets/bmi_large_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/bmi_calculator.dart';

class ResultPage extends StatelessWidget {
  BMICalculator bmiResults;

  ResultPage({required this.bmiResults});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kAppTitle),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Your results',
                textAlign: TextAlign.center,
                style: kLargeTextStyle,
              ),
              SizedBox(
                height: 17,
              ),
              Expanded(
                child: BMICard(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          bmiResults.getCategory().toUpperCase(),
                          style: kResultLabelTextStyle,
                        ),
                        Text(
                          bmiResults.getBMI(),
                          style: kResultValueTextStyle,
                        ),
                        Text(
                          bmiResults.getInterpretation(),
                          style: kLabelStyle,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 17,
              ),
              BMILargeButton(
                  text: 'TRY AGAIN',
                  onTap: () {
                    Navigator.pop(context);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
