class GroceryDailyBestSell {
  List<GDailyBestSales>? dailyBestSales;

  GroceryDailyBestSell({this.dailyBestSales});

  GroceryDailyBestSell.fromJson(Map<String, dynamic> json) {
    if (json['dailyBestSales'] != null) {
      dailyBestSales = <GDailyBestSales>[];
      json['dailyBestSales'].forEach((v) {
        dailyBestSales!.add(new GDailyBestSales.fromJson(v));
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

class GDailyBestSales {
  String? productId;
  String? total;
  String? productName;
  String? productDescp;
  String? productThambnail;
  String? sellingPrice;
  String? discountPrice;

  GDailyBestSales(
      {this.productId,
        this.total,
        this.productName,
        this.productDescp,
        this.productThambnail,
        this.sellingPrice,
        this.discountPrice});

  GDailyBestSales.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    total = json['total'];
    productName = json['product_name'];
    productDescp = json['product_descp'];
    productThambnail = json['product_thambnail'];
    sellingPrice = json['selling_price'];
    discountPrice = json['discount_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['total'] = this.total;
    data['product_name'] = this.productName;
    data['product_descp'] = this.productDescp;
    data['product_thambnail'] = this.productThambnail;
    data['selling_price'] = this.sellingPrice;
    data['discount_price'] = this.discountPrice;
    return data;
  }
}