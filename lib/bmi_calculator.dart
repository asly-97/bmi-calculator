import 'dart:math';
import 'package:bmi_calculator/main.dart';

class BMICalculator {
  late double _bmi;
  int height;
  int weight;

  BMICalculator({required this.height, required this.weight}) {
    _bmi = weight / pow(height / 100, 2);
  }

  String getCategory() {
    String category = '';
    if (_bmi < 18.5) {
      category = 'Underweight';
    } else if (_bmi < 25.0) {
      category = 'Normal';
    } else {
      category = 'Overweight';
    }
    return category;
  }

  String getBMI() {
    return _bmi.toStringAsFixed(1);
  }

  String getInterpretation() {
    String interpretation = '';
    if (_bmi < 18.5) {
      interpretation =
          'You have a lower than normal body weight. You can eat a bit more.';
    } else if (_bmi < 25.0) {
      interpretation = 'You have a normal body weight. Good job!';
    } else {
      interpretation =
          'You have a higher than normal body weight. Try to exercise more.';
    }
    return interpretation;
  }
}
