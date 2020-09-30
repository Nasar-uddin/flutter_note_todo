import 'package:flutter/foundation.dart';
import 'package:gnotes/helpers/todo_db_helper.dart';
import 'package:gnotes/models/todo.dart';

class TodoProvider with ChangeNotifier{
  List<Todo> _todos = [];
  bool todoLoaded = false;
  TodoDbHelper todoDbHelper = TodoDbHelper.instance;
  Future<List<Todo>> get todos async {
    _todos = [];
    List<Map<String, dynamic>> todolist = await todoDbHelper.fetchTodo();
    // print(todolist);
    todolist.forEach((map) { 
      _todos.add(Todo.fromMap(map));
    });
    todoLoaded = true;
    return [..._todos];
  }
  Future<List<Todo>> getTodos() async {
    _todos = [];
    List<Map<String, dynamic>> todolist = await todoDbHelper.fetchTodo();
    // print(todolist);
    todolist.forEach((map) { 
      _todos.add(Todo.fromMap(map));
    });
    todoLoaded = true;
    return _todos;
  }
  insertTodo(Todo todo){
    todoDbHelper.insertTodo(todo);
    // getTodos();
    notifyListeners();
  }
  updateTodo(Todo todo){
    todoDbHelper.updateTodo(todo);
    // getTodos();
    notifyListeners();
  }
  toggleTodoDone(Todo todo){
    // todoDbHelper.toggleIsDone(todo);
    // notifyListeners();
  }
}