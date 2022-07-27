
import '../model/Fashion_Model/topRated_model.dart';
import 'package:http/http.dart'as http;
import 'dart:convert' as convert;


class TopRated_Service{
  Future<TopRated_Model>getTopRatedList_Service()async{
    Map<String,dynamic>?result;
    try{
      String url="https://bppshops.com/api/fashion/fashion_toprated";
      http .Response response =await http.get(Uri.parse(url));
      if(response.statusCode==200){
        result=convert.jsonDecode(response.body);
        print("finally done:${response.body}");
        return TopRated_Model.fromJson(result!);
      }
    }catch(e){
      print(e.toString());
    }
    return TopRated_Model.fromJson(result!);


  }
}