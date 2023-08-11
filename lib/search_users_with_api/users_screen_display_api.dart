import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:learning/favourite/favorite_screen.dart';
import 'package:learning/search_users_with_api/search.dart';
import 'package:learning/users.dart';
import 'package:http/http.dart' as http;

class UserSerchScreenApi extends StatefulWidget {
  const UserSerchScreenApi({Key? key}) : super(key: key);

  @override
  State<UserSerchScreenApi> createState() => _UserSerchScreenApiState();
}

class _UserSerchScreenApiState extends State<UserSerchScreenApi> {
  ApiServices api = ApiServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    api.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Screen'),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchUsers());
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: FutureBuilder<List<Users>>(
          future: api.getData(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            } else {
              return ListView.builder(
                  itemCount: api.users.length,
                  itemBuilder: (context, index) {
                    Users user = api.users[index];
                    return ListTile(
                      title: Text(user.name.toString()),
                      trailing: Text(user.company.name.toString()),
                      subtitle: Text(user.email.toString()),
                      leading: Container(
                          height: 46,
                          width: 46,
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(6)),
                          child: Center(
                            child: Text(
                              user.id.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    FavoriteDcreen(user: api.users[index])));
                      },
                    );
                  });
            }
          }),
    );
  }
}

class ApiServices {
  List<Users> users = [];

  Future<List<Users>> getData({String? query}) async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      print(response);
      final List<Users> data = usersFromJson(response.body);
      users = data;
      if (query != null) {
        users = users
            .where((element) =>
                element.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
      return data;
    }

    return users;
  }
}
