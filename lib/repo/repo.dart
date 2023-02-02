import 'dart:convert';

import 'package:api_integration/models/models.dart';
import 'package:http/http.dart ' as http;

class DataService{
  Future <List<ProductModel>> getService()async{
    var response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if(response.statusCode == 200){
      List<dynamic> data = await json.decode(response.body);
      List<ProductModel> product = data.map((dynamic e) => ProductModel.fromJson(e)).toList();
     print(product);
      
      return  product;

    }else{
      
      throw 'errror';
    }

  }
}