import 'package:flutter/material.dart';
import 'package:gnotes/widgets/notes_list.dart';

class NoteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Notes'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, '/addnote');
          },
        ),
        body: Container(
          child: NotesList(),
        ));
  }
}
