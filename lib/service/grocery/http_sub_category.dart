import 'dart:convert';
import 'package:bpp_shop/models/grocery/sub_category_model.dart';
import 'package:http/http.dart' as http;


Future<List<GetGsubcategory>> getGSubCategory(String id) async {
  final response =
  await http.get(Uri.parse('https://bppshops.com/api/gs/${id}'));
  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);

    GSubCategory subCategory = GSubCategory.fromJson(json);
    return subCategory.getsubcategory!;
  } else {
    throw Exception(
        'Failed to load >>>>Status Code>>> :${response.statusCode}');
  }
}