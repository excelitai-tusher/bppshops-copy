import 'package:bpp_shop/models/grocery/drawer_categories_model.dart';
import 'package:bpp_shop/models/grocery/drawer_sub_categories_model.dart';
import 'package:bpp_shop/models/grocery/drawer_sub_sub_categories_model.dart';
import 'package:bpp_shop/models/grocery/grocery_special_offers.dart';
import 'package:bpp_shop/service/grocery/http_grocery_drawer.dart';
import 'package:bpp_shop/service/grocery/http_special_offers_grocery.dart';


import 'package:flutter/cupertino.dart';


class GroceryDrawerViewModel with ChangeNotifier{

 int? gspacialOffers;
 List<GSpecialOffers>? gSpecialOffersList;
  List<GetGDcategory>? gDcategoryList;
  List<GDSubcategory>? gDsubCategoryList;
  List<GDSubcategory>? gDonClickSubCategoryList;
  List<List<GDSubcategory>> gDonClickSubCategoryListStorage=[];
  List<GDSubsubcategories>? gDsubSubcategoryList;
  List<GDSubsubcategories>? checkGDsubSubcategoryList;
  List<GDSubsubcategories>? gDonClickSubSubCategoryList;
  List<List<GDSubsubcategories>> gDonClickSubSubCategoryListStorage=[];
  void loadGDrawerData() async {
 final specialOffersList=await getGSpecialOffer();
 gSpecialOffersList=specialOffersList!;
  gspacialOffers=specialOffersList.length;
    final listOfCategory=await getGDrawerCategory();
    final listOfSubCategory=await getGDrawerSubCategory();
    final listOfSubSubCategory=await getGDrawerSubSubCategory();
    gDcategoryList=listOfCategory;
    gDsubCategoryList=listOfSubCategory;
    gDsubSubcategoryList=listOfSubSubCategory;
    // print(categoryList![0].categorySlugName);
    // print("<<<<<<<<<category>>>>>>>");
    // print(subCategoryList![0].subCategorySlugName);
    // print("<<<<<<<<<subCategoryList>>>>>>>");
    // print(subSubcategoryList![0].subsubcategorySlugName);
    // print("<<<<<<<<<subSubCategoryList>>>>>>>");
    notifyListeners();
  }

  // void loadTotalSpecialOffers()async{
  //   spacialOffers
  // }
 checkSubSubCategory(String subCategoryID){
   checkGDsubSubcategoryList=gDsubSubcategoryList!.where((element) => subCategoryID.toString()==element.subcategoryId.toString()).toList();
   return checkGDsubSubcategoryList!;
 }

  void getOnClickSubCategory(int categoryId){
    gDonClickSubCategoryList=gDsubCategoryList!.where((element) => element.id==categoryId).toList();
    gDonClickSubCategoryListStorage.add(gDonClickSubCategoryList!);
    notifyListeners();
  }
  void getOnClickSubSubCategory(int subcategoryId){
    gDonClickSubSubCategoryList=gDsubSubcategoryList!.where((element) => element.subcategoryId==subcategoryId).toList();
    gDonClickSubSubCategoryListStorage.add(gDonClickSubSubCategoryList!);
    notifyListeners();
  }
}