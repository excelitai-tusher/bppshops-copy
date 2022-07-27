// To parse this JSON data, do
//
//     final couponData = couponDataFromJson(jsonString);

import 'dart:convert';

List<CouponData> couponDataFromJson(String str) => List<CouponData>.from(json.decode(str).map((x) => CouponData.fromJson(x)));

String couponDataToJson(List<CouponData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CouponData {
  CouponData({
    this.id,
    this.couponName,
    this.couponDiscount,
    this.couponValidity,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  final int ?id;
  final String ?couponName;
  final String ?couponDiscount;
  final DateTime ?couponValidity;
  final String ?status;
  final DateTime? createdAt;
  final dynamic updatedAt;

  factory CouponData.fromJson(Map<String, dynamic> json) => CouponData(
    id: json["id"] == null ? null : json["id"],
    couponName: json["coupon_name"] == null ? null : json["coupon_name"],
    couponDiscount: json["coupon_discount"] == null ? null : json["coupon_discount"],
    couponValidity: json["coupon_validity"] == null ? null : DateTime.parse(json["coupon_validity"]),
    status: json["status"] == null ? null : json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "coupon_name": couponName == null ? null : couponName,
    "coupon_discount": couponDiscount == null ? null : couponDiscount,
    "coupon_validity": couponValidity == null ? null : "${couponValidity!.year.toString().padLeft(4, '0')}-${couponValidity!.month.toString().padLeft(2, '0')}-${couponValidity!.day.toString().padLeft(2, '0')}",
    "status": status == null ? null : status,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt,
  };
}
