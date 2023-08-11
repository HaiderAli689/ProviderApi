
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learning/provider_api/TodoModel.dart';

class TodoServices{

  List<TodoModel> todos = [];
  Future<List<TodoModel>> getAllData() async{
    final response =await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    if(response.statusCode == 200){
      print(response);
      final data = jsonDecode(response.body);
      for(Map i in data){
        todos.add(TodoModel.fromJson(i));
      }
      return todos;
    }
    return todos;

  }
  
}