import 'package:bpp_shop/service/islamic/http_drawer_category.dart';
import 'package:bpp_shop/service/islamic/http_special_offer.dart';
import 'package:flutter/cupertino.dart';
import '../../models/islamic/drawer_sub_category.dart';
import '../../models/islamic/drawer_sub_sub_category.dart';
import '../../models/islamic/home_page_category.dart';

class DrawerViewModel with ChangeNotifier{

  int? spacialOffers;
  List<Getcategory>? categoryList;
  List<Subcategory>? subCategoryList;
  List<Subcategory>? onClickSubCategoryList;
  List<List<Subcategory>> onClickSubCategoryListStorage=[];
  List<Subsubcategories>? subSubcategoryList;
  List<Subsubcategories>? checkedSubSubcategoryList;
  List<Subsubcategories>? onClickSubSubCategoryList;
  List<List<Subsubcategories>> onClickSubSubCategoryListStorage=[];
  void loadDrawerData() async {
    final specialOffersList=await getSpecialOffer();
    spacialOffers=specialOffersList!.length;
    final listOfCategory=await getDrawerCategory();
    final listOfSubCategory=await getDrawerSubCategory();
    final listOfSubSubCategory=await getDrawerSubSubCategory();
    categoryList=listOfCategory;
    subCategoryList=listOfSubCategory;
    subSubcategoryList=listOfSubSubCategory;
    // print(categoryList![0].categorySlugName);
    // print("<<<<<<<<<category>>>>>>>");
    // print(subCategoryList![0].subCategorySlugName);
    // print("<<<<<<<<<subCategoryList>>>>>>>");
    // print(subSubcategoryList![0].subsubcategorySlugName);
    // print("<<<<<<<<<subSubCategoryList>>>>>>>");
    notifyListeners();
  }

  checkSubSubCategory(String subCategoryID){
    checkedSubSubcategoryList=subSubcategoryList!.where((element) => subCategoryID.toString()==element.subcategoryId.toString()).toList();
    return checkedSubSubcategoryList!;
  }

  void getOnClickSubCategory(int categoryId){
    onClickSubCategoryList=subCategoryList!.where((element) => element.id==categoryId).toList();
    onClickSubCategoryListStorage.add(onClickSubCategoryList!);
    notifyListeners();
  }
  void getOnClickSubSubCategory(int subcategoryId){
    onClickSubSubCategoryList=subSubcategoryList!.where((element) => element.subcategoryId==subcategoryId).toList();
    onClickSubSubCategoryListStorage.add(onClickSubSubCategoryList!);
    notifyListeners();
  }
}