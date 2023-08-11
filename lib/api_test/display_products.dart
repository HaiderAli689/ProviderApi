
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:learning/api_test/model/Post.dart';
import 'package:http/http.dart' as http;

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key,}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
   List<Post> post = [];
  
  Future<List<Post>> getPostData() async{

    final response = await http.get(Uri
        .parse('https://jsonplaceholder.typicode.com/posts'));
    if(response.statusCode == 200){
      print(response.body);
      var data = jsonDecode(response.body);
      for(Map i in data){
        post.add(Post.fromJson(i));
      }
      return post;
    }
    return post;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Post>>(
          future: getPostData(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: const CircularProgressIndicator());
            }else {
              return ListView.builder(
                  itemCount: post.toString().length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        onTap: (){
                        },
                        title: Text(post[index].title,style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                        ),),
                        subtitle:Text(post[index].body,style: TextStyle(
                            fontSize: 16,
                        ),),
                        trailing: Text(post[index].id.toString(),style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                    );
                  });
            }
          }),

    );
  }
}
