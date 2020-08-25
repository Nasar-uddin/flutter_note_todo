import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:gnotes/constrain/colors.dart';

class AddNoteScreen extends StatelessWidget {
  final TextEditingController tec = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<Color> myColors = _getColors();
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
              height: 46,
              width: double.infinity,
              child: FlatButton(
                color: Theme.of(context).accentColor,
                child: Text(
                  'Add Note',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
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
