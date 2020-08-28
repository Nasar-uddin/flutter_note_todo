import 'package:flutter/foundation.dart';
import 'package:gnotes/helpers/note_db_helper.dart';
import 'package:gnotes/models/note.dart';

class NoteProvider with ChangeNotifier {
  List<Note> _notes;
  bool noteLoaded = false;
  NoteDbHelper dbHelper = NoteDbHelper.instance;
  NoteProvider() {
    getNotes();
  }
  getNotes() async {
    List<Note> notes = [];
    List<Map<String, dynamic>> dbnotes = await dbHelper.getNoteList();
    // notes = dbnotes;
    dbnotes.forEach((nt) {
      notes.add(Note.fromMap(nt));
    });
    _notes = notes;
    // print(_notes);
    noteLoaded = true;
    return _notes;
  }

  addNote(Note note) async {
    await dbHelper.insertNote(note);
    getNotes();
    notifyListeners();
  }
  deleteNote(int id) async {
    await dbHelper.deleteNote(id);
    getNotes();
    notifyListeners();
  }
}
