import 'dart:convert';

import 'package:mvc_api/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductsController{
  Future<ProductModel> getProducts () async{
    var url = Uri.parse("https://dummyjson.com/products?");
    var response = await http.get(url);
    return ProductModel.fromJson(jsonDecode(response.body));
  }
}