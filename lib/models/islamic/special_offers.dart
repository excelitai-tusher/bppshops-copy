class SpecialOffer {
  List<SpecialOffers>? specialOffers;

  SpecialOffer({this.specialOffers});

  SpecialOffer.fromJson(Map<String, dynamic> json) {
    if (json['special_offers'] != null) {
      specialOffers = <SpecialOffers>[];
      json['special_offers'].forEach((v) {
        specialOffers!.add(new SpecialOffers.fromJson(v));
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

class SpecialOffers {
  int? id;
  String? productThambnail;
  String? productName;
  String? productQty;
  String? sellingPrice;
  String? discountPrice;
  String? status;
  String? purchaseQty;
 String? productSize;
  String? productColor;
  String? productDescp;
  String? videoLink;
  String? unit;
  SpecialOffers(
      {this.id,
        this.productThambnail,
        this.productName,
        this.productQty,
        this.sellingPrice,
        this.discountPrice,
        this.status,
        this.purchaseQty,
        this.productSize,
        this.productColor,
        this.productDescp,
        this.videoLink,
        this.unit
      });

  SpecialOffers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productThambnail = json['product_thambnail'];
    productName = json['product_name'];
    productQty = json['product_qty'];
    sellingPrice = json['selling_price'];
    discountPrice = json['discount_price'];
    status = json['status'];
    purchaseQty = json['purchase_qty'];
    productSize = json['product_size'];
    productColor = json['product_color'];
    productDescp = json['product_descp'];
    videoLink = json['video_link'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_thambnail'] = this.productThambnail;
    data['product_name'] = this.productName;
    data['product_qty'] = this.productQty;
    data['selling_price'] = this.sellingPrice;
    data['discount_price'] = this.discountPrice;
    data['status'] = this.status;
    data['purchase_qty'] = this.purchaseQty;
    data['product_size'] = this.productSize;
    data['product_color'] = this.productColor;
    data['product_descp'] = this.productDescp;
    data['video_link'] = this.videoLink;
    data['unit'] = this.unit;
    return data;
  }
}