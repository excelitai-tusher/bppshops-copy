import 'package:bpp_shop/FASHION/Api_Service/categories_service.dart';
import 'package:bpp_shop/FASHION/Model/categoriesModel.dart';
import 'package:flutter/material.dart';

class CatgoriesProvider extends ChangeNotifier {
  List<Getcategorys>? categorilist = [];
  getcategoriesItem() async {
    var data = await CategoriesService().getCagoriesData();
    categorilist = data.getcategory;
    notifyListeners();
  }
}
