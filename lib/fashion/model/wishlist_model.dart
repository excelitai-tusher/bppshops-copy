import 'package:flutter/cupertino.dart';

class WishlistModel with ChangeNotifier{
  String? imageUrl;
  String? productName;
  String? productPrice;

  WishlistModel({this.imageUrl,this.productName,this.productPrice});

  static List<WishlistModel> list=[
    // WishlistModel(
    //   imageUrl: "images/ecom/men/jeans/j1.jpg",
    //   productName: "Product 1",
    //   productPrice: "23523",
    // ),
    // WishlistModel(
    //   imageUrl: "images/ecom/men/jeans/j2.jpg",
    //   productName: "Product 2",
    //   productPrice: "23523",
    // ),
    // WishlistModel(
    //   imageUrl: "images/ecom/men/jeans/j3.jpg",
    //   productName: "Product 3",
    //   productPrice: "23523",
    // ),
    // WishlistModel(
    //   imageUrl: "images/ecom/men/jeans/j4.jpg",
    //   productName: "Product 4",
    //   productPrice: "23523",
    // ),
    // WishlistModel(
    //   imageUrl: "images/ecom/men/jeans/j5.jpg",
    //   productName: "Product 5",
    //   productPrice: "23523",
    // ),
  ];

  int get itemCount{
    return list.length;
  }

  void deleteList(int index){
    list.removeAt(index);
    notifyListeners();
  }

  void addWishList(String imgUrl, String prodName, String prodPrice){
    list.add(
      WishlistModel(
        imageUrl: imgUrl,
        productName: prodName,
        productPrice: prodPrice,
      ),
    );
    notifyListeners();
  }

  bool wishListDataCheck(bool data){
    if(list.isEmpty){
      data = true;
    }
    return data;
  }

}