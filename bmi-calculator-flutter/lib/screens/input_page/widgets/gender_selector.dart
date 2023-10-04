import 'package:bmi_calculator/styles/constants.dart';
import 'package:flutter/material.dart';

class GenderSelector extends StatelessWidget {
  final IconData genderIcon;
  final String genderText;

  GenderSelector({@required this.genderIcon, @required this.genderText});

  final double genderIconSize = 80.0;

  final double iconAndTextMargin = 15.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: genderIconSize,
        ),
        SizedBox(
          height: iconAndTextMargin,
        ),
        Text(genderText, style: kTextStyle)
      ],
    );
  }
}
