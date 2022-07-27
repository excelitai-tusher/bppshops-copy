class SubSubCategory {
  List<ProductUnderSubCategory>? productUnderSubCategory;
  List<Getsubsubcategory>? getsubsubcategory;

  SubSubCategory({this.productUnderSubCategory, this.getsubsubcategory});

  SubSubCategory.fromJson(Map<String, dynamic> json) {
    if (json['productUnderSubCategory'] != null) {
      productUnderSubCategory = <ProductUnderSubCategory>[];
      json['productUnderSubCategory'].forEach((v) {
        productUnderSubCategory!.add(new ProductUnderSubCategory.fromJson(v));
      });
    }
    if (json['getsubsubcategory'] != null) {
      getsubsubcategory = <Getsubsubcategory>[];
      json['getsubsubcategory'].forEach((v) {
        getsubsubcategory!.add(new Getsubsubcategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productUnderSubCategory != null) {
      data['productUnderSubCategory'] =
          this.productUnderSubCategory!.map((v) => v.toJson()).toList();
    }
    if (this.getsubsubcategory != null) {
      data['getsubsubcategory'] =
          this.getsubsubcategory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductUnderSubCategory {
  int? id;
  String? productThambnail;
  String? productName;
  String? purchaseQty;
  String? sellingPrice;
  String? discountPrice;
  String? videoLink;
  String? productDescp;
  String? unit;
  String? productColor;
  String? productSize;

  ProductUnderSubCategory(
      {this.id,
        this.productThambnail,
        this.productName,
        this.purchaseQty,
        this.sellingPrice,
        this.discountPrice,
        this.videoLink,
        this.productDescp,
        this.unit,
        this.productColor,
        this.productSize});

  ProductUnderSubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productThambnail = json['product_thambnail'];
    productName = json['product_name'];
    purchaseQty = json['purchase_qty'];
    sellingPrice = json['selling_price'];
    discountPrice = json['discount_price'];
    videoLink = json['video_link'];
    productDescp = json['product_descp'];
    unit = json['unit'];
    productColor = json['product_color'];
    productSize = json['product_size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_thambnail'] = this.productThambnail;
    data['product_name'] = this.productName;
    data['purchase_qty'] = this.purchaseQty;
    data['selling_price'] = this.sellingPrice;
    data['discount_price'] = this.discountPrice;
    data['video_link'] = this.videoLink;
    data['product_descp'] = this.productDescp;
    data['unit'] = this.unit;
    data['product_color'] = this.productColor;
    data['product_size'] = this.productSize;
    return data;
  }
}

class Getsubsubcategory {
  int? id;
  String? subsubcategoryName;
  String? subsubcategoryImage;

  Getsubsubcategory(
      {this.id, this.subsubcategoryName, this.subsubcategoryImage});

  Getsubsubcategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subsubcategoryName = json['subsubcategory_name'];
    subsubcategoryImage = json['subsubcategory_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subsubcategory_name'] = this.subsubcategoryName;
    data['subsubcategory_image'] = this.subsubcategoryImage;
    return data;
  }
}
