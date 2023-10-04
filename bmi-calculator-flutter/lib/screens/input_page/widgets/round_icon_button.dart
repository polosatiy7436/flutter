import 'package:flutter/material.dart';

import '../../../styles/constants.dart';

class RoundIconButton extends StatelessWidget {
  final IconData iconData;
  final Function onTap;

  RoundIconButton({this.iconData, this.onTap});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTap,
      child: Icon(iconData),
      elevation: 6.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      fillColor: kMaterialButtonColor,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
