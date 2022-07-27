class GroceryTrendingProduct {

  List<GroceryTrendProducts>? trendingProduct;

  GroceryTrendingProduct({this.trendingProduct});

  GroceryTrendingProduct.fromJson(Map<String, dynamic> json) {
    if (json['trending_product'] != null) {
      trendingProduct = <GroceryTrendProducts>[];
      json['trending_product'].forEach((v) {
        trendingProduct!.add(new GroceryTrendProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.trendingProduct != null) {
      data['trending_product'] =
          this.trendingProduct!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GroceryTrendProducts {
  String? productId;
  String? total;
  String? productName;
  String? productThambnail;
  String? sellingPrice;
  String? discountPrice;

  GroceryTrendProducts(
      {this.productId,
        this.total,
        this.productName,
        this.productThambnail,
        this.sellingPrice,
        this.discountPrice});

  GroceryTrendProducts.fromJson(Map<String, dynamic> json) {
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


