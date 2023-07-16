import 'package:hive_flutter/hive_flutter.dart';

class TasksLocalDatasource {
  List toDoList = [];

  final _toDoBox = Hive.box('toDoBox');

  // load data
  void loadData() {
    if (_toDoBox.containsKey('toDo list')) {
      toDoList = _toDoBox.get('toDo list');
    } else {
      toDoList = [];
    }
  }

  // update data
  void updateData() {
    _toDoBox.put('toDo list', toDoList);
  }
}
