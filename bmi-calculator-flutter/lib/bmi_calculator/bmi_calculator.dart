import 'dart:math';

import 'package:flutter/material.dart';

class BMICalculator {
  final int height;
  final int weight;

  BMICalculator({@required this.height, @required this.weight});

  String calculateBmi() => (weight / pow(height / 100, 2)).toStringAsFixed(1);
}
