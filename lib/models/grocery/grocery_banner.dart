class GroceryBanner {
  Banner12? banner12;

  GroceryBanner({this.banner12});

  GroceryBanner.fromJson(Map<String, dynamic> json) {
    banner12 = json['banner1_2'] != null
        ? new Banner12.fromJson(json['banner1_2'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.banner12 != null) {
      data['banner1_2'] = this.banner12!.toJson();
    }
    return data;
  }
}

class Banner12 {
  String? bennarImg;

  Banner12({this.bennarImg});

  Banner12.fromJson(Map<String, dynamic> json) {
    bennarImg = json['bennar_img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bennar_img'] = this.bennarImg;
    return data;
  }
}