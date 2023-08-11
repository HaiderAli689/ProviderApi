

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learning/api_test/model/Post.dart';

import 'model/Data.dart';
import 'model/Resources.dart';


class ApiTestWithModels extends StatefulWidget {
  const ApiTestWithModels({Key? key, }) : super(key: key);


  @override
  State<ApiTestWithModels> createState() => _ApiTestWithModelsState();
}

class _ApiTestWithModelsState extends State<ApiTestWithModels> {

  //Map<Resources, dynamic> resurces = {};
  List<Resources> resources = [];
  Future<List<Resources>> getResourcesData() async{

    final response = await http.get(Uri
        .parse('https://reqres.in/api/unknown'));
    var data = await jsonDecode(response.body);

    if(response.statusCode == 200){
      print(response.body.toString());
      for(Map<String, dynamic> i in data){
        resources.add(Resources.fromJson(i));
      }

      return resources;
    }
    return resources;

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getResourcesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: FutureBuilder<List<Resources>>(
          future: getResourcesData(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: const CircularProgressIndicator());
            }else {
              return ListView.builder(
                  itemCount: resources.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        onTap: (){
                        },
                        title: resources[index] == null ? const CircularProgressIndicator() : Text(resources[index].data.toString(),style: TextStyle(
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
