import 'package:flutter/material.dart';
import 'package:what_to_do/app/base/utils/todo_list.dart';
import 'package:what_to_do/app/features/tasks/new_task_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// title controller
  final _titleController = TextEditingController();

// description controller
  final _descriptionController = TextEditingController();

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

  // save task
  void saveTask() {
    setState(() {
      toDoList.add([_titleController.text, _descriptionController.text, false]);
      _titleController.clear();
      _descriptionController.clear();
    });
    Navigator.of(context).pop();
  }

  // delete task
  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
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
              builder: (context) => NewTaskPage(
                titleController: _titleController,
                descriptionController: _descriptionController,
                onSave: saveTask,
              ),
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
            deleteTask: (context) => deleteTask(index),
          );
        },
        itemCount: toDoList.length,
      ),
    );
  }
}
