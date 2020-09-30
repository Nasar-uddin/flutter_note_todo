import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gnotes/models/todo.dart';
import 'package:gnotes/providers/todo_provider.dart';
import 'package:gnotes/widgets/single_todo_item.dart';
import 'package:provider/provider.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoData = Provider.of<TodoProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: FutureBuilder<List<Todo>>(
        future: todoData.todos,
        // ignore: missing_return
        builder: (BuildContext context, AsyncSnapshot<List<Todo>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasData) {
                if (snapshot.data.length > 0) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return ChangeNotifierProvider.value(
                        value: snapshot.data[index],
                        child: SingleTodoItem(),
                      );
                    },
                  );
                }
              } else {
                return Text('No todos');
              }
              break;
            default:
              return Text('Waiting');
          }
        },
      ),
    );
  }
}
