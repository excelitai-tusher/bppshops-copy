import 'dart:convert';

import 'package:bpp_shop/view/islamic/category/screen_sub_sub_category.dart';
import 'package:bpp_shop/view/islamic/category/screen_sub_sub_category_products_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../../models/islamic/SubCategory.dart';
import '../../models/islamic/SubSubCategory.dart';
import '../../models/islamic/home_page_category.dart';
import '../../view/islamic/category/screen_sub_category_products_view.dart';

Future<List<Getcategory>?> getCategorys() async {
  final response =
      await http.get(Uri.parse('https://bppshops.com/api/bs/category_view'));
  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    print(response.body);
    Category category = Category.fromJson(json);
    return category.getcategory;
  } else {
    throw Exception(
        'Failed to load >>>>Status Code>>> :${response.statusCode}');
  }
}

//https://bppshops.com/api/bs/63
Future<List<Getsubcategory>?> getSubCategory(String id) async {
  final response =
      await http.get(Uri.parse('https://bppshops.com/api/bs/${id}'));
  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    print(response.body);
    SubCategory subCategory = SubCategory.fromJson(json);
    return subCategory.getsubcategory;
  } else {
    throw Exception(
        'Failed to load >>>>Status Code>>> :${response.statusCode}');
  }
}

getSubSubCategory(
    String category_id, String subCategory_id, BuildContext context,String subCategorySlageName) async {
  final response = await http.get(Uri.parse(
      'https://bppshops.com/api/bs/${category_id}/${subCategory_id}'));
  if (response.statusCode == 200){
    final json = jsonDecode(response.body);
    SubSubCategory subCategory = SubSubCategory.fromJson(json);
    print("productUnderSubCategory "+subCategory.productUnderSubCategory!.length.toString());
    print("getsubsubcategory "+ subCategory.getsubsubcategory!.length.toString());
    if(subCategory.productUnderSubCategory!.length==0){
      print(subCategory.getsubsubcategory![0].subsubcategoryName);
      Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ScreenSubSubCategory(
                subCategorySlugName:subCategorySlageName,
                getsubsubcategoryList:
                subCategory.getsubsubcategory!,
                //subCategoryID: subCateGoryId,
              ),
            ),
          );
    }else{
      List<ProductUnderSubCategory> list=subCategory.productUnderSubCategory! ;
      print(list.length);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => SubCategoryWiseProductView(
            productUnderSubCategoryList: subCategory.productUnderSubCategory!,
            title: subCategorySlageName, subCategoryId: '', categoryId: '',
            //subCategoryID: subCateGoryId,
          ),
        ),
      );
    }
  } else {
    throw Exception(
        'Failed to load >>>>Status Code>>> :${response.statusCode}');
  }
}
