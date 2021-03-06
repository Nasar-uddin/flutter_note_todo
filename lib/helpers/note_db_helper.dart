import 'package:gnotes/models/note.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class NoteDbHelper{
  final String _dbName = 'mydb.db';
  final int _dbVersion = 1;
  final String _tableName = 'note_table';

  // note table column name

  final String _noteId = 'note_id';
  final String _noteBody = 'note_body';
  final String _date = 'create_date';
  final String _color = 'note_color';

  // todo column names
  final String _idName = 'id';
  final String _todoName = 'todo';
  final String _isDoneName = 'isDone';
  final String _addedOnName = 'addedOn';

  Database _database;
  NoteDbHelper._privateConstructor();
  static NoteDbHelper instance = NoteDbHelper._privateConstructor();

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
      onCreate: _onCreate
    );
    return db;
  }
  _onCreate(Database db,int version) async {
    db.execute('''
      CREATE TABLE $_tableName(
        $_noteId INTEGER PRIMARY KEY AUTOINCREMENT,
        $_noteBody TEXT NOT NULL,
        $_date TEXT NOT NULL,
        $_color TEXT
      )
      ''');
    db.execute('''
      CREATE TABLE todo_table(
        $_idName INTEGER PRIMARY KEY AUTOINCREMENT,
        $_todoName TEXT NOT NULL,
        $_addedOnName TEXT NOT NULL,
        $_isDoneName Bool
      )
      ''');
  }
  insertNote(Note note) async {
    Database db = await database;
    var res = await db.insert(_tableName, note.toMap());
    print(res);
    return res;
  }
  getNoteList() async {
    Database db = await database;
    var result = await db.query(_tableName,orderBy: '-$_noteId');
    // print(result);
    return result;
  }
  deleteNote(int id) async {
    Database db = await database;
    var res = await db.delete(_tableName,where: '$_noteId = ?',whereArgs: [id]);
    print(res);
  }
  updateNote(Note note) async {
     Database db = await database;
     Map<String,dynamic> map = {
       _noteBody: note.body,
       _color: note.colorName
     };
    //  print(map);
     var res =await db.update(_tableName, map,where: '$_noteId = ?',whereArgs: [note.id]);
    //  print(res);
     return res;
  }
}