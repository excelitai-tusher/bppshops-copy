import 'package:flutter/material.dart';

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0.0);//1st width
    path.lineTo(size.width* 0.20 , size.height);
   // path.lineTo(size.width * 0.1, size.height);
  //  path.lineTo(size.width, 0.0);
   // path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }
  // Path getClip(Size size) {
  //   Path path = Path();
  //
  //   path.lineTo(0, size.height);
  //   var curXPos = 0.0;
  //   var curYPos = size.height;
  //   var increment = size.width / 40;
  //   while (curXPos < size.width) {
  //     curXPos += increment;
  //     curYPos = curYPos == size.height ? size.height - 30 : size.height;
  //     path.lineTo(curXPos, curYPos);
  //   }
  //   path.lineTo(size.width, 0);
  //
  //   return path;
  // }
  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}