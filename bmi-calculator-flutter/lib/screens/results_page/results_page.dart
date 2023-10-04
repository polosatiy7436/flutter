import 'package:bmi_calculator/screens/input_page/widgets/box_card.dart';
import 'package:flutter/material.dart';

import '../../styles/constants.dart';
import '../input_page/widgets/buttom_button.dart';

class ResultsScreen extends StatelessWidget {
  final String result;

  ResultsScreen(this.result);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text(
              'YOUR RESULTS',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 24.0,
              ),
            ),
          ),
          Expanded(
            child: BoxCard(
              color: kWidgetBackgroundColor,
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Final result',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    result,
                    style: kNumberTextStyle,
                  ),
                  Text(
                    'Final result explanation',
                    style: kTextStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(buttonText: 'RE-CALCULATE', navigationTarget: '/main'),
        ],
      ),
    );
  }
}
