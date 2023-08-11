import 'package:flutter/material.dart';
import 'package:learning/search_users_with_api/users_screen_display_api.dart';

import '../favourite/favorite_screen.dart';
import '../users.dart';

class SearchUsers extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.close));
  }

  @override
  Widget buildResults(BuildContext context) {

    ApiServices  api = ApiServices();

    return FutureBuilder<List<Users>>(
        future: api.getData(query: query),
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
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
        child: Text('Search Users'));
  }
}
