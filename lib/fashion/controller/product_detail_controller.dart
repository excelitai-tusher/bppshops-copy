import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class ProductDetailController with ChangeNotifier {
  int colorSelection =0;
  int sizeSelection =0;

  String? productImageUrl;
  String? productName;
  String? productPrice;




  final List<String?> prodErrors = [];

  void addError({String? error}) {
    if (!prodErrors.contains(error)) {
      //HapticFeedback.lightImpact();
      prodErrors.add(error);
      notifyListeners();
    }
  }
  void removeError({String? error}){
    if (prodErrors.contains(error))
      prodErrors.remove(error);
    notifyListeners();
  }





  void colorSelected(int value) {
    colorSelection = value;
    notifyListeners();
  }

  void sizeSelected(int value) {
    sizeSelection = value;
    notifyListeners();
  }

  void setProductData(
    String productImageUrl,
    String productName,
    String productPrice,
  ){
    this.productImageUrl=productImageUrl;
    this.productName=productName;
    this.productPrice= productPrice;
    notifyListeners();
  }
}
