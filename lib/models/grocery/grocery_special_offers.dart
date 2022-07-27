class GrocerySpecialOffers {
  List<GSpecialOffers>? specialOffers;

  GrocerySpecialOffers({this.specialOffers});

  GrocerySpecialOffers.fromJson(Map<String, dynamic> json) {
    if (json['special_offers'] != null) {
      specialOffers = <GSpecialOffers>[];
      json['special_offers'].forEach((v) {
        specialOffers!.add(new GSpecialOffers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.specialOffers != null) {
      data['special_offers'] =
          this.specialOffers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GSpecialOffers {
  String? id;
  String? productThambnail;
  String? productName;
  String? sellingPrice;
  String? discountPrice;
  String? unit;
  String? productDescp;
  GSpecialOffers(
      {this.id,
        this.productThambnail,
        this.productName,
        this.sellingPrice,
        this.discountPrice,
        this.unit,
        this.productDescp
      });

  GSpecialOffers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productThambnail = json['product_thambnail'];
    productName = json['product_name'];
    sellingPrice = json['selling_price'];
    discountPrice = json['discount_price'];
    unit = json['unit'];
    productDescp = json['product_descp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_thambnail'] = this.productThambnail;
    data['product_name'] = this.productName;
    data['selling_price'] = this.sellingPrice;
    data['discount_price'] = this.discountPrice;
    data['unit'] = this.unit;
    data['product_descp'] = this.productDescp;
    return data;
  }
}