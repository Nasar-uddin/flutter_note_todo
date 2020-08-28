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
  }
  insertNote(Note note) async {
    Database db = await database;
    var res = await db.insert(_tableName, note.toMap());
    print(res);
    return res;
  }
  getNoteList() async {
    Database db = await database;
    var result = await db.query(_tableName);
    // print(result);
    return result;
  }
}