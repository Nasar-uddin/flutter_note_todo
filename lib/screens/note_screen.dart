import 'package:flutter/material.dart';
import 'package:gnotes/widgest/notes_grid.dart';

class NoteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text('Notes'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.pushNamed(context, '/addnote');
        },
      ),
      body: Container(
        child: NoteGrid(),
      ),
    );
  }
}
