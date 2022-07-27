
import 'package:bpp_shop/fashion/controller/product_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ColorButton extends StatelessWidget {
  ColorButton({
    Key? key,
    this.buttonHeight,
    this.buttonWidth,
    this.icon,
    this.color,
  }) : super(key: key);

  double? buttonHeight;
  double? buttonWidth;
  IconData? icon;
  Color? color;

  @override
  Widget build(BuildContext context) {
    final selected = Provider.of<ProductDetailController>(context);
    return GestureDetector(
      onTap: () {
        selected.colorSelected(2);
      },
      child: Container(
        height: buttonHeight,
        width: buttonWidth,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,//Colors.deepPurpleAccent,
          border: Border.all(
            color: selected.colorSelection == 2 ? Colors.amber : Colors.white,
            width: 2,
          ),
        ),
        child: Icon(
          Icons.check,
          color: Colors.white,
          size: 15,
        ),
      ),
    );
  }
}
