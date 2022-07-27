class GDSubCategories {
  List<GDSubcategory>? subcategory;

  GDSubCategories({this.subcategory});

  GDSubCategories.fromJson(Map<String, dynamic> json) {
    if (json['subcategory'] != null) {
      subcategory = <GDSubcategory>[];
      json['subcategory'].forEach((v) {
        subcategory!.add(new GDSubcategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.subcategory != null) {
      data['subcategory'] = this.subcategory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GDSubcategory {
  int? id;
  String? categoryId;
  String? subCategorySlugName;

  GDSubcategory({this.id, this.categoryId, this.subCategorySlugName});

  GDSubcategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    subCategorySlugName = json['sub_category_slug_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['sub_category_slug_name'] = this.subCategorySlugName;
    return data;
  }
}