import 'package:flutter/material.dart';
import 'package:gnotes/screens/add_note_screen.dart';
import 'package:gnotes/widgets/notes_list.dart';
import 'package:gnotes/widgets/todo_list.dart';

class NoteScreen extends StatelessWidget {
  static final routeName = '/';
  @override
  Widget build(BuildContext context) {
    int tabIndex = 0;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Container(
              color: Colors.teal,
              child: SafeArea(
                child: TabBar(
                  onTap: (index){
                    tabIndex = index;
                  },
                  labelPadding: EdgeInsets.symmetric(vertical: 10),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white,
                  indicator: BoxDecoration(
                      color: Colors.teal[600],
                      border: Border(bottom: BorderSide.none)),
                  tabs: [Text('Notes'), Text('Todos')],
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              // Navigator.pushNamed(context, TodoScreen.routeName);
                
              switch(tabIndex){
                case 0:
                  Navigator.pushNamed(context, AddNoteScreen.routeName);
                  break;
                case 1:
                  print('Todo note');
                  break;
              }
            },
          ),
          body: Container(
            child: TabBarView(
              children: [
                NotesList(),
                TodoList()
              ],
            ),
          )),
    );
  }
}
