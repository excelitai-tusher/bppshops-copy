
import 'package:flutter/material.dart';

class Apps with ChangeNotifier {
  final String id;
  Widget ?upcoming;
  final String title;
  final String image;
  final Widget? subApps;
  final String? icon;
  final String ?drawerIcon;

  Apps(
      {required this.id,
        this.upcoming,
        required this.title,
        required this.image,
        this.subApps,
        this.icon,
        this.drawerIcon
     });
}