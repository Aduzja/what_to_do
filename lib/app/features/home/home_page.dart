import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:what_to_do/app/base/constants/app_colors.dart';
import 'package:what_to_do/app/base/constants/strings.dart';
import 'package:what_to_do/app/base/utils/todo_list.dart';
import 'package:what_to_do/app/base/widgets/empty_list.dart';
import 'package:what_to_do/app/base/widgets/main_button.dart';
import 'package:what_to_do/app/data/local/tasks_local_datasource.dart';
import 'package:what_to_do/app/features/tasks/new_task_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// hive box
  final toDoBox = Hive.box('toDoBox');
  TasksLocalDatasource ds = TasksLocalDatasource();

  @override
  void initState() {
    ds.loadData();
    super.initState();
  }

// title controller
  final _titleController = TextEditingController();

// description controller
  final _descriptionController = TextEditingController();

  // chceckbox onChanged
  void checkboxChanged(bool? value, int index) {
    setState(() {
      ds.toDoList[index][2] = !ds.toDoList[index][2];
    });
    ds.updateData();
  }

  // save task
  void saveTask() {
    setState(() {
      ds.toDoList
          .add([_titleController.text, _descriptionController.text, false]);
      _titleController.clear();
      _descriptionController.clear();
    });
    Navigator.of(context).pop();
  }

  // delete task
  void deleteTask(int index) {
    setState(() {
      ds.toDoList.removeAt(index);
    });
    ds.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.green,
      appBar: AppBar(
        title: const Center(
          child: Text(
            Strings.APP_NAME,
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 22,
                color: AppColors.darkGreen),
          ),
        ),
      ),
      floatingActionButton: MainButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewTaskPage(
                  titleController: _titleController,
                  descriptionController: _descriptionController,
                  onSave: saveTask,
                ),
              ),
            );
          },
          text: Strings.ADD_TASK),
      body: ds.toDoList.isEmpty
          ? const EmptyList()
          : ListView.builder(
              itemBuilder: (context, index) {
                return ToDoList(
                  taskTitle: ds.toDoList[index][0],
                  taskDescription: ds.toDoList[index][1],
                  taskCompleted: ds.toDoList[index][2],
                  onChanged: (value) => checkboxChanged(value, index),
                  deleteTask: (context) => deleteTask(index),
                );
              },
              itemCount: ds.toDoList.length,
            ),
    );
  }
}
