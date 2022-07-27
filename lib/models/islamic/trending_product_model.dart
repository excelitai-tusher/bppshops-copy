class TrendingProduct {
  List<TrendingProducts>? trendingProducts;

  TrendingProduct({this.trendingProducts});

  TrendingProduct.fromJson(Map<String, dynamic> json) {
    if (json['trendingProducts'] != null) {
      trendingProducts = <TrendingProducts>[];
      json['trendingProducts'].forEach((v) {
        trendingProducts!.add(new TrendingProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.trendingProducts != null) {
      data['trendingProducts'] =
          this.trendingProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TrendingProducts {
  String? id;
  String? productThambnail;
  String? productName;
  String? discountPrice;
  String? sellingPrice;

  TrendingProducts(
      {this.id,
        this.productThambnail,
        this.productName,
        this.discountPrice,
        this.sellingPrice});

  TrendingProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productThambnail = json['product_thambnail'];
    productName = json['product_name'];
    discountPrice = json['discount_price'];
    sellingPrice = json['selling_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_thambnail'] = this.productThambnail;
    data['product_name'] = this.productName;
    data['discount_price'] = this.discountPrice;
    data['selling_price'] = this.sellingPrice;
    return data;
  }
}