class GroceryCategories {
  List<GCategory>? category;

  GroceryCategories({this.category});

  GroceryCategories.fromJson(Map<String, dynamic> json) {
    if (json['Category'] != null) {
      category = <GCategory>[];
      json['Category'].forEach((v) {
        category!.add(new GCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.category != null) {
      data['Category'] = this.category!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GCategory {
  String? id;
  String? categoryName;
  String? categoryImage;
  String? categoryIcon;

  GCategory({this.id, this.categoryName, this.categoryImage, this.categoryIcon});

  GCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
    categoryImage = json['category_image'];
    categoryIcon = json['category_icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_name'] = this.categoryName;
    data['category_image'] = this.categoryImage;
    data['category_icon'] = this.categoryIcon;
    return data;
  }
}