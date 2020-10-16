import 'package:flutter/material.dart';
import 'package:gnotes/models/todo.dart';
import 'package:gnotes/screens/add_note_screen.dart';
import 'package:gnotes/widgets/notes_list.dart';
import 'package:gnotes/widgets/todo_list.dart';
import 'package:gnotes/widgets/todo_modal.dart';

class NoteScreen extends StatelessWidget {
  static final routeName = '/';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Builder(builder: (BuildContext context) {
          return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight),
                child: Container(
                  color: Colors.teal,
                  child: SafeArea(
                    child: TabBar(
                          labelPadding: EdgeInsets.symmetric(vertical: 15),
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
                  int tabIndex = DefaultTabController.of(context).index;
                  switch (tabIndex) {
                    case 0:
                      Navigator.pushNamed(context, AddNoteScreen.routeName);
                      break;
                    case 1:
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return TodoModal(
                                todo: Todo(todo: '', isDone: false),
                                forUpdate: false);
                          });
                      break;
                  }
                },
              ),
              body: Container(
                child: TabBarView(
                  children: [NotesList(), TodoList()],
                ),
              ));
        }));
  }
}


/*
AppBar(
                title: Text('Organize your day'),
                centerTitle: true,
                bottom: TabBar(
                      labelPadding: EdgeInsets.symmetric(vertical: 10),
                      // labelColor: Colors.white,
                      unselectedLabelColor: Colors.white,
                      indicator: BoxDecoration(
                          color: Colors.teal[600],
                          border: Border(bottom: BorderSide.none)),
                      tabs: [
                        Text('Notes'),
                        Text('Todos')
                      ],
                    ),
              )
*/

/*
PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight),
                child: Container(
                  color: Colors.teal,
                  child: SafeArea(
                    child: TabBar(
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
              )
*/