import 'package:flutter/foundation.dart';
import 'package:gnotes/helpers/todo_db_helper.dart';

class Todo with ChangeNotifier{
  int id;
  String addedOn;
  String todo;
  bool isDone;

  final String idName = 'id';
  final String todoName = 'todo';
  final String isDoneName = 'isDone';
  final String addedOnName = 'addedOn';
  final TodoDbHelper todoDbHelper = TodoDbHelper.instance;

  Todo({
    @required this.todo,
    @required this.isDone,
    this.id,
    this.addedOn
  });

  Todo.fromMap(Map<String,dynamic> map){
    if(map[idName]!=null){
      id = map[idName];
    }
    todo = map[todoName];
    isDone = map[isDoneName]==0?false:true;
    addedOn = map[addedOnName];
  }
  Map<String,dynamic> toMap(){
    return {
      idName:id,
      todoName: todo,
      isDoneName: isDone,
      addedOnName: addedOn
    };
  }
  toggleIsDone() async {
    int result = await todoDbHelper.toggleIsDone(this);
    if(result==1){
      isDone = !isDone;
      notifyListeners();
    }else{
      print('Error togging todo');
    }
  }
}