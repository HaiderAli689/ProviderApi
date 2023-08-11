/*

import 'package:learning/api_test/model/Products.dart';
import 'package:http/http.dart' as http;

import 'api_test_of_product.dart';

Future<List<Product>> products() async {
   var client = http.Client();

  var url = Uri.http(Config.apiUrl,);

  var response = await client.get(url);

  if(response.statusCode==200){
    final result = productFromJson(response.body);

    return result;
  }else{
    throw Exception("Failed get Product List");
  }
}*/
