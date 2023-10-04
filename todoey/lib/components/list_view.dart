import 'package:flutter/material.dart';
import 'package:todoey/components/todo_item.dart';

class ToDoListView extends StatefulWidget {
  const ToDoListView({Key? key}) : super(key: key);

  //List<ToDoItem> toDoItems = [];

  @override
  State<ToDoListView> createState() => _ToDoListViewState();
}

class _ToDoListViewState extends State<ToDoListView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(24),
      children: <Widget>[
        ToDoItem(),
        ToDoItem(),
        ToDoItem(),
      ],
    );
  }
}
