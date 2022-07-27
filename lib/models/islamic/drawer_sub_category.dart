import 'dart:convert';
/// subcategory : [{"id":69,"category_id":"65","sub_category_slug_name":"ator"},{"id":70,"category_id":"65","sub_category_slug_name":"halal-perfume"},{"id":71,"category_id":"68","sub_category_slug_name":"black-seed"},{"id":72,"category_id":"68","sub_category_slug_name":"khejur"},{"id":73,"category_id":"68","sub_category_slug_name":"olive"},{"id":74,"category_id":"68","sub_category_slug_name":"teen"},{"id":75,"category_id":"73","sub_category_slug_name":"arabic-caligraphy"},{"id":77,"category_id":"73","sub_category_slug_name":"arabic-showpice"},{"id":78,"category_id":"73","sub_category_slug_name":"rehal"},{"id":79,"category_id":"63","sub_category_slug_name":"jayanamaj"},{"id":80,"category_id":"63","sub_category_slug_name":"tasbis"},{"id":81,"category_id":"64","sub_category_slug_name":"abaya-borka"},{"id":82,"category_id":"64","sub_category_slug_name":"ehram-cloth"},{"id":83,"category_id":"63","sub_category_slug_name":"meswak"},{"id":84,"category_id":"64","sub_category_slug_name":"panjabbi"},{"id":85,"category_id":"63","sub_category_slug_name":"tupi"},{"id":86,"category_id":"64","sub_category_slug_name":"hijab"},{"id":87,"category_id":"64","sub_category_slug_name":"scarfe"}]

DrawerSubCategory drawerSubCategoryFromJson(String str) => DrawerSubCategory.fromJson(json.decode(str));
String drawerSubCategoryToJson(DrawerSubCategory data) => json.encode(data.toJson());
class DrawerSubCategory {
  DrawerSubCategory({
      List<Subcategory>? subcategory,}){
    _subcategory = subcategory;
}

  DrawerSubCategory.fromJson(dynamic json) {
    if (json['subcategory'] != null){
      _subcategory = [];
      json['subcategory'].forEach((v){
        _subcategory?.add(Subcategory.fromJson(v));
      });
    }
  }
  List<Subcategory>? _subcategory;
  List<Subcategory>? get subcategory => _subcategory;

  Map<String, dynamic> toJson(){
    final map = <String, dynamic>{};
    if (_subcategory != null) {
      map['subcategory'] = _subcategory?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 69
/// category_id : "65"
/// sub_category_slug_name : "ator"

Subcategory subcategoryFromJson(String str) => Subcategory.fromJson(json.decode(str));
String subcategoryToJson(Subcategory data) => json.encode(data.toJson());
class Subcategory {
  Subcategory({
      int? id, 
      String? categoryId, 
      String? subCategorySlugName,}){
    _id = id;
    _categoryId = categoryId;
    _subCategorySlugName = subCategorySlugName;
}

  Subcategory.fromJson(dynamic json) {
    _id = json['id'];
    _categoryId = json['category_id'];
    _subCategorySlugName = json['sub_category_slug_name'];
  }
  int? _id;
  String? _categoryId;
  String? _subCategorySlugName;

  int? get id => _id;
  String? get categoryId => _categoryId;
  String? get subCategorySlugName => _subCategorySlugName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['category_id'] = _categoryId;
    map['sub_category_slug_name'] = _subCategorySlugName;
    return map;
  }

}