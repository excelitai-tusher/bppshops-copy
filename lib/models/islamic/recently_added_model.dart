class RecentlyAddedProduct {
  List<RecentlyAdded>? recentlyAdded;

  RecentlyAddedProduct({this.recentlyAdded});

  RecentlyAddedProduct.fromJson(Map<String, dynamic> json) {
    if (json['recently_added'] != null) {
      recentlyAdded = <RecentlyAdded>[];
      json['recently_added'].forEach((v) {
        recentlyAdded!.add(new RecentlyAdded.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.recentlyAdded != null) {
      data['recently_added'] =
          this.recentlyAdded!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RecentlyAdded {
  int? id;
  String? ecomName;
  String? productThambnail;
  String? sellingPrice;
  String? productName;
  String? discountPrice;
  String? productQty;
  String? unitPrice;
  String? purchasePrice;
  String? metaDesc;
  String? productSize;
  String? productColor;
  String? productDescp;
  RecentlyAdded(
      {this.id,
        this.ecomName,
        this.productThambnail,
        this.sellingPrice,
        this.productName,
        this.discountPrice,
        this.productQty,
        this.unitPrice,
        this.purchasePrice,
      this.productSize,
      this.productColor,
      this.productDescp,
        this.metaDesc});

  RecentlyAdded.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ecomName = json['ecom_name'];
    productThambnail = json['product_thambnail'];
    sellingPrice = json['selling_price'];
    productName = json['product_name'];
    discountPrice = json['discount_price'];
    productQty = json['product_qty'];
    unitPrice = json['unit_price'];
    purchasePrice = json['purchase_price'];
    productSize = json['product_size'];
    productColor = json['product_color'];
    productDescp = json['product_descp'];
    metaDesc = json['meta_desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ecom_name'] = this.ecomName;
    data['product_thambnail'] = this.productThambnail;
    data['selling_price'] = this.sellingPrice;
    data['product_name'] = this.productName;
    data['discount_price'] = this.discountPrice;
    data['product_qty'] = this.productQty;
    data['unit_price'] = this.unitPrice;
    data['purchase_price'] = this.purchasePrice;
    return data;
  }
}