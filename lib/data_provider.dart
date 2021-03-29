import 'package:flutter/cupertino.dart';
import 'package:to_do_app/models/task.dart';

class DataProvider extends ChangeNotifier {
  List<Task> tasks = [
    Task(taskName: 'Task number 1'),
    Task(taskName: 'Task number 2'),
  ];

  void isDoneToggle(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void addTask(String newTask) {
    tasks.add(Task(taskName: newTask));
    notifyListeners();
  }

  void deleteTask(Task toDelete) {
    tasks.remove(toDelete);
    notifyListeners();
  }

  void deleteAll() {
    tasks = [];
    notifyListeners();
  }
}
