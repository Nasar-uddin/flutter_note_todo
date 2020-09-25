import 'package:flutter/foundation.dart';

class Todo{
  int id;
  String addedOn;
  String todo;
  bool isDone;

  final String idName = 'id';
  final String todoName = 'todo';
  final String isDoneName = 'isDone';
  final String addedOnName = 'addedOn';

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
}