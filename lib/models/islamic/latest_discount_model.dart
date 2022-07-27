class LatestDiscountProduct {
  List<Latestdiscountproduct>? latestdiscountproduct;

  LatestDiscountProduct({this.latestdiscountproduct});

  LatestDiscountProduct.fromJson(Map<String, dynamic> json) {
    if (json['latestdiscountproduct'] != null) {
      latestdiscountproduct = <Latestdiscountproduct>[];
      json['latestdiscountproduct'].forEach((v) {
        latestdiscountproduct!.add(new Latestdiscountproduct.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.latestdiscountproduct != null) {
      data['latestdiscountproduct'] =
          this.latestdiscountproduct!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Latestdiscountproduct {
  int? id;
  String? categoryId;
  String? productThambnail;
  String? discountPrice;
  String? productName;
  String? sellingPrice;
  String? productSize;
  String? productColor;
  String? metaDesc;
  Category? category;

  Latestdiscountproduct(
      {this.id,
        this.categoryId,
        this.productThambnail,
        this.discountPrice,
        this.productName,
        this.sellingPrice,
        this.productSize,
        this.productColor,
        this.metaDesc,
        this.category});

  Latestdiscountproduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    productThambnail = json['product_thambnail'];
    discountPrice = json['discount_price'];
    productName = json['product_name'];
    sellingPrice = json['selling_price'];
    productSize = json['product_size'];
    productColor = json['product_color'];
    metaDesc = json['meta_desc'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['product_thambnail'] = this.productThambnail;
    data['discount_price'] = this.discountPrice;
    data['product_name'] = this.productName;
    data['selling_price'] = this.sellingPrice;
    data['product_size'] = this.productSize;
    data['product_color'] = this.productColor;
    data['meta_desc'] = this.metaDesc;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? categoryName;

  Category({this.id, this.categoryName});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_name'] = this.categoryName;
    return data;
  }
}