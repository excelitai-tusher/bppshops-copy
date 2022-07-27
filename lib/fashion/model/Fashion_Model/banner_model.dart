// To parse this JSON data, do
//
// final bannerModel = bannerModelFromJson(jsonString);

import 'dart:convert';// convert

BannerModel bannerModelFromJson(String str) => BannerModel.fromJson(json.decode(str));

String bannerModelToJson(BannerModel data) => json.encode(data.toJson());

class BannerModel {

    BannerModel({
        this.banner,
    });

    List<Banners>? banner;
    factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        banner: List<Banners>.from(json["banner"].map((x) => Banners.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "banner": List<dynamic>.from(banner!.map((x) => x.toJson())),
    };
}

class Banners {
    Banners({
        this.bennarImg,
    });
    String ?bennarImg;

    factory Banners.fromJson(Map<String, dynamic> json) => Banners(
        bennarImg: json["bennar_img"],
    );

    Map<String, dynamic> toJson() => {
        "bennar_img": bennarImg,
    };
}
