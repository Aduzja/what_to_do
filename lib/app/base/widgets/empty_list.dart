import 'package:flutter/material.dart';
import 'package:what_to_do/app/base/constants/app_colors.dart';
import 'package:what_to_do/app/base/constants/strings.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            Strings.EMPTY_LIST,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              fontSize: 18,
              color: AppColors.white,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            Strings.ADD_BUTTON,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
