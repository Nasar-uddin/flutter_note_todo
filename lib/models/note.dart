import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
class Note {
  final String _noteId = 'note_id';
  final String _noteBody = 'note_body';
  final String _date = 'create_date';
  final String _color = 'note_color';
  int id;
  String body;
  String colorName;
  String date;
  String time;
  Note({@required this.body, this.date, this.colorName = 'white'});

  Note.fromMap(Map<String,dynamic> map){
    if(map[_noteId]!=null){
      id = map[_noteId];
    }
    body = map[_noteBody];
    // date = map[_date];
    colorName = map[_color];
    DateTime dt =  DateTime.parse(map[_date]);
    time = DateFormat.jm().format(dt);
    date = DateFormat.yMMMd().format(dt);
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> note = {
      _noteBody:body,
      _date: date,
      _color:colorName
    };
    if(id!=null){
      note[_noteId] = id;
    }
    return note;
  }
}
