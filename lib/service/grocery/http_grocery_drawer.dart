import 'dart:convert';
import 'package:bpp_shop/models/grocery/drawer_categories_model.dart';
import 'package:bpp_shop/models/grocery/drawer_sub_categories_model.dart';
import 'package:bpp_shop/models/grocery/drawer_sub_sub_categories_model.dart';
import 'package:http/http.dart'as http;

import '../../models/islamic/drawer_sub_category.dart';
import '../../models/islamic/drawer_sub_sub_category.dart';


Future<List<GetGDcategory>?> getGDrawerCategory() async {
  final response =
  await http.get(Uri.parse('https://bppshops.com/api/sidebar_CategoryView_2'));
  if (response.statusCode == 200){
    final json = jsonDecode(response.body);

    GDCategories category = GDCategories.fromJson(json);
    return category.getcategory;
  } else {
    throw Exception(
        'Failed to load >>>>Status Code>>> :${response.statusCode}');
  }
}

Future<List<GDSubcategory>?> getGDrawerSubCategory() async {
  final response = await http.get(Uri.parse('https://bppshops.com/api/sidebar_subcategory_2'));
  if (response.statusCode == 200){
    final json = jsonDecode(response.body);

    GDSubCategories subCategory = GDSubCategories.fromJson(json);
    return subCategory.subcategory;
  } else {
    throw Exception(
        'Failed to load >>>>Status Code>>> :${response.statusCode}');
  }
}
Future<List<GDSubsubcategories>?> getGDrawerSubSubCategory() async {
  final response = await http.get(Uri.parse('https://bppshops.com/api/sidebar_SubSubCategroy'));
  if (response.statusCode == 200){
    final json = jsonDecode(response.body);

    GDSubSubCategories subCategory = GDSubSubCategories.fromJson(json);
    return subCategory.subsubcategories;
  } else {
    throw Exception(
        'Failed to load >>>>Status Code>>> :${response.statusCode}');
  }
}