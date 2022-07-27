import 'package:flutter/cupertino.dart';

class SubSubProductsModel with ChangeNotifier{
  String? productName;
  String? productImageUrl;
  String? productPrice;

  SubSubProductsModel({this.productName,this.productImageUrl,this.productPrice});

  static List<SubSubProductsModel> subSubProductData=[//
    SubSubProductsModel(
        productName: "Selwar kameez",
        productImageUrl: "assets/images/salwar_kameez.png",
        productPrice: "110"
    ),
    SubSubProductsModel(
        productName: "Sharee",
        productImageUrl: "assets/images/salwar_kameez.png",
        productPrice: "200"
    ),
    SubSubProductsModel(
        productName: "Lehenga",
        productImageUrl: "assets/images/salwar_kameez.png",
        productPrice: "300"
    ),
    SubSubProductsModel(
        productName: "Kaftan",
        productImageUrl: "assets/images/salwar_kameez.png",
        productPrice: "150"
    ),
    SubSubProductsModel(
        productName: "Kurtis",
        productImageUrl: "assets/images/salwar_kameez.png",
        productPrice: "199"
    ),
    SubSubProductsModel(
        productName: "Burqa",
        productImageUrl: "assets/images/salwar_kameez.png",
        productPrice: "150"
    ),
    SubSubProductsModel(
        productName: "Shoes",
        productImageUrl: "assets/images/salwar_kameez.png",
        productPrice: "100"
    ),
  ];


  List<SubSubProductsModel> get items{
    return [...subSubProductData];
  }


  Future<void> ascendingTitle() async {
    subSubProductData.sort((a,b) => a.productName!.compareTo(b.productName!));
    notifyListeners();
  }
  Future<void> descendingTitle() async {
    subSubProductData.sort((a,b) => b.productName!.compareTo(a.productName!));
    notifyListeners();
  }
  Future<void> priceLowToHigh() async {
    subSubProductData.sort((a,b) => a.productPrice!.compareTo(b.productPrice!));
    notifyListeners();
  }
  Future<void> priceHighToLow() async {
    subSubProductData.sort((a,b) => b.productPrice!.compareTo(a.productPrice!));
    notifyListeners();
  }


}