
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../api_test/model/Data.dart';

class CheckApiScreen extends StatefulWidget {
  const CheckApiScreen({Key? key}) : super(key: key);

  @override
  State<CheckApiScreen> createState() => _CheckApiScreenState();
}

class _CheckApiScreenState extends State<CheckApiScreen> {
  
  List<Data> data = [];
  
  Future<List<Data>> getData() async{
    
    final response = await http.get(Uri.parse('https://fakerapi.it/api/v1/persons?_locale=fr_FR'));
    var list = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      //print(response.body);
      data.add(Data.fromJson(list));
    }
    return data;
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
      body: FutureBuilder<List<Data>>(
        future: getData(),
          builder: (context, snapshot){
          if(snapshot.hasData){
            return const Center(child:
              CircularProgressIndicator(),);
          }else{
            return ListView.builder(
              itemCount: data.length,
                itemBuilder: (context, index){
                return Column(
                  children: [
                    Center(child: Text(data[index].name.toString()))
                  ],
                );
                });
          }
          }),
    );
  }
}
