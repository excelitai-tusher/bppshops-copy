class GroceryTopSellingProduct {
  List<GroceryTopSelling>? popularProduct;

  GroceryTopSellingProduct({this.popularProduct});

  GroceryTopSellingProduct.fromJson(Map<String, dynamic> json) {
    if (json['Popular_product'] != null) {
      popularProduct = <GroceryTopSelling>[];
      json['Popular_product'].forEach((v) {
        popularProduct!.add(new GroceryTopSelling.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.popularProduct != null) {
      data['Popular_product'] =
          this.popularProduct!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GroceryTopSelling {
  String? productId;
  String? total;
  String? productName;
  String? productThambnail;
  String? sellingPrice;
  String? discountPrice;

  GroceryTopSelling(
      {this.productId,
        this.total,
        this.productName,
        this.productThambnail,
        this.sellingPrice,
        this.discountPrice});

  GroceryTopSelling.fromJson(Map<String, dynamic> json) {
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