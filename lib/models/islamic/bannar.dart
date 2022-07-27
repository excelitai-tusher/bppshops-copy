class Banner {
  List<Banner1>? banner1;

  Banner({this.banner1});

  Banner.fromJson(Map<String, dynamic> json) {
    if (json['banner1'] != null) {
      banner1 = <Banner1>[];
      json['banner1'].forEach((v) {
        banner1!.add(new Banner1.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.banner1 != null) {
      data['banner1'] = this.banner1!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Banner1 {
  String? bennarImg;

  Banner1({this.bennarImg});

  Banner1.fromJson(Map<String, dynamic> json) {
    bennarImg = json['bennar_img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bennar_img'] = this.bennarImg;
    return data;
  }
}