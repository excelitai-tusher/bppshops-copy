import 'package:flutter/cupertino.dart';

class CustomShape extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();

    path.lineTo(0, height-120);
    path.quadraticBezierTo(width, height-90, width, height);
    path.lineTo(width, 0);
    path.close();
    return path;

    throw UnimplementedError();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}