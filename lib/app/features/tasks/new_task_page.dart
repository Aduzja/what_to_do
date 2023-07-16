// ignore_for_file: prefer_typing_uninitialized_variables

import "package:flutter/material.dart";
import "package:what_to_do/app/base/constants/app_colors.dart";
import "package:what_to_do/app/base/constants/strings.dart";
import "package:what_to_do/app/base/widgets/main_button.dart";

// ignore: must_be_immutable
class NewTaskPage extends StatelessWidget {
  final titleController;
  final descriptionController;
  VoidCallback onSave;

  NewTaskPage(
      {super.key,
      required this.titleController,
      required this.descriptionController,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.green,
      appBar: AppBar(
        title: const Center(
          child: Text(
            Strings.ADD_TASK,
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 22,
                color: AppColors.darkGreen),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: TextField(
              controller: titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                hintText: Strings.TASK_TITLE,
                hintStyle: const TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
                filled: true,
                fillColor: AppColors.peach,
              ),
              style: const TextStyle(
                color: AppColors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                hintText: Strings.TASK_DESCRIPTION,
                hintStyle: const TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
                filled: true,
                fillColor: AppColors.peach,
              ),
              style: const TextStyle(
                color: AppColors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          MainButton(text: Strings.SAVE, onPressed: onSave),
        ],
      ),
    );
  }
}
