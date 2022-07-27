class IslamicBanner {
  Banner1? banner1;
  Banner1? banner2;

  IslamicBanner({this.banner1, this.banner2});

  IslamicBanner.fromJson(Map<String, dynamic> json) {
    banner1 =
    json['banner1'] != null ? new Banner1.fromJson(json['banner1']) : null;
    banner2 =
    json['banner2'] != null ? new Banner1.fromJson(json['banner2']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.banner1 != null) {
      data['banner1'] = this.banner1!.toJson();
    }
    if (this.banner2 != null) {
      data['banner2'] = this.banner2!.toJson();
    }
    return data;
  }
}

class Banner1 {
  int? id;
  String? ecomId;
  String? bennarImg;
  String? status;

  Banner1({this.id, this.ecomId, this.bennarImg, this.status});

  Banner1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ecomId = json['ecom_id'];
    bennarImg = json['bennar_img'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ecom_id'] = this.ecomId;
    data['bennar_img'] = this.bennarImg;
    data['status'] = this.status;
    return data;
  }
}