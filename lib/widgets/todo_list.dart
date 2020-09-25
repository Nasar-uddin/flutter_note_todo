import 'package:flutter/material.dart';
import 'package:gnotes/providers/todo_provider.dart';
import 'package:provider/provider.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoData = Provider.of<TodoProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: FutureBuilder(
        future: todoData.todos,
        // ignore: missing_return
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasData) {
                if (snapshot.data.length > 0) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onLongPress: (){
                          showModalBottomSheet(context: context, builder: (context){
                            return Container(
                              child: Column(
                                children: [
                                  Text(snapshot.data[index].todo),
                                ],
                              ),
                            );
                          });
                        },
                        child: Row(
                          children: [
                            Checkbox(
                                value: snapshot.data[index].isDone,
                                onChanged: (value) {
                                  // print(value);
                                }),
                            Expanded(child: Text(snapshot.data[index].todo)),
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
