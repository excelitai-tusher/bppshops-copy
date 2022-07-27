import 'package:bpp_shop/component/badge.dart';
import 'package:bpp_shop/view/bpp/cart/cart_screen.dart';
import 'package:bpp_shop/view_model/bpp/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Consumer<Cart> floatingButton(BuildContext context,Color color) {

  return Consumer<Cart>(
    builder: (_, cart, ch) => Badge(
      value: cart.itemCount.toString(),
      child: ch,
      color: color,
    ),
    child: FloatingActionButton(
      backgroundColor: color,
      onPressed: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => CartScreen()));
      },
      child: Icon(
        Icons.shopping_bag_sharp,
        color: Colors.white,
      ),
    ),
  );
}