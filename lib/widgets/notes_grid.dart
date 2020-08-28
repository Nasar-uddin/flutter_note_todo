import 'package:flutter/material.dart';
import 'package:gnotes/constrain/colors.dart';
import 'package:gnotes/models/note.dart';
import 'package:gnotes/providers/note_provider.dart';
import 'package:provider/provider.dart';

class NoteGrid extends StatelessWidget {
  // final TextStyle _heading1 = TextStyle(
  //     fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black87);
  final TextStyle _paragraph = TextStyle(fontSize: 14, color: Colors.black87);
  @override
  Widget build(BuildContext context) {
    final noteData = Provider.of<NoteProvider>(context);
    return FutureBuilder(
      future: noteData.getNotes(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case ConnectionState.done:
            if (snapshot.hasData) {
              // print(snapshot.data);
              return GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                  itemCount: snapshot.data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12.0,
                      childAspectRatio: 1.9),
                  itemBuilder: (context, index) {
                    return Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      decoration: BoxDecoration(
                          color: noteColors[snapshot.data[index].colorName],
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                              color: noteColors[snapshot.data[index].colorName],
                              width: 0.5)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data[index].body,
                            style: _paragraph,
                          )
                        ],
                      ),
                    );
                  });
            } else {
              return Container(
                child: Text('No notes'),
              );
            }
            break;
          default:
            return Container(
              child: Text('No notes'),
            );
        }
      },
    );
  }
}
