import 'dart:convert';
/// subsubcategories : [{"category_id":"63","subcategory_id":"68","subsubcategory_slug_name":"sub-sub-grocery-category"},{"category_id":"65","subcategory_id":"70","subsubcategory_slug_name":"la-fame"}]

DrawerSubSubCategory drawerSubSubCategoryFromJson(String str) => DrawerSubSubCategory.fromJson(json.decode(str));
String drawerSubSubCategoryToJson(DrawerSubSubCategory data) => json.encode(data.toJson());
class DrawerSubSubCategory {
  DrawerSubSubCategory({
      List<Subsubcategories>? subsubcategories,}){
    _subsubcategories = subsubcategories;
}

  DrawerSubSubCategory.fromJson(dynamic json) {
    if (json['subsubcategories'] != null) {
      _subsubcategories = [];
      json['subsubcategories'].forEach((v) {
        _subsubcategories?.add(Subsubcategories.fromJson(v));
      });
    }
  }
  List<Subsubcategories>? _subsubcategories;

  List<Subsubcategories>? get subsubcategories => _subsubcategories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_subsubcategories != null) {
      map['subsubcategories'] = _subsubcategories?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// category_id : "63"
/// subcategory_id : "68"
/// subsubcategory_slug_name : "sub-sub-grocery-category"

Subsubcategories subsubcategoriesFromJson(String str) => Subsubcategories.fromJson(json.decode(str));
String subsubcategoriesToJson(Subsubcategories data) => json.encode(data.toJson());
class Subsubcategories {
  Subsubcategories({
      String? categoryId, 
      String? subcategoryId, 
      String? subsubcategorySlugName,}){
    _categoryId = categoryId;
    _subcategoryId = subcategoryId;
    _subsubcategorySlugName = subsubcategorySlugName;
}

  Subsubcategories.fromJson(dynamic json) {
    _categoryId = json['category_id'];
    _subcategoryId = json['subcategory_id'];
    _subsubcategorySlugName = json['subsubcategory_slug_name'];
  }
  String? _categoryId;
  String? _subcategoryId;
  String? _subsubcategorySlugName;

  String? get categoryId => _categoryId;
  String? get subcategoryId => _subcategoryId;
  String? get subsubcategorySlugName => _subsubcategorySlugName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category_id'] = _categoryId;
    map['subcategory_id'] = _subcategoryId;
    map['subsubcategory_slug_name'] = _subsubcategorySlugName;
    return map;
  }

}