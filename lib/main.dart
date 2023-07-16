import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:what_to_do/app/app.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('toDoBox');

  runApp(const MyApp());
}
