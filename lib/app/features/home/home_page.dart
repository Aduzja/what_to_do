import 'package:flutter/material.dart';
import 'package:what_to_do/app/base/utils/todo_list.dart';
import 'package:what_to_do/app/features/tasks/new_task_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of todo
  List toDoList = [
    ['Work', 'Create a new app', false],
    ['Shopping', 'Buy some food', false]
  ];

  // chceckbox onChanged
  void checkboxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][2] = !toDoList[index][2];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('What to do?'),
        ),
      ),
      floatingActionButton: ElevatedButton(
        child: const Text('Add new task'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NewTaskPage(),
            ),
          );
        },
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ToDoList(
            taskTitle: toDoList[index][0],
            taskDescription: toDoList[index][1],
            taskCompleted: toDoList[index][2],
            onChanged: (value) => checkboxChanged(value, index),
          );
        },
        itemCount: toDoList.length,
      ),
    );
  }
}
