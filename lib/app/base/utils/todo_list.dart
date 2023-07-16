import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ToDoList extends StatelessWidget {
  final String taskTitle;
  final String taskDescription;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteTask;

  ToDoList(
      {super.key,
      required this.taskTitle,
      required this.taskDescription,
      required this.taskCompleted,
      required this.deleteTask,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: deleteTask,
            icon: Icons.delete,
          )
        ],
      ),
      child: Container(
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
      ),
    );
  }
}
