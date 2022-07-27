import 'package:flutter/cupertino.dart';

class ProductDetailDataController with ChangeNotifier {
  String? productName;
  int quantity=1;
  String? unit;
  String? productPrice;
  String? discountPrice;
  String? productImageUrl;
  String ? productDetails;
  String?productId;
  void setProductDetailData({
    String? productName,
    String? unit,
    String? productPrice,
    String? discountPrice,
    String? productImageUrl,
    String ? productDetails,
    String?productId,
  }) {
    this.productName=productName;
    this.unit=unit;
    this.productPrice=productPrice;
   this.discountPrice=discountPrice;
    this.productImageUrl=productImageUrl;
    this.productDetails=productDetails;
    this.productId=productId;
    notifyListeners();
  }

  void setAddQuantity(){
    quantity++;
    notifyListeners();
  }
  void setMinusQuantity(){
    if(quantity>1) {
      quantity--;
    }
    notifyListeners();
  }
}
