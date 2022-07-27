
import 'package:flutter/cupertino.dart';

class SecondaryPage with ChangeNotifier{
  int? secondaryPageNo;

  setSecondaryPage(int value){
    this.secondaryPageNo=value;
    notifyListeners();
  }
}