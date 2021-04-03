import 'package:flutter/material.dart';
import 'package:to_do_app/models/task.dart';
import 'package:to_do_app/data_provider.dart';
import 'package:provider/provider.dart';

class DisplayTasks extends StatelessWidget {
  DisplayTasks({@required this.tasks, @required this.updateList});
  final Future<List<Task>> tasks;
  final Function updateList;

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(builder: (context, data, child) {
      return Expanded(
        child: FutureBuilder(
            future: tasks,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: Text(
                    'No tasks added yet.',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }

              if (snapshot.hasError) {
                return Center(
                  child: Text('Future Error'),
                );
              }

              return ListView.builder(
                itemCount: snapshot.data.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPress: () {
                      data.deleteTask(snapshot.data[index].taskName);
                      updateList();
                    },
                    onTap: () {
                      data.toggleDone(snapshot.data[index]);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 10.0),
                      margin: EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10.0),
                      decoration: BoxDecoration(
                          color: Color(0xFF252030),
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Center(
                        child: Text(
                          '${snapshot.data[index].taskName}',
                          style: TextStyle(
                              decoration: snapshot.data[index].isDone == 0
                                  ? TextDecoration.none
                                  : TextDecoration.lineThrough,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              textBaseline: TextBaseline.ideographic),
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
      );
    });
  }
}
