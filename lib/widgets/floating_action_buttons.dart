import 'package:flutter/material.dart';
import 'package:to_do_app/Screens/add_task.dart';
import 'package:to_do_app/data_provider.dart';
import 'package:provider/provider.dart';

class FloatingActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (context, data, child) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                backgroundColor: Color(0xFF25202B),
                onPressed: () {
                  data.deleteAll();
                },
                child: Icon(Icons.clear, size: 30.0, color: Colors.white),
              ),
              FloatingActionButton(
                backgroundColor: Color(0xFF25202B),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => AddTaskScreen());
                },
                child: Icon(Icons.add, size: 30.0, color: Colors.white),
              ),
            ],
          ),
        );
      },
    );
  }
}
