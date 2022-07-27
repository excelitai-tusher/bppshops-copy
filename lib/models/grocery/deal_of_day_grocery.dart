class GroceryDealOfDay {
  List<DealOfDay>? dealOfDay;

  GroceryDealOfDay({this.dealOfDay});

  GroceryDealOfDay.fromJson(Map<String, dynamic> json) {
    if (json['deal of day'] != null) {
      dealOfDay = <DealOfDay>[];
      json['deal of day'].forEach((v) {
        dealOfDay!.add(new DealOfDay.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dealOfDay != null) {
      data['deal of day'] = this.dealOfDay!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DealOfDay {
  int? id;
  String? productThambnail;
  String? productName;
  String? sellingPrice;
  String? discountPrice;
  List<Null>? multiImg;

  DealOfDay(
      {this.id,
        this.productThambnail,
        this.productName,
        this.sellingPrice,
        this.discountPrice,
        this.multiImg});

  DealOfDay.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productThambnail = json['product_thambnail'];
    productName = json['product_name'];
    sellingPrice = json['selling_price'];
    discountPrice = json['discount_price'];
    // if (json['multi_img'] != null) {
    //   multiImg = <Null>[];
    //   json['multi_img'].forEach((v) {
    //     multiImg!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_thambnail'] = this.productThambnail;
    data['product_name'] = this.productName;
    data['selling_price'] = this.sellingPrice;
    data['discount_price'] = this.discountPrice;
    // if (this.multiImg != null) {
    //   data['multi_img'] = this.multiImg!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}