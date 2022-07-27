class MostPopular {
  List<MostPopularAll>? mostPopularAll;

  MostPopular({this.mostPopularAll});

  MostPopular.fromJson(Map<String, dynamic> json){
    if (json['most_popular_all'] != null) {
      mostPopularAll = <MostPopularAll>[];
      json['most_popular_all'].forEach((v) {
        mostPopularAll!.add(new MostPopularAll.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mostPopularAll != null) {
      data['most_popular_all'] =
          this.mostPopularAll!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MostPopularAll{
  int? id;
  String? productThambnail;
  String? productName;
  String? sellingPrice;
  String? discountPrice;
  String? unit;
  String? productQty;
  String? productDescp;
  String? productSize;
  String? productColor;
  String? videoLink;

  MostPopularAll(
      {this.id,
        this.productThambnail,
        this.productName,
        this.sellingPrice,
        this.discountPrice,
        this.unit,
        this.productQty,
        this.productDescp,
        this.productSize,
        this.productColor,
        this.videoLink});

  MostPopularAll.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productThambnail = json['product_thambnail'];
    productName = json['product_name'];
    sellingPrice = json['selling_price'];
    discountPrice = json['discount_price'];
    unit = json['unit'];
    productQty = json['product_qty'];
    productDescp = json['product_descp'];
    productSize = json['product_size'];
    productColor = json['product_color'];
    videoLink = json['video_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_thambnail'] = this.productThambnail;
    data['product_name'] = this.productName;
    data['selling_price'] = this.sellingPrice;
    data['discount_price'] = this.discountPrice;
    data['unit'] = this.unit;
    data['product_qty'] = this.productQty;
    data['product_descp'] = this.productDescp;
    data['product_size'] = this.productSize;
    data['product_color'] = this.productColor;
    data['video_link'] = this.videoLink;
    return data;
  }
}