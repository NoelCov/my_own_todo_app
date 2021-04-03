import 'package:flutter/cupertino.dart';
import 'package:to_do_app/models/task.dart';
import 'package:to_do_app/db_helper.dart';

class DataProvider extends ChangeNotifier {

  final db = DBHelper.instance;

  void deleteAll() {
    db.deleteAll();
    notifyListeners();
  }

  void insertTask(String taskName, int isDone) {
    db.insertTask(Task(
      taskName: taskName,
      isDone: isDone,
    ));
    notifyListeners();
  }

  void deleteTask(String taskName) {
    db.deleteTask(taskName);
    notifyListeners();
  }

  void toggleDone(Task task) {
    if (task.isDone == 0) {
      task.isDone = 1;
    } else {
      task.isDone = 0;
    }
    db.updateTask(task);
    notifyListeners();
  }

}
