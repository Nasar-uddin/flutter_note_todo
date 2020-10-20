import 'package:flutter/material.dart';
import 'package:gnotes/models/todo.dart';
import 'package:gnotes/screens/add_note_screen.dart';
import 'package:gnotes/widgets/notes_list.dart';
import 'package:gnotes/widgets/todo_list.dart';
import 'package:gnotes/widgets/todo_modal.dart';

class NoteScreen extends StatefulWidget {
  static final routeName = '/';

  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  int currentIndex = 0;
  final bodyWidgets = [
      NotesList(key: PageStorageKey('notes')),
      TodoList(key: PageStorageKey('todos'))
    ];
  final PageStorageBucket bucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Organize your day'),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
          
          currentIndex: currentIndex,
          onTap: navTapAction,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.note), label: 'Notes'),
            BottomNavigationBarItem(
                icon: Icon(Icons.list_outlined), label: 'Todos')
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            switch (currentIndex) {
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
        body: PageStorage(
          bucket: bucket,
            child: Container(
            child: bodyWidgets[currentIndex]
          ),
        )
      );
  }

  void navTapAction(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}