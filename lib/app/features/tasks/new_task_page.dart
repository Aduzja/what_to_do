// ignore_for_file: prefer_typing_uninitialized_variables

import "package:flutter/material.dart";

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
      appBar: AppBar(
        title: const Text('Add new task'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: TextField(
              controller: titleController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Task title'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Task description'),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(onPressed: onSave, child: const Text('Save')),
        ],
      ),
    );
  }
}
