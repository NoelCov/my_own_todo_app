import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/data_provider.dart';

class TaskContainer extends StatelessWidget {
  TaskContainer({this.taskName, this.isDone});

  final String taskName;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (context, data, child) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          decoration: BoxDecoration(
              color: Color(0xFF252030),
              borderRadius: BorderRadius.circular(15.0)),
          child: Center(
            child: Text(
              '$taskName',
              style: TextStyle(
                  decoration: isDone ? TextDecoration.lineThrough : TextDecoration.none,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  textBaseline: TextBaseline.ideographic),
            ),
          ),
        );
      },
    );
  }
}
