import 'package:flutter/material.dart';
import 'package:todoey/screens/add_task_screen.dart';

import '../components/list_button.dart';
import '../components/tasks_counter_text.dart';
import '../components/todo_item.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add task',
        key: const Key('value'),
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => AddTaskBottomSheet(),
          );
        },
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
                top: 24.0,
                bottom: 54.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListButton(
                    key: const Key('list-button'),
                    onTap: () {},
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    key: Key('todoey-title-key'),
                    'Todoey',
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TasksCounterText(2),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                ),
                child: ListView(
                  padding: const EdgeInsets.all(24),
                  children: <Widget>[
                    ToDoItem(),
                    ToDoItem(),
                    ToDoItem(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
