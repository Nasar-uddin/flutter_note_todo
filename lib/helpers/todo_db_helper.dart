import 'package:gnotes/models/todo.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class TodoDbHelper{
  // db values
  final String _dbName = 'mydb.db';
  final int _dbVersion = 1;
  final String _tableName = 'todo_table';

  // column names
  final String _idName = 'id';
  final String _todoName = 'todo';
  final String _isDoneName = 'isDone';
  // final String _addedOnName = 'addedOn';
  
  Database _database;
  TodoDbHelper._privateConstructor();
  static TodoDbHelper instance = TodoDbHelper._privateConstructor();

  Future<Database> get database async {
    if(_database!=null){
      return _database;
    }else{
      _database = await _initDatabase();
      return _database;
    }
  }
  _initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path,_dbName);
    Database db = await openDatabase(
      path,
      version: _dbVersion,
    );
    return db;
  }
  insertTodo(Todo todo) async {
    Database db = await database;
    Map<String,dynamic> map = todo.toMap();
    map[_isDoneName] = 0;
    var result = await db.insert(_tableName, map);
    print(result);
    return result;
  }
  fetchTodo() async {
    Database db = await database;
    var result = await db.query(_tableName);
    // print(result);
    return result;
  }
  updateTodo(Todo todo) async {
    Database db = await database;
    Map<String,dynamic> map = {
      _todoName: todo.todo
    };
    var result = await db.update(_tableName, map, where: '$_idName = ?', whereArgs: [todo.id]);
    return result;
  }
  toggleIsDone(Todo todo) async {
    Database db = await database;
    Map<String,dynamic> map = {
      _isDoneName: todo.isDone?0:1
    };
    int result = await db.update(_tableName, map, where: '$_idName = ?', whereArgs: [todo.id]);
    return result;
  }
}