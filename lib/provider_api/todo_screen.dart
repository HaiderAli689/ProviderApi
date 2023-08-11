
import 'package:flutter/material.dart';
import 'package:learning/provider_api/todo_provider.dart';
import 'package:provider/provider.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TodoProvider>(context, listen: false).getAllTodo();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo Screen'),
      ),
      body: Consumer<TodoProvider>(builder: (context, value, child){
        final todos = value.todo;
        return ListView.builder(
          itemCount:todos.length ,
            itemBuilder: (context, index){
            final todo = todos[index];
            return ListTile(
              title: Text(todo.title.toString(),style: TextStyle(
                  color: todo.completed! ? Colors.grey : Colors.black
              ),),
              leading: CircleAvatar(
                  child: Text(todo.id.toString())),

            );
        });
      }),
    );
  }
}
