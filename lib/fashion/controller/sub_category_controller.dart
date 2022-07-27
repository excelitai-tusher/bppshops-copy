import 'package:flutter/cupertino.dart';

class SubCategoriesController with ChangeNotifier{
  String? selectedSubCategory;
  String? selectedSubSubCategory;
  setSubCategory(String value){
    this.selectedSubCategory=value;
    notifyListeners();
  }

  setSubSubCategory(String value){
    this.selectedSubSubCategory=value;
    notifyListeners();
  }

}