

import 'package:bpp_shop/fashion/model/Fashion_Model/brand_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


class BrandService {
  Future<BrandModel> getBrandService() async {
    Map<String, dynamic>? result;
    try {
      String url = 'https://bppshops.com/api/fashion/brands';
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
     result = convert.jsonDecode(response.body);
        print( 'Banner data: $result');
      
        return BrandModel.fromJson(result!) ;
      }
    } catch (e) {
      print(e.toString());
    }
    return BrandModel.fromJson(result!);
  }
}