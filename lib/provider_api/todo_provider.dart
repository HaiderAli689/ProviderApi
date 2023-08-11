
import 'package:flutter/cupertino.dart';
import 'package:learning/provider_api/todo_services.dart';

import 'TodoModel.dart';

class TodoProvider extends ChangeNotifier{

  TodoServices _services = TodoServices();
  List<TodoModel> _todos = [];
  bool isLoading = false;
  List<TodoModel> get todo => _todos ;
  Future<void> getAllTodo() async{

    isLoading = true;
    notifyListeners();
    final response = await _services.getAllData();
    _todos = response;
    isLoading = false;
    notifyListeners();
  }
}