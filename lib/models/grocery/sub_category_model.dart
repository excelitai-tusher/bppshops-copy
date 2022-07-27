class GSubCategory {
  List<GetGsubcategory>? getsubcategory;

  GSubCategory({this.getsubcategory});

  GSubCategory.fromJson(Map<String, dynamic> json) {
    if (json['getsubcategory'] != null) {
      getsubcategory = <GetGsubcategory>[];
      json['getsubcategory'].forEach((v) {
        getsubcategory!.add(new GetGsubcategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.getsubcategory != null) {
      data['getsubcategory'] =
          this.getsubcategory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetGsubcategory {
  String? id;
  String? subCategoryName;
  String? subcategoryImage;

  GetGsubcategory({this.id, this.subCategoryName, this.subcategoryImage});

  GetGsubcategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subCategoryName = json['sub_category_name'];
    subcategoryImage = json['subcategory_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sub_category_name'] = this.subCategoryName;
    data['subcategory_image'] = this.subcategoryImage;
    return data;
  }
}