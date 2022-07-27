
import 'package:bpp_shop/fashion/controller/product_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SizeButton extends StatelessWidget {
  SizeButton({
    Key? key,
    this.buttonHeight,
    this.buttonWidth,
    this.title,
    this.size
  }) : super(key: key);

  double? buttonWidth;
  double? buttonHeight;
  String? title;
  int? size;
  @override
  Widget build(BuildContext context) {

     final sizeSelect = Provider.of<ProductDetailController>(context);

    return GestureDetector(
      onTap: (){
        sizeSelect.sizeSelected(size!);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4),
        height: buttonHeight,
        width: buttonWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: sizeSelect.sizeSelection == size ? Colors.red : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Text(title!, style: TextStyle(color: sizeSelect.sizeSelection == size ? Colors.white : Colors.black),),
        ),
      ),
    );
  }
}
