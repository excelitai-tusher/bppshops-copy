// To parse this JSON data, do
//
//     final brandModel = brandModelFromJson(jsonString);

import 'dart:convert';

BrandModel brandModelFromJson(String str) => BrandModel.fromJson(json.decode(str));

String brandModelToJson(BrandModel data) => json.encode(data.toJson());

class BrandModel {
    BrandModel({
        this.brands,
    });

    List<Brand>? brands;

    factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
        brands: List<Brand>.from(json["brands"].map((x) => Brand.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "brands": List<dynamic>.from(brands!.map((x) => x.toJson())),
    };
}

class Brand {
    Brand({
        this.id,
        this.brandNameCatsEye,
        this.brandImage,
    });

    int? id;
    String? brandNameCatsEye;
    String? brandImage;

    factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        brandNameCatsEye: json["brand_name_cats_eye"],
        brandImage: json["brand_image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "brand_name_cats_eye": brandNameCatsEye,
        "brand_image": brandImage,
    };
}



