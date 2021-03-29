import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/floating_action_buttons.dart';
import 'package:to_do_app/widgets/task_container.dart';
import 'package:to_do_app/data_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (context, data, child) {
        return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButtons(),
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
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onLongPress: () {
                        data.deleteTask(data.tasks[index]);
                      },
                      onTap: () {
                        data.isDoneToggle(data.tasks[index]);
                      },
                      child: TaskContainer(
                        taskName: data.tasks[index].taskName,
                        isDone: data.tasks[index].isDone,
                      ),
                    );
                  },
                  itemCount: data.tasks.length,
                  shrinkWrap: true,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
