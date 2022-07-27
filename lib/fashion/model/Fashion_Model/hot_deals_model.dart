import 'dart:convert';

HotDealModel hotDealModelFromJson(String str) => HotDealModel.fromJson(json.decode(str));

String hotDealModelToJson(HotDealModel data) => json.encode(data.toJson());

class HotDealModel {
  HotDealModel({this.hotDeals});
  List<HotDeal>? hotDeals;

  factory HotDealModel.fromJson(Map<String, dynamic> json) => HotDealModel(
        hotDeals: List<HotDeal>.from(
            json["hot_deals"].map((x) => HotDeal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "hot_deals": List<dynamic>.from(hotDeals!.map((x) => x.toJson())),
      };
}

class HotDeal {
  HotDeal({
    this.productThambnail,
    this.sellingPrice,
    this.discountPrice,
    this.productName,
    this.startDate,
    this.endDate,
    this.multiImg,
  });

  String? productThambnail;
  String? sellingPrice;
  String? discountPrice;
  String? productName;
  DateTime? startDate;
  DateTime? endDate;
  List<dynamic>? multiImg;

  factory HotDeal.fromJson(Map<String, dynamic> json) => HotDeal(
        productThambnail: json["product_thambnail"],
        sellingPrice: json["selling_price"].toString(),
        discountPrice: json["discount_price"].toString(),
        productName: json["product_name"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        multiImg: List<dynamic>.from(json["multi_img"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "product_thambnail": productThambnail,
        "selling_price": sellingPrice,
        "discount_price": discountPrice,
        "product_name": productName,
        "start_date": startDate == null
            ? null
            : "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date": endDate == null
            ? null
            : "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "multi_img": List<dynamic>.from(multiImg!.map((x) => x)),
      };
}
