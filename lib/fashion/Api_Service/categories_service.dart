import 'dart:convert';

import 'package:bpp_shop/FASHION/Model/categoriesModel.dart';
import 'package:http/http.dart' as http;

class CategoriesService {
  Future<CategoriesModel> getCagoriesData() async {
    Map<String, dynamic>? result;
    try {
      String url = 'https://bppshops.com/api/bs/category_view';
      http.Response response = await http.get(Uri.parse(url));
      print(  'provider ${  response.body}');
      if (response.statusCode == 200) {
        result = jsonDecode(response.body);
        print(result);
        return CategoriesModel.fromJson(result!);
      }
    } catch (e) {
      print(' Error has ${e.toString()}');
    }
    return CategoriesModel.fromJson(result!);
  }
}
