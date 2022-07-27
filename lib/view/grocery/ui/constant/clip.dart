import 'package:flutter/material.dart';
class SimpleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    // path start with (0.0, 0.0) point
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height -60);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
