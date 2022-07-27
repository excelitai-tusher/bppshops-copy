class PopularProduct_Model {
  List<MostPopularAll>? mostPopularAll;

  PopularProduct_Model({this.mostPopularAll});

  PopularProduct_Model.fromJson(Map<String, dynamic> json) {
    if (json['most_popular_all'] != null) {
      mostPopularAll = <MostPopularAll>[];
      json['most_popular_all'].forEach((v) {
        mostPopularAll!.add(new MostPopularAll.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mostPopularAll != null) {
      data['most_popular_all'] =
          this.mostPopularAll!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MostPopularAll {
  int? id;
  String? productName;
  String? productThambnail;
  String? sellingPrice;
  String? discountPrice;
  List<MultiImg>? multiImg;

  MostPopularAll(
      {this.id,
        this.productName,
        this.productThambnail,
        this.sellingPrice,
        this.discountPrice,
        this.multiImg});

  MostPopularAll.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    productThambnail = json['product_thambnail'];
    sellingPrice = json['selling_price'];
    discountPrice = json['discount_price'];
    if (json['multi_img'] != null) {
      multiImg = <MultiImg>[];
      json['multi_img'].forEach((v) {
        multiImg!.add(new MultiImg.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_name'] = this.productName;
    data['product_thambnail'] = this.productThambnail;
    data['selling_price'] = this.sellingPrice;
    data['discount_price'] = this.discountPrice;
    if (this.multiImg != null) {
      data['multi_img'] = this.multiImg!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MultiImg {
  int? id;
  String? productId;
  String? photoName;
  String? createdAt;
  Null? updatedAt;

  MultiImg(
      {this.id,
        this.productId,
        this.photoName,
        this.createdAt,
        this.updatedAt});

  MultiImg.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    photoName = json['photo_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['photo_name'] = this.photoName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
