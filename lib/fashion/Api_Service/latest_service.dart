import '../model/Fashion_Model/latest_product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LatestService{
  Future<LatestProduct_Model>getLatestService()async{
    Map<String,dynamic>?result;
    try{
      String url ="https://bppshops.com/api/fashion/latestproduct";
      http.Response response=await http.get(Uri.parse(url));
      if(response.statusCode==200){
        result =convert.jsonDecode(response.body);
        print("Latest Service Data: ${response.body}");
        return LatestProduct_Model.fromJson(result!);

      }

    }catch(e){
      print(e.toString());
    }return LatestProduct_Model.fromJson(result!);

  }
}