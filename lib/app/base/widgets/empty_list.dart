import 'package:flutter/material.dart';
import 'package:what_to_do/app/base/constants/strings.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        Strings.EMPTY_LIST,
        textAlign: TextAlign.center,
      ),
    );
  }
}
