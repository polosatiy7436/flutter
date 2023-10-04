import 'package:flutter/material.dart';

class TasksCounterText extends StatefulWidget {
  int tasksCount;

  TasksCounterText(this.tasksCount, {Key? key}) : super(key: key);

  @override
  State<TasksCounterText> createState() => _TasksCounterTextState();
}

class _TasksCounterTextState extends State<TasksCounterText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      '${widget.tasksCount} Tasks',
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
      ),
    );
  }
}
