import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class MainButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool? isActive;

  const MainButton(
      {required this.text,
      required this.onPressed,
      this.isActive = true,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(AppColors.white),
      ),
      child: Text(
        text,
        style: const TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: AppColors.orange),
        textAlign: TextAlign.center,
      ),
    );
  }
}
