class Task {
  int id;
  String taskName;
  int isDone;

  Task({this.taskName, this.isDone = 1});
  Task.withId({this.id, this.taskName, this.isDone});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();

    if (id != null) { map['id'] = id; }

    map['taskName'] = taskName;
    map['isDone'] = isDone;
    return map;
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      taskName: map['taskName'],
      isDone: map['isDone'],
    );
  }

}