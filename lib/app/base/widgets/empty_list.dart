import 'package:flutter/material.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Your task list is empty,\nadd a new task',
        textAlign: TextAlign.center,
      ),
    );
  }
}
