import 'package:flutter/material.dart';

class BoxCard extends StatelessWidget {
  BoxCard({@required this.color, this.childWidget, this.onTap});

  final Widget childWidget;
  final Color color;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: childWidget,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
