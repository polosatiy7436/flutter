import 'package:flutter/material.dart';

import '../../../styles/constants.dart';

class HeightSelector extends StatefulWidget {
  @override
  State<HeightSelector> createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {
  int heightValue = 180;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'HEIGHT',
          style: kTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              heightValue.toString(),
              style: kNumberTextStyle,
            ),
            Text(
              'cm',
              style: kTextStyle,
            )
          ],
        ),
        Slider(
            value: heightValue.toDouble(),
            min: kMinimalHeight,
            max: kMaximalHeight,
            onChanged: (double newValue) {
              setState(() {
                heightValue = newValue.round();
              });
            }),
      ],
    );
  }
}
