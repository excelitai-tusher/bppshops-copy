import 'dart:convert';
/// getsubcategory : [{"id":79,"sub_category_name":"Jayanamaj","subcategory_image":"upload/subcategory/1734526746174160.webp","category":null},{"id":80,"sub_category_name":"Tasbis","subcategory_image":"upload/subcategory/1734526717959606.webp","category":null},{"id":83,"sub_category_name":"Meswak","subcategory_image":"upload/subcategory/1734526596593113.webp","category":null},{"id":85,"sub_category_name":"Tupi","subcategory_image":"upload/subcategory/1734526536208461.webp","category":null}]

SubCategory subCategoryFromJson(String str) => SubCategory.fromJson(json.decode(str));
String subCategoryToJson(SubCategory data) => json.encode(data.toJson());
class SubCategory {
  SubCategory({
      List<Getsubcategory>? getsubcategory,}){
    _getsubcategory = getsubcategory;
}

  SubCategory.fromJson(dynamic json) {
    if (json['getsubcategory'] != null) {
      _getsubcategory = [];
      json['getsubcategory'].forEach((v) {
        _getsubcategory?.add(Getsubcategory.fromJson(v));
      });
    }
  }
  List<Getsubcategory>? _getsubcategory;

  List<Getsubcategory>? get getsubcategory => _getsubcategory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_getsubcategory != null) {
      map['getsubcategory'] = _getsubcategory?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 79
/// sub_category_name : "Jayanamaj"
/// subcategory_image : "upload/subcategory/1734526746174160.webp"
/// category : null

Getsubcategory getsubcategoryFromJson(String str) => Getsubcategory.fromJson(json.decode(str));
String getsubcategoryToJson(Getsubcategory data) => json.encode(data.toJson());
class Getsubcategory {
  Getsubcategory({
      int? id, 
      String? subCategoryName, 
      String? subcategoryImage, 
      dynamic category,}){
    _id = id;
    _subCategoryName = subCategoryName;
    _subcategoryImage = subcategoryImage;
    _category = category;
}

  Getsubcategory.fromJson(dynamic json) {
    _id = json['id'];
    _subCategoryName = json['sub_category_name'];
    _subcategoryImage = json['subcategory_image'];
    _category = json['category'];
  }
  int? _id;
  String? _subCategoryName;
  String? _subcategoryImage;
  dynamic _category;

  int? get id => _id;
  String? get subCategoryName => _subCategoryName;
  String? get subcategoryImage => _subcategoryImage;
  dynamic get category => _category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['sub_category_name'] = _subCategoryName;
    map['subcategory_image'] = _subcategoryImage;
    map['category'] = _category;
    return map;
  }

}