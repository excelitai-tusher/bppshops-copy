import 'package:flutter/cupertino.dart';

class PrimaryPageController with ChangeNotifier{
  int currentIndex = 0;

  setPrimaryPage(int value){
    this.currentIndex=value;
    notifyListeners();
  }
}