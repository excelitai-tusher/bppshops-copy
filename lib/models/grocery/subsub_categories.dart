class GSubSubCategories {
  List<GSubSubCategory>? subSubCategory;

  GSubSubCategories({this.subSubCategory});

  GSubSubCategories.fromJson(Map<String, dynamic> json) {
    if (json['SubSubCategory'] != null) {
      subSubCategory = <GSubSubCategory>[];
      json['SubSubCategory'].forEach((v) {
        subSubCategory!.add(new GSubSubCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.subSubCategory != null) {
      data['SubSubCategory'] =
          this.subSubCategory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GSubSubCategory {
  String? id;
  String? subsubcategoryName;
  String? subsubcategoryImage;

  GSubSubCategory({this.id, this.subsubcategoryName, this.subsubcategoryImage});

  GSubSubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subsubcategoryName = json['subsubcategory_name'];
    subsubcategoryImage = json['subsubcategory_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subsubcategory_name'] = this.subsubcategoryName;
    data['subsubcategory_image'] = this.subsubcategoryImage;
    return data;
  }
}