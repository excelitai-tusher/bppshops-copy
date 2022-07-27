import 'package:flutter/material.dart';

class Helper {
  static double gatScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double gatScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static String getAssetName({String? fileName, String? type}) {
    //print("assets/$fileName/$type");
    return "assets/$fileName/$type";
  }
  static TextTheme getTheme(BuildContext context) {
    return Theme.of(context).textTheme;
  }
//static getScreenHeight(BuildContext context) {}
}