///hot deals model class
///

class HotDealsModel {
  String? type1Image;
  String? type2Image;
  String? type3Image;
  String? productName;
  String? notification;
  String? offerEndText;
  String? timer;
  String? day;
  String? h;
  String? m;
  String? s;

  HotDealsModel({
    this.type1Image,
    this.type2Image,
    this.type3Image,
    this.productName,
    this.notification,
    this.offerEndText,
    this.timer,
    this.day,
    this.h,
    this.m,
    this.s,
  });
  static List<HotDealsModel> list=[
    HotDealsModel(
      type1Image: "images/bike.png",
      type2Image: "images/bike.png",
      type3Image: "images/bike.png",
      productName: "Hero Thriller 160R",
      notification: "Hurry Up!",
      offerEndText: "Offer ends in",
      timer: "23 : 17 : 30 : 00",
      day: "23",
      h: "17",
      m: '30',
      s: '00',
    ),
    HotDealsModel(
      type1Image: "images/food.png",
      type2Image: "images/food.png",
      type3Image: "images/food.png",
      productName: "Hero Thriller 160R",
      notification: "Hurry Up!",
      offerEndText: "Offer ends in",
      timer: "23 : 17 : 30 : 00",
      day: "23",
      h: "17",
      m: '30',
      s: '00',
    ),
    HotDealsModel(
      type1Image: "images/perfume1.png",
      type2Image: "images/perfume1.png",
      type3Image: "images/perfume1.png",
      productName: "perfume1 160R",
      notification: "Hurry Up!",
      offerEndText: "Offer ends in",
      timer: "23 : 17 : 30 : 00",
      day: "23",
      h: "17",
      m: '30',
      s: '00',
    ),
    HotDealsModel(
      type1Image: "images/bike.png",
      type2Image: "images/bike.png",
      type3Image: "images/bike.png",
      productName: "Hero Thriller 160R",
      notification: "Hurry Up!",
      offerEndText: "Offer ends in",
      timer: "23 : 17 : 30 : 00",
      day: "23",
      h: "17",
      m: '30',
      s: '00',
    ),
  ];
}
