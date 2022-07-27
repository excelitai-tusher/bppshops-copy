class DailyBestSell {
  List<DailyBestSales>? dailyBestSales;

  DailyBestSell({this.dailyBestSales});

  DailyBestSell.fromJson(Map<String, dynamic> json) {
    if (json['dailyBestSales'] != null) {
      dailyBestSales = <DailyBestSales>[];
      json['dailyBestSales'].forEach((v) {
        dailyBestSales!.add(new DailyBestSales.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dailyBestSales != null) {
      data['dailyBestSales'] =
          this.dailyBestSales!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DailyBestSales {
  String? productId;
  String? total;
  String? productDescp;
  String? productSize;
  String? productColor;
  String? productThambnail;
  String? productName;
  String? productSlugName;
  String? sellingPrice;
  String? unit;
  String? discountPrice;

  DailyBestSales(
      {this.productId,
        this.total,
        this.productDescp,
        this.productSize,
        this.productColor,
        this.productThambnail,
        this.productName,
        this.productSlugName,
        this.sellingPrice,
        this.unit,
        this.discountPrice});

  DailyBestSales.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    total = json['total'];
    productDescp = json['product_descp'];
    productSize = json['product_size'];
    productColor = json['product_color'];
    productThambnail = json['product_thambnail'];
    productName = json['product_name'];
    productSlugName = json['product_slug_name'];
    sellingPrice = json['selling_price'];
    unit = json['unit'];
    discountPrice = json['discount_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['total'] = this.total;
    data['product_descp'] = this.productDescp;
    data['product_size'] = this.productSize;
    data['product_color'] = this.productColor;
    data['product_thambnail'] = this.productThambnail;
    data['product_name'] = this.productName;
    data['product_slug_name'] = this.productSlugName;
    data['selling_price'] = this.sellingPrice;
    data['unit'] = this.unit;
    data['discount_price'] = this.discountPrice;
    return data;
  }
}