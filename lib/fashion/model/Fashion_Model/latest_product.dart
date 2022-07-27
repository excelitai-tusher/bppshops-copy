class LatestProduct_Model {
  List<LatestProducts>? latestProducts;

  LatestProduct_Model({this.latestProducts});

  LatestProduct_Model.fromJson(Map<String, dynamic> json) {
    if (json['latest_products'] != null) {
      latestProducts = <LatestProducts>[];
      json['latest_products'].forEach((v) {
        latestProducts!.add(new LatestProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.latestProducts != null) {
      data['latest_products'] =
          this.latestProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LatestProducts {
  int? id;
  String? productName;
  String? productThambnail;
  String? sellingPrice;
  String? discountPrice;
  String? unit;
  String? productDescp;
  String? productSize;
  String? productColor;

  LatestProducts(
      {this.id,
        this.productName,
        this.productThambnail,
        this.sellingPrice,
        this.discountPrice,
        this.unit,
        this.productDescp,
        this.productSize,
        this.productColor});

  LatestProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    productThambnail = json['product_thambnail'];
    sellingPrice = json['selling_price'];
    discountPrice = json['discount_price'];
    unit = json['unit'];
    productDescp = json['product_descp'];
    productSize = json['product_size'];
    productColor = json['product_color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_name'] = this.productName;
    data['product_thambnail'] = this.productThambnail;
    data['selling_price'] = this.sellingPrice;
    data['discount_price'] = this.discountPrice;
    data['unit'] = this.unit;
    data['product_descp'] = this.productDescp;
    data['product_size'] = this.productSize;
    data['product_color'] = this.productColor;
    return data;
  }
}