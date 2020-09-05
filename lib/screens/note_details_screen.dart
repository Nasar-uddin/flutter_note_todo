import 'package:flutter/material.dart';
import 'package:gnotes/constrain/colors.dart';
import 'package:gnotes/models/note.dart';
import 'package:gnotes/providers/note_provider.dart';
import 'package:provider/provider.dart';


class NoteDetailScreen extends StatefulWidget {
  @override
  _NoteDetailScreenState createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<NoteDetailScreen> {
  String selectColorName = ColorName.WHITE;
  bool buildOnce = false;
  @override
  Widget build(BuildContext context) {
    final noteData = Provider.of<NoteProvider>(context);
    Note note = ModalRoute.of(context).settings.arguments;
    final TextEditingController tec = TextEditingController(text: note.body);
    if(!buildOnce){
      selectColorName = note.colorName;
      buildOnce = true;
    }
    // print(note.toMap());
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
                children: _colorSelection(),
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
                  // print(tec.)
                  note.body = tec.value.text.trim();
                  note.colorName = selectColorName;
                  await noteData.updateNote(note);
                  Navigator.pop(context);
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
