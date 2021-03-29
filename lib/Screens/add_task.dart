import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/data_provider.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String value;

    return Consumer<DataProvider>(builder: (context, data, child) {
      return SingleChildScrollView(
        child: Container(
          color: Color(0xFF0E0C1E),
          height: 500.0,
          child: Container(
            height: 500.0,
            decoration: BoxDecoration(
              color: Color(0xFF252030),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Add a new task',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 100.0),
                Container(
                  padding: EdgeInsets.all(20.0),
                  width: 300.0,
                  child: TextField(
                    onChanged: (valueTyped) {
                      value = valueTyped;
                    },
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: 300.0,
                  color: Colors.white12,
                  child: TextButton(
                    onPressed: () {
                      data.addTask(value);
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Add',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
