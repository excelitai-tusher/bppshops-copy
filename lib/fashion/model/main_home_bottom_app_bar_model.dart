
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class MainHomePageBottomAppBarModel {
  late final int index;
  late final IconData? icon;
  late final String? label;
  late final bool isBlank;
  MainHomePageBottomAppBarModel({required this.index, this.label,this.icon,this.isBlank=false});

  static List<MainHomePageBottomAppBarModel> list = [
    MainHomePageBottomAppBarModel(
      index: 0,
      label: 'Home',
      icon: FontAwesomeIcons.home,
    ),
    MainHomePageBottomAppBarModel(
      index: 1,
      label: 'Wishlist',
      icon: Icons.favorite_border_outlined,
    ),
    MainHomePageBottomAppBarModel(
      index: 2,
      label: 'Cart',
      icon: Icons.shopping_cart,
    ),
    MainHomePageBottomAppBarModel(
      index: 3,
      label: 'Account',
      icon: FontAwesomeIcons.user,
    ),
  ];
}
