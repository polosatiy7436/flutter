import 'package:bmi_calculator/screens/input_page/widgets/round_icon_button.dart';
import 'package:flutter/material.dart';

import '../../../styles/constants.dart';

class BodyParameterWidget extends StatefulWidget {
  final int parameterValue;
  final String parameterName;

  int getParameterValue() => parameterValue;

  BodyParameterWidget(this.parameterValue, this.parameterName);

  @override
  State<BodyParameterWidget> createState() =>
      _BodyParameterWidgetState(parameterValue, parameterName);
}

class _BodyParameterWidgetState extends State<BodyParameterWidget> {
  int parameterValue;
  String parameterName;

  _BodyParameterWidgetState(this.parameterValue, this.parameterName);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          parameterName,
          style: kTextStyle,
        ),
        Text(
          parameterValue.toString(),
          style: kNumberTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: RoundIconButton(
                  iconData: Icons.remove,
                  onTap: () {
                    setState(() {
                      parameterValue--;
                    });
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: RoundIconButton(
                  iconData: Icons.add,
                  onTap: () {
                    setState(() {
                      parameterValue++;
                    });
                  }),
            ),
          ],
        ),
      ],
    );
  }
}
