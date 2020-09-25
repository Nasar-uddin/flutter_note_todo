import 'package:flutter/material.dart';
import 'package:gnotes/providers/note_provider.dart';
import 'package:gnotes/providers/todo_provider.dart';
import 'package:gnotes/screens/add_note_screen.dart';
import 'package:gnotes/screens/note_details_screen.dart';
import 'package:gnotes/screens/note_screen.dart';
import 'package:gnotes/screens/test_tab.dart';
import 'package:gnotes/screens/todo_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context)=> NoteProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TodoProvider()
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          NoteScreen.routeName: (context) => NoteScreen(),
          AddNoteScreen.routeName: (context) => AddNoteScreen(),
          NoteDetailScreen.routeName: (context) => NoteDetailScreen(),
          TodoScreen.routeName: (context) => TodoScreen(),
          TestTab.routeName: (context) => TestTab()
        },
      ),
    );
  }
}
