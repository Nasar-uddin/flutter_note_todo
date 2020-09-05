import 'package:flutter/material.dart';
import 'package:gnotes/constrain/colors.dart';
import 'package:gnotes/models/note.dart';
import 'package:gnotes/providers/note_provider.dart';
import 'package:provider/provider.dart';

class AddNoteScreen extends StatefulWidget {
  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final TextEditingController tec = TextEditingController(text: '');
  String selectColorName = ColorName.WHITE;
  @override
  Widget build(BuildContext context) {
    final noteData = Provider.of<NoteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Add note'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                textAlign: TextAlign.left,
                maxLengthEnforced: true,
                controller: tec,
                keyboardType: TextInputType.multiline,
                minLines: 40,
                maxLines: null,
                autofocus: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'Note'),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _colorSelection(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 46,
              width: double.infinity,
              child: FlatButton(
                color: Theme.of(context).accentColor,
                child: Text(
                  'Add Note',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  Note note = Note(
                      body: tec.value.text.trim(),
                      date: DateTime.now().toString(),
                      colorName: selectColorName);
                  if (note.body != '') {
                    // NoteDbHelper dbHelper = NoteDbHelper.instance;
                    // dbHelper.insertNote(note);
                    await noteData.addNote(note);
                    Navigator.pop(context);
                    // print(tec.value.text);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }


  List<Widget> _colorSelection() {
    List<Widget> widgets = [];
    noteColors.forEach((key, value) {
      widgets.add(GestureDetector(
        onTap: (){
          setState(() {
            selectColorName = key;
          });
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
          height: selectColorName==key? 20:15,
          width: selectColorName==key? 20:15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: value,
            boxShadow: [BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.05),
              blurRadius: 10,
              offset: Offset(5, 5)
            )]
          ),
        ),
      ));
    });
    return widgets;
  }
}
/*
myColors.map((e) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: CircleAvatar(
      backgroundColor: e,
      radius: 10,
    ),
  );
}).toList()
*/