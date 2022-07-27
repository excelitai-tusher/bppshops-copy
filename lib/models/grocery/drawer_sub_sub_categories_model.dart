class GDSubSubCategories {
  List<GDSubsubcategories>? subsubcategories;

  GDSubSubCategories({this.subsubcategories});

  GDSubSubCategories.fromJson(Map<String, dynamic> json) {
    if (json['subsubcategories'] != null) {
      subsubcategories = <GDSubsubcategories>[];
      json['subsubcategories'].forEach((v) {
        subsubcategories!.add(new GDSubsubcategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.subsubcategories != null) {
      data['subsubcategories'] =
          this.subsubcategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GDSubsubcategories {
  int? id;
  String? categoryId;
  String? subcategoryId;
  String? subsubcategorySlugName;

  GDSubsubcategories(
      {this.id,
        this.categoryId,
        this.subcategoryId,
        this.subsubcategorySlugName});

  GDSubsubcategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    subcategoryId = json['subcategory_id'];
    subsubcategorySlugName = json['subsubcategory_slug_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['subcategory_id'] = this.subcategoryId;
    data['subsubcategory_slug_name'] = this.subsubcategorySlugName;
    return data;
  }
}