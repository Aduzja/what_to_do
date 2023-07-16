import 'package:hive_flutter/hive_flutter.dart';

class TasksLocalDatasource {
  List toDoList = [];

  final _todoBox = Hive.box('todoBox');

  // load data
  void loadData() {
    toDoList = _todoBox.get('TODO list');
  }

  // update data
  void updateData() {
    _todoBox.put('TODO list', toDoList);
  }
}
