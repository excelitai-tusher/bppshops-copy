import 'package:bpp_shop/view/grocery/controller/product_detail_data_controller.dart';
import 'package:bpp_shop/view_model/bpp/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import '../../constant/app_colors.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    scaleAnimation =
        CurvedAnimation(parent: controller!, curve: Curves.elasticInOut);

    controller!.addListener(() {
      setState(() {});
    });

    controller!.forward();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    final productDetailData = Provider.of<ProductDetailDataController>(context);
    return Material(
      color: Colors.transparent,
      child: ScaleTransition(
        scale: scaleAnimation!,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Color(0xffF7FFEF),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_outlined,
                size: 25,
                color: Colors.black,
              ),
            ),
            actions: [
              Card(
                elevation: 6,
                child: GestureDetector(
                  onTap: () {
                    cart.addItem(
                        productDetailData.productId!,
                        double.tryParse(productDetailData.productPrice!)!,
                        productDetailData.productName,
                        productDetailData.productImageUrl,
                        productDetailData.quantity);
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.add_shopping_cart_outlined,
                      color: Color(0xFF3DC73C),
                    ),
                  ),
                ),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: 400,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color: Color(0xffF7FFEF),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xffF7FFEF),
                            blurRadius: 10.0,
                            offset: Offset(10.0, 10.0),
                          ),
                        ]),
                    child: Image(
                      image: NetworkImage(
                          productDetailData.productImageUrl.toString()),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 10,
                        child: Text(
                          productDetailData.productName.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: titleFontColor,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                productDetailData.setAddQuantity();
                              },
                              child: Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                    color: Color(0xFF9FF348),
                                    borderRadius: BorderRadius.circular(6)),
                                child: Icon(
                                  Icons.add,
                                  // FontAwesomeIcons.minusSquare,
                                  size: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              productDetailData.quantity.toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                productDetailData.setMinusQuantity();
                              },
                              child: Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                    color: Color(0xFF9FF348),
                                    borderRadius: BorderRadius.circular(6)),
                                child: Icon(
                                  Icons.remove,
                                  // FontAwesomeIcons.minusSquare,
                                  size: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        productDetailData.unit.toString(),
                        style: TextStyle(
                          //fontWeight: FontWeight.bold,
                          color: titleFontColor,
                          fontSize: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Text(
                          "৳" +
                              double.tryParse(productDetailData.productPrice!)!
                                  .toStringAsFixed(1),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: titleFontColor,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: "*",
                            style: TextStyle(
                                color: Colors.orange,
                                fontSize: 18,
                                letterSpacing: 3),
                            children: <TextSpan>[
                              TextSpan(
                                text: "*",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.orange,
                                  letterSpacing: 3,
                                ),
                              ),
                              TextSpan(
                                text: "*",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.orange,
                                    letterSpacing: 3),
                              ),
                              TextSpan(
                                text: "*",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.orange,
                                    letterSpacing: 3),
                              ),
                              TextSpan(
                                text: "*",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                    letterSpacing: 3),
                              ),
                              TextSpan(
                                text: "4.0",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.orange,
                                ),
                              ),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child:productDetailData.discountPrice!="0.00"? Text(
                          "৳" +
                              double.tryParse(productDetailData.discountPrice!)!
                                  .toStringAsFixed(1),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontSize: 15,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ):Text(""),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 25,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                      color: Colors.green,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 6),
                      child: Text(
                        "Free Ship",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Details",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  Html(
                    data: productDetailData.productDetails,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Related Products",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Center(
                      child: SizedBox(
                        height: 40,
                        width: 250,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.lightGreen,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          onPressed: () {
                            cart.addItem(
                                productDetailData.productId!,
                                double.tryParse(
                                    productDetailData.productPrice!)!,
                                productDetailData.productName,
                                productDetailData.productImageUrl,
                                productDetailData.quantity);
                            Navigator.pop(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.shopping_cart_outlined,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "Add to Cart",
                                    style: TextStyle(
                                      color: Colors.white,
                                      //fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
