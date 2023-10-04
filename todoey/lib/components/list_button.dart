import 'package:flutter/material.dart';

class ListButton extends StatelessWidget {
  final Function onTap;
  final double _size = 100.0;
  final double _iconSize = 50;

  const ListButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.white,
      shape: const CircleBorder(),
      height: _size,
      elevation: 5,
      onPressed: onTap(),
      child: Icon(
        Icons.list,
        size: _iconSize,
        color: Colors.lightBlueAccent,
      ),
    );
  }
}
