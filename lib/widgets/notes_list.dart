import 'package:flutter/material.dart';
import 'package:gnotes/constrain/colors.dart';
import 'package:gnotes/providers/note_provider.dart';
import 'package:provider/provider.dart';

class NotesList extends StatelessWidget {
  const NotesList({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TextStyle _paragraph = TextStyle(fontSize: 16, color: Colors.black87);
    final noteData = Provider.of<NoteProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: FutureBuilder(
        future: noteData.getNotes(),
        // ignore: missing_return
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
                if(snapshot.data.length==0) return Container(
                  alignment: Alignment.center,
                  child: Text('No Notes available'),
                );
                // print(snapshot.data[0].toMap());
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Container(
                        // padding: EdgeInsets.symmetric(vertical: 10),
                        margin: EdgeInsets.symmetric(vertical:10),
                        decoration: BoxDecoration(
                          color: noteColors2[snapshot.data[index].colorName]['bgc'],
                          borderRadius: BorderRadius.circular(5.0),
                          boxShadow: [BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.10),
                            blurRadius: 15,
                            offset: Offset(0, 4.0)
                          )]
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
                          title: Text(
                            snapshot.data[index].body,
                            style: _paragraph.copyWith(
                              color: noteColors2[snapshot.data[index].colorName]['tpc']
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top:10),
                            child: Text(
                              '${snapshot.data[index].date}  ${snapshot.data[index].time}',
                              style: TextStyle(
                                color: noteColors2[snapshot.data[index].colorName]['tsc']
                              ),
                            ),
                          ),
                          
                          onTap: (){
                            Navigator.pushNamed(context, '/note_details',arguments: snapshot.data[index]);
                          },
                        ),
                      );
                    });
              }else{
                return Container(
                  child: Text(''),
                );
              }
        },
      ),
    );
  }
}
