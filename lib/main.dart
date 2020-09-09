import 'package:flutter/material.dart';
import 'package:gnotes/providers/note_provider.dart';
import 'package:gnotes/screens/add_note_screen.dart';
import 'package:gnotes/screens/note_details_screen.dart';
import 'package:gnotes/screens/note_screen.dart';
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
          create: (context)=>NoteProvider(),
        ),
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
          '/': (context) => NoteScreen(),
          '/addnote': (context) => AddNoteScreen(),
          '/note_details': (context) => NoteDetailScreen()
        },
      ),
    );
  }
}
