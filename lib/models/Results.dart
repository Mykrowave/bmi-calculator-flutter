import 'dart:math';

import 'package:flutter/material.dart';

class BMICalculator {
  BMIResult calculateResult(int height, int weight) {
    //height in m
    //weigh in kg

    double bmi = weight / pow(height / 100, 2);
    String bmiResult = bmi.toStringAsFixed(1);
    String category = _resolveCategory(bmi);
    String advice = _resolveAdviceMessage(bmi);

    return BMIResult(
        category: category, bmiValue: bmiResult, adviceMessage: advice);
  }

  String _resolveCategory(double bmi) {
    if (bmi >= 25)
      return 'Overweight';
    else
      return 'Normal';
  }

  String _resolveAdviceMessage(double bmi) {
    if (bmi >= 25)
      return 'Yo, DYEL????';
    else
      return 'ok, you good to go';
  }
}

class BMIResult {
  final String category;
  final String bmiValue;
  final String adviceMessage;

  const BMIResult(
      {@required this.category,
      @required this.bmiValue,
      @required this.adviceMessage});
}
