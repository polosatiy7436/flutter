import 'package:flutter/material.dart';

class ToDoItem extends StatefulWidget {
  @override
  State<ToDoItem> createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  bool isChecked = false;
  String toDoText = 'Blank';

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        toDoText,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: (value) {
          setState(() {
            isChecked = value!;
          });
        },
      ),
    );
  }
}
