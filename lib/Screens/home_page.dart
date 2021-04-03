import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/floating_action_buttons.dart';
import 'package:to_do_app/widgets/display_tasks.dart';
import 'package:to_do_app/db_helper.dart';
import 'package:to_do_app/models/task.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final db = DBHelper.instance;
  Future<List<Task>> tasks;

  @override
  void initState() {
    super.initState();
    updateTasksList();
  }

  void updateTasksList() {
    setState(() {
      tasks = db.getTaskList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButtons(updateList: updateTasksList),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.only(left: 30.0, top: 60.0, bottom: 20.0),
            child: Text(
              'Hello, Noel!',
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: Text(
              'TODAY\'S TASKS',
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
          DisplayTasks(tasks: tasks, updateList: updateTasksList)
        ],
      ),
    );
  }
}
