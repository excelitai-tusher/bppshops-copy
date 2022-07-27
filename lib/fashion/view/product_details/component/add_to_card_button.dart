
import 'package:bpp_shop/fashion/controller/product_detail_controller.dart';
import 'package:bpp_shop/fashion/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AddToCardButton extends StatelessWidget {
  const AddToCardButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prodDetails = Provider.of<ProductDetailController>(context);
    final cartControll = Provider.of<CartModel>(context);
    return Column(
      children: [
        Container(
          height: 40,
          child: Column(
            children: List.generate(
                prodDetails.prodErrors.length,
                (index) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: 15,
                        ),
                        Text(
                          prodDetails.prodErrors[index].toString(),
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ],
                    )),
          ),
        ),
        SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width * .5,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xffFF6000), //background color of button
              side: BorderSide(
                width: 1,
                color: Colors.white,
              ), //border width and color
              elevation: 3, //elevation of button
              shape: RoundedRectangleBorder(
                  //to set border radius to button
                  borderRadius: BorderRadius.circular(15)),
              //padding: EdgeInsets.all(20) //content padding inside button
            ),
            onPressed: (){
              // if (prodDetails.sizeSelection == 0){
              //   // Clipboard.setData(ClipboardData());
              //   // HapticFeedback.heavyImpact();
              //   prodDetails.addError(error: 'Please Select Size');
              // }
              //
              // if (prodDetails.colorSelection == 0){
              //
              //   prodDetails.addError(error: 'Please Select Color');
              //
              // }
              //
              // if (prodDetails.colorSelection > 0){
              //
              //   prodDetails.removeError(error: 'Please Select Color');
              //
              // }
              //
              // if (prodDetails.sizeSelection > 0){
              //   prodDetails.removeError(error: 'Please Select Size');
              // }
              // if(prodDetails.prodErrors.isNotEmpty){
              //   HapticFeedback.lightImpact();
              // }
              if(prodDetails.colorSelection > 0 &&
                  prodDetails.sizeSelection > 0) {
                cartControll.addCartList(
                    prodDetails.productImageUrl.toString(),
                    prodDetails.productName.toString(),
                    prodDetails.productPrice.toString());
              }
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.shopping_cart_rounded,
                  color: Colors.white,
                ),
                Text(
                  "Add To Cart",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
