class TopRated_Model {
  List<TopRated>? topRated;

  TopRated_Model({this.topRated});

  TopRated_Model.fromJson(Map<String, dynamic> json) {
    if (json['top_rated'] != null) {
      topRated = <TopRated>[];
      json['top_rated'].forEach((v) {
        topRated!.add(new TopRated.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.topRated != null) {
      data['top_rated'] = this.topRated!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TopRated {
  int? id;
  String? productName;
  String? productThambnail;
  String? sellingPrice;
  String? discountPrice;
  String? reviewSumQuality;

  TopRated(
      {this.id,
        this.productName,
        this.productThambnail,
        this.sellingPrice,
        this.discountPrice,
        this.reviewSumQuality});

  TopRated.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    productThambnail = json['product_thambnail'];
    sellingPrice = json['selling_price'];
    discountPrice = json['discount_price'];
    reviewSumQuality = json['review_sum_quality'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_name'] = this.productName;
    data['product_thambnail'] = this.productThambnail;
    data['selling_price'] = this.sellingPrice;
    data['discount_price'] = this.discountPrice;
    data['review_sum_quality'] = this.reviewSumQuality;
    return data;
  }
}
