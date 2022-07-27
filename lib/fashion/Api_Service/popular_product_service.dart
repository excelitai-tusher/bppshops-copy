import 'package:bpp_shop/fashion/Api_Service/top_rated_service.dart';

import 'package:http/http.dart'as http;
import 'dart:convert'as convert;

import '../model/Fashion_Model/popular_model.dart';
class PopularProductservice{
  Future<PopularProduct_Model>getPopularProduct()async{
    Map<String,dynamic>?result;
    try{
      String url="https://bppshops.com/api/fashion/popular_product";
      http .Response response =await http .get(Uri.parse(url));
      if(response.statusCode==200){
        result=convert.jsonDecode(response.body);
        print("finally done ${response.body}");
      }

    }catch(e){
      print(e.toString());
    }
    return PopularProduct_Model.fromJson(result!);

  }
}