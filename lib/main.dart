import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learning/api_test/api_test_of_product.dart';
import 'package:learning/display_screen.dart';
import 'package:learning/fake_api/check_api_screen.dart';
import 'package:learning/favourite/favorite_screen.dart';
import 'package:learning/favourite/favoritr_provider.dart';
import 'package:learning/provider_api/todo_provider.dart';
import 'package:learning/provider_api/todo_screen.dart';
import 'package:learning/search/search_screen.dart';
import 'package:learning/search_users_with_api/users_screen_display_api.dart';
import 'package:learning/user_screen.dart';
import 'package:learning/users.dart';
import 'package:provider/provider.dart';

import 'api_test/display_products.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Users users;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FavoriteProvider()),
        ChangeNotifierProvider(create: (context) => TodoProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TodoScreen(),
      ),
    );
  }
}


class PostListScreen extends StatefulWidget {
  @override
  _PostListScreenState createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  late List<Post> posts;

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      posts = data.map((item) => Post.fromJson(item)).toList();
      setState(() {});
    } else {
      throw Exception('Failed to load posts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post List')),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return ListTile(
            title: Text(post.title),
            subtitle: Text(post.body),
          );
        },
      ),
    );
  }
}

class Post {
  final int id;
  final String title;
  final String body;

  const Post({
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
