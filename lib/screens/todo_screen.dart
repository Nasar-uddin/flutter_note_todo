import 'package:flutter/material.dart';
import 'package:gnotes/widgets/todo_list.dart';

class TodoScreen extends StatelessWidget {
  static final routeName = 'todo';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){

          }
        )
        ],
      ),
      body: TodoList(),
    );
  }
}