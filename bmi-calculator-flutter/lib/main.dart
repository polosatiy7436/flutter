import 'package:bmi_calculator/screens/input_page/input_page.dart';
import 'package:bmi_calculator/screens/results_page/results_page.dart';
import 'package:bmi_calculator/styles/constants.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/main',
      routes: {
        '/main': (context) => InputScreen(),
        '/results': (context) =>
            ResultsScreen(InputScreen().hashCode.toString())
      },
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          color: Color(0xFF0A0E21),
        ),
        sliderTheme: SliderTheme.of(context).copyWith(
          activeTrackColor: kSliderActiveColor,
          inactiveTrackColor: kSliderInactiveColor,
          thumbColor: kSliderActiveColor,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
          trackHeight: 1.0,
        ),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
    );
  }
}
