import 'package:flutter/material.dart';

import '../../../styles/constants.dart';

class BottomButton extends StatelessWidget {
  final String buttonText;
  final String navigationTarget;

  BottomButton({@required this.buttonText, this.navigationTarget});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, navigationTarget);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 8.0),
        color: kCalculateButtonColor,
        width: double.infinity,
        height: kCalculateButtonHeight,
        child: Center(
          child: Text(
            buttonText,
            style: kTextStyle,
          ),
        ),
      ),
    );
  }
}
