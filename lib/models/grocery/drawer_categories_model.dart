class GDCategories {
  List<GetGDcategory>? getcategory;

  GDCategories({this.getcategory});

  GDCategories.fromJson(Map<String, dynamic> json) {
    if (json['getcategory'] != null) {
      getcategory = <GetGDcategory>[];
      json['getcategory'].forEach((v) {
        getcategory!.add(new GetGDcategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.getcategory != null) {
      data['getcategory'] = this.getcategory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetGDcategory {
  int? id;
  String? categoryName;
  String? categoryIcon;

  GetGDcategory({this.id, this.categoryName, this.categoryIcon});

  GetGDcategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
    categoryIcon = json['category_icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_name'] = this.categoryName;
    data['category_icon'] = this.categoryIcon;
    return data;
  }
}