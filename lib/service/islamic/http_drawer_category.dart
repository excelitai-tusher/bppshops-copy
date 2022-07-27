import 'dart:convert';
import 'package:http/http.dart'as http;

import '../../models/islamic/drawer_sub_category.dart';
import '../../models/islamic/drawer_sub_sub_category.dart';
import '../../models/islamic/home_page_category.dart';

Future<List<Getcategory>?> getDrawerCategory() async {
  final response =
  await http.get(Uri.parse('https://bppshops.com/api/bs/category_view'));
  if (response.statusCode == 200){
    final json = jsonDecode(response.body);
    Category category = Category.fromJson(json);
    return category.getcategory;
  } else {
    throw Exception(
        'Failed to load >>>>Status Code>>> :${response.statusCode}');
  }
}

Future<List<Subcategory>?> getDrawerSubCategory() async {
  final response = await http.get(Uri.parse('https://bppshops.com/api/sidebar_subcategory'));
  if (response.statusCode == 200){
    final json = jsonDecode(response.body);
    DrawerSubCategory subCategory = DrawerSubCategory.fromJson(json);
    return subCategory.subcategory;
  } else {
    throw Exception(
        'Failed to load >>>>Status Code>>> :${response.statusCode}');
  }
}
Future<List<Subsubcategories>?> getDrawerSubSubCategory() async {
  final response = await http.get(Uri.parse('https://bppshops.com/api/sidebar_SubSubProduct'));
  if (response.statusCode == 200){
    final json = jsonDecode(response.body);
    DrawerSubSubCategory subCategory = DrawerSubSubCategory.fromJson(json);
    return subCategory.subsubcategories;
  } else {
    throw Exception(
        'Failed to load >>>>Status Code>>> :${response.statusCode}');
  }
}