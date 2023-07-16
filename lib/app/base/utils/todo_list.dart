import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:what_to_do/app/base/constants/app_colors.dart';

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
        decoration: BoxDecoration(
          color: AppColors.peach,
          borderRadius: BorderRadius.circular(25),
        ),
        padding: const EdgeInsets.all(14.0),
        margin: const EdgeInsets.all(14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskTitle,
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: AppColors.white,
                        decoration: taskCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  ),
                  Text(
                    taskDescription,
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: AppColors.white,
                        decoration: taskCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  ),
                ],
              ),
            ),
            Checkbox(value: taskCompleted, onChanged: onChanged),
          ],
        ),
      ),
    );
  }
}
