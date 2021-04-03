import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_app/models/task.dart';

class DBHelper {
  static final _dbName = 'Tasks.db';
  static final _dbVersion = 1;

  static final table = 'tasks_table';

  static final columnId = '_id';
  static final columnTaskName = 'taskName';
  static final columnIsDone = 'isDone';

  //make this a singleton class
  DBHelper._();

  static final DBHelper instance = DBHelper._();

  // only have a single app-wide reference to the database
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // Opens DB (creates if doesn't exist)
  _initDatabase() async {
    return await openDatabase(join(await getDatabasesPath(), _dbName),
        version: _dbVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $table (
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnTaskName TEXT NOT NULL,
      $columnIsDone INTEGER NOT NULL
    )
    ''');
  }

  //Helper methods

  // Inserts a task in the DB
  Future<int> insertTask(Task task) async {
    Database db = await instance.database;
    final int result = await db.insert(table, task.toMap());
    return result;
  }

  Future<List<Map<String, dynamic>>> getTaskMapList() async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> result = await db.query(table);
    return result;
  }

  Future<List<Task>> getTaskList() async {
    final List<Map<String, dynamic>> taskMapList = await getTaskMapList();
    List<Task> taskList = [];
    taskMapList.forEach((taskMap){
      taskList.add(Task.fromMap(taskMap));
    });
    return taskList;
  }

  // Future<int> queryRowCount() async {
  //   Database db = await instance.database;
  //   return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $table'));
  // }

  Future<int> updateTask(Task task) async {
    Database db = await instance.database;
    final result = await db.update(table, task.toMap(), where: '$columnTaskName = ?', whereArgs: [task.taskName]);
    return result;
  }

  Future<int> deleteTask(String  taskName) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnTaskName = ?', whereArgs: [taskName]);
  }

  Future<int> deleteAll() async {
    Database db = await instance.database;
    return await db.delete(table);
  }


}