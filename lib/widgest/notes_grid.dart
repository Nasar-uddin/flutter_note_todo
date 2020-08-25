import 'package:flutter/material.dart';
import 'package:gnotes/models/note.dart';
import 'package:gnotes/constrain/colors.dart';

class NoteGrid extends StatelessWidget {
  final List<Note> notes = [
    Note(body: 'I am a body',colorName: ColorName.BLUE),
    Note(body: 'I am a body',colorName: ColorName.GERY),
    Note( body: 'I am a body',colorName: ColorName.ORANGE),
    Note(body: 'I am a body',colorName: ColorName.RED),
    Note(body: 'I am a body'),
  ];
  final TextStyle _heading1 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
      color: Colors.black87
  );
  final TextStyle _paragraph = TextStyle(
      fontSize: 14,
    color: Colors.black87
  );
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 20),
        itemCount: notes.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12.0,
          childAspectRatio: 1.9
        ),
        itemBuilder: (context, index) {
          return Container(

            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
            decoration: BoxDecoration(
              color: noteColors[notes[index].colorName],
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(color: noteColors[notes[index].colorName],width: 0.5)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(notes[index].body,style: _paragraph,)
              ],
            ),
          );
        });
  }
}
