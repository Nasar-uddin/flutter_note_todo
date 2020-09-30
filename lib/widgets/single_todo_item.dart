import 'package:flutter/material.dart';
import 'package:gnotes/models/todo.dart';
import 'package:gnotes/widgets/todoModal.dart';
import 'package:provider/provider.dart';

class SingleTodoItem extends StatelessWidget {
  // const SingleTodoItem({this.todo});
  // final Todo todo;
  @override
  Widget build(BuildContext context) {
    final todo = Provider.of<Todo>(context);
    return GestureDetector(
      onLongPress: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context){
            return TodoModal(todo: todo);
          }
        );
      },
      child: Row(
        children: [
          Checkbox(
              value: todo.isDone,
              onChanged: (value) {
                todo.toggleIsDone();
                // print(value);
                // todoData.toggleTodoDone(todo);
              }),
          Expanded(child: Text(todo.todo)),
          IconButton(
            icon: Icon(
              Icons.delete,
              size: 20,
              color: Colors.red[300],
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}