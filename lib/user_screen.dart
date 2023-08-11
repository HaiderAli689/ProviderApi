
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:learning/display_screen.dart';
import 'package:learning/favourite/favorite_screen.dart';
import 'package:learning/users.dart';
import 'package:http/http.dart' as http;

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  
  List<Users> users = [];

  Future<List<Users>> getData()async{
    
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if(response.statusCode == 200){
      print(response);
      final  List<Users> data = usersFromJson(response.body);
      users = data;
      return data;
    }

    return users;
    
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Screen'),
      ),
      body: FutureBuilder<List<Users>>(
        future: getData(),
          builder: (context, snapshot){
        if(!snapshot.hasData){
          return CircularProgressIndicator();
        }else{

          return ListView.builder(
            itemCount: users.length,
              itemBuilder: (context, index){
                Users user = users[index];
              return ListTile(
                title: Text(user.name.toString()),
                trailing: Text(user.company.name.toString()),
                subtitle: Text(user.email.toString()),
                leading: Text(user.id.toString()),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FavoriteDcreen(user: users[index])));
                },
              );
              });
        }
      }),
    );
  }
}
