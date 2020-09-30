import 'package:flutter/material.dart';
import 'package:gnotes/models/todo.dart';
import 'package:gnotes/providers/todo_provider.dart';
import 'package:provider/provider.dart';

class TodoModal extends StatelessWidget {
  
  TodoModal({this.todo});
  final Todo todo;
  

  @override
  Widget build(BuildContext context) {
    final todoData = Provider.of<TodoProvider>(context);
    final TextEditingController tec = TextEditingController(text: todo.todo);
    return Container(
      color: Color(0xFF737373),
      child: Container(
        padding: MediaQuery.of(context).viewInsets,
        decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(10),
                topRight: const Radius.circular(10))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: tec,
              autofocus: true,
              onSubmitted: (value){
                print(value);
                todo.todo = value;
                // print(todo.toMap());
                todoData.updateTodo(todo);
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 30,horizontal: 20)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
