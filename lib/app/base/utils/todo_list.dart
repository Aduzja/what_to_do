import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ToDoList extends StatelessWidget {
  final String taskTitle;
  final String taskDescription;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  ToDoList(
      {super.key,
      required this.taskTitle,
      required this.taskDescription,
      required this.taskCompleted,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Row(
        children: [
          Column(
            children: [
              Text(taskTitle),
              Text(taskDescription),
            ],
          ),
          Checkbox(value: taskCompleted, onChanged: onChanged),
        ],
      ),
    );
  }
}
