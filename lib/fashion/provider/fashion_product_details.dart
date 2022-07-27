import 'package:flutter/material.dart';

class FashionDetailsController extends ChangeNotifier{
  int ColorSelection = 0;
  int SizeSelection = 0;
  String? ImageURL;
  String? ProductPrice;
  String? ProductName;

  final List<String?> FashionProdError = [];

  void addError ({String? error}) {
    if(FashionProdError.contains(error)){
      FashionProdError.remove(error);
      notifyListeners();
    }
  }

  void removeError ({String? error}) {
    if(FashionProdError.contains(error)){
      FashionProdError.remove(error);
      notifyListeners();
    }
  }

  void ColorSelected (int value){
    ColorSelection = value;
    notifyListeners();
  }

  void SizeSelected (int value){
    SizeSelection = value;
    notifyListeners();
  }

  void setProductData(
      String ImageURL,
      String ProductPrice,
      String ProductName,
  ){
    this.ImageURL = ImageURL;
    this.ProductPrice = ProductPrice;
    this.ProductName = ProductName;
  }

}