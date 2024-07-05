// ignore_for_file: non_constant_identifier_names

import 'dart:developer';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/app/models/todo_data_model.dart';

class DatabaseHelper {
  static Database? _TodoDb;
  static DatabaseHelper? _TodoDatabaseHelper;

  String table = 'todoTable';
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String coltime = 'time';
  String colStatus = 'status';

  DatabaseHelper._createInstance();

  static final DatabaseHelper db = DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    _TodoDatabaseHelper ??= DatabaseHelper._createInstance();
    return _TodoDatabaseHelper!;
  }

  Future<Database> get database async {
    _TodoDb ??= await initializeDatabase();
    return _TodoDb!;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '${directory.path}todo.db';
    var myDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return myDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute("CREATE TABLE $table"
        "($colId INTEGER PRIMARY KEY AUTOINCREMENT,"
        "$colTitle TEXT, $colDescription TEXT, $coltime INTEGER, $colStatus TEXT)");
  }

  Future<List<Map<String, dynamic>>> getTodoMapList() async {
    Database db = await database;
    var result = await db.query(table, orderBy: "$colId ASC");
    log("list: $result");
    return result;
  }

  Future<int> insertTodo(TodoDataModel todo) async {
    Database db = await database;
    var result = await db.insert(table, todo.tojson());
    print("result:  $result");
    return result;
  }

  Future<int> updateTodo(TodoDataModel todo) async {
    var db = await database;
    var result = await db.update(table, todo.tojson(),
        where: '$colId = ?', whereArgs: [todo.id]);
    return result;
  }

  Future<int> deleteTodo(int id) async {
    var db = await database;
    int result = await db.delete(table, where: '$colId = ?', whereArgs: [id]);
    return result;
  }

  Future<int?> getCount(tableName) async {
    Database db = await database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $tableName');
    int? result = Sqflite.firstIntValue(x);
    return result;
  }

  Future<List<TodoDataModel>> getTodoList() async {
    var todoMapList = await getTodoMapList();
    int? count = await getCount(table);

    List<TodoDataModel> todoList = <TodoDataModel>[];
    for (int i = 0; i < count!; i++) {
      todoList.add(TodoDataModel.fromJson(todoMapList[i]));
    }
    log("list_todo: ${todoMapList.toString()}");
    return todoList;
  }

  close() async {
    var db = await database;
    var result = db.close();
    return result;
  }
}
