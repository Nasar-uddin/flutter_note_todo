import 'package:flutter/material.dart';
import 'package:gnotes/constrain/colors.dart';
import 'package:gnotes/models/note.dart';
import 'package:gnotes/providers/note_provider.dart';
import 'package:provider/provider.dart';


class NoteDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final noteData = Provider.of<NoteProvider>(context);
    Note note = ModalRoute.of(context).settings.arguments;
    // print(note.toMap());
    final TextEditingController tec = TextEditingController(text: note.body);
    List<Color> myColors = _getColors();
    return Scaffold(
      appBar: AppBar(
        title: Text('Note Details'),
        actions: [
          IconButton(
            onPressed: (){
              // print(note.id);
              noteData.deleteNote(note.id);
              Navigator.pop(context);
            },
            icon: Icon(Icons.delete),
          ),
        ],
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
                children: myColors.map((e) => Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    backgroundColor: e,
                    radius: 10,
                  ),
                )).toList(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 42,
              width: double.infinity,
              child: FlatButton(
                color: Theme.of(context).accentColor,
                child: Text(
                  'Update Note',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Color> _getColors() {
    List<Color> nColors = [];
    noteColors.forEach((key, value) { 
      nColors.add(value);
    });
    // print(nColors);
    return nColors;
  }
}
