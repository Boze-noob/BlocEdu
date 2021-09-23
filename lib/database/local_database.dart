
import 'package:ido_edu/models/todo.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

final String tableTask = 'task';
final String columnId = 'id';
final String columnStatus = 'isCompleted';
final String columnTitle = 'text';

class TaskDatabase {
  static Database? _database;
  static TaskDatabase? _taskDatabase;

  TaskDatabase._createInstance();
  factory TaskDatabase() {

    if (_taskDatabase == null) {
      _taskDatabase = TaskDatabase._createInstance();
    }

    return _taskDatabase!;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    var dir = await getDatabasesPath();
    var path = dir + "task.db";

    var database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          create table $tableTask ( 
          $columnId integer primary key autoincrement, 
          $columnStatus integer,
          $columnTitle text not null)
        ''');
      },
    );
    return database;
  }

  void insertTasks(ToDo toDo) async {
    var db = await this.database;
    var result = await db.insert(tableTask, toDo.toMap());
    print('result : $result');
  }

  Future<List<ToDo>> getTasks() async {
    List<ToDo> _alarms = [];

    var db = await this.database;
    var result = await db.query(tableTask);
    result.forEach((element) {
      var alarmInfo = ToDo.fromMap(element);
      _alarms.add(alarmInfo);
    });

    return _alarms;
  }

  Future<int> deleteTasks(int id) async {
    var db = await this.database;
    return await db.delete(tableTask, where: '$columnId = ?', whereArgs: [id]);
  }
}