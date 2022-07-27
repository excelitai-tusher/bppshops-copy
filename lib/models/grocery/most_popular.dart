class GroceryPopular {
  List<GroceryMostPopularAll>? mostPopularAll;

  GroceryPopular({this.mostPopularAll});

  GroceryPopular.fromJson(Map<String, dynamic> json) {
    if (json['most_popular_all'] != null) {
      mostPopularAll = <GroceryMostPopularAll>[];
      json['most_popular_all'].forEach((v) {
        mostPopularAll!.add(new GroceryMostPopularAll.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mostPopularAll != null) {
      data['most_popular_all'] =
          this.mostPopularAll!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GroceryMostPopularAll {
  String? productId;
  String? total;
  String? productName;
  String? productThambnail;
  String? sellingPrice;
  String? discountPrice;

  GroceryMostPopularAll(
      {this.productId,
        this.total,
        this.productName,
        this.productThambnail,
        this.sellingPrice,
        this.discountPrice});

  GroceryMostPopularAll.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    total = json['total'];
    productName = json['product_name'];
    productThambnail = json['product_thambnail'];
    sellingPrice = json['selling_price'];
    discountPrice = json['discount_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['total'] = this.total;
    data['product_name'] = this.productName;
    data['product_thambnail'] = this.productThambnail;
    data['selling_price'] = this.sellingPrice;
    data['discount_price'] = this.discountPrice;
    return data;
  }
}