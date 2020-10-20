import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gnotes/models/todo.dart';
import 'package:gnotes/providers/todo_provider.dart';
import 'package:gnotes/widgets/single_todo_item.dart';
import 'package:provider/provider.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final todoData = Provider.of<TodoProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: FutureBuilder<List<Todo>>(
        future: todoData.todos,
        // ignore: missing_return
        builder: (BuildContext context, AsyncSnapshot<List<Todo>> snapshot) {
          if(snapshot.hasData){
            if(snapshot.data.length==0){
              return Center(child: Text('No todo'));
            }else{
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
          }else{
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
