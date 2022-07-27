import 'package:bpp_shop/view/bpp/appBar/appBar2.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/BottomAppBar2.dart';
import 'package:bpp_shop/view/bpp/drawer/bpp_drawer.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/floatingButton.dart';
import 'package:bpp_shop/view/grocery/controller/product_detail_data_controller.dart';
import 'package:bpp_shop/view/grocery/ui/constant/clip.dart';
import 'package:bpp_shop/view_model/bpp/cart_provider.dart';

import 'package:bpp_shop/models/grocery/grocery_special_offers.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
import '../../../constant/app_colors.dart';
import '../../product_details/product details.dart';

GlobalKey<ScaffoldState> _scafoldKey = GlobalKey();

class SpecialOfferListView extends StatelessWidget {
  String? nameFromFacebook;
  int? routeKey;
  SpecialOfferListView({Key? key, this.gSpecialOffersList}) : super(key: key);

  List<GSpecialOffers>? gSpecialOffersList;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);

    final productDetailData = Provider.of<ProductDetailDataController>(context);

    return Scaffold(
      key: _scafoldKey,
      appBar: bppAppBar2(context, _scafoldKey, nameFromFacebook, routeKey),
      drawer: BPPMainPageDrawer(),
      body: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Special Offers",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 4,
                  crossAxisSpacing: 6),
              itemCount: gSpecialOffersList!.length,
              itemBuilder: (BuildContext context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      productDetailData.setProductDetailData(
                        productName: gSpecialOffersList![index].productName,
                        //item.productName,
                        productImageUrl:
                            "https://bppshops.com/${gSpecialOffersList![index].productThambnail}",
                        //item.productImageUrl,
                        productPrice: gSpecialOffersList![index].sellingPrice,
                        productDetails: gSpecialOffersList![index].productDescp,
                        productId: gSpecialOffersList![index].id,
                        discountPrice: gSpecialOffersList![index].discountPrice,
                        unit: gSpecialOffersList![index].unit,
                        //item.productPrice,
                      );

                      ///way:1
                      showDialog(
                        context: context,
                        builder: (context) => ProductDetails(),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Container(
                        height: 220,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset:
                                  Offset(0, 1), // changes position of shadow
                            ),
                          ],
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: tertiaryColor1,
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: gSpecialOffersList![index]
                                                    .productThambnail !=
                                                null
                                            ? NetworkImage(
                                                "https://bppshops.com/${gSpecialOffersList![index].productThambnail}")
                                            : NetworkImage(
                                                'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg'),
                                        fit: BoxFit.contain,
                                      )),
                                  child: Stack(
                                    children: [
                                      Stack(
                                        children: [
                                          ClipPath(
                                            clipper: SimpleClipper(),
                                            child: Container(
                                              width: 70,
                                              height: 45,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(16)),
                                                color: Color(0xFF9FF348),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 2,
                                            child: Transform.rotate(
                                                angle: -math.pi / 4,
                                                child: Text('20%',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.white))),
                                          )
                                        ],
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: GestureDetector(
                                          onTap: () {
                                            cart.addItem(
                                                gSpecialOffersList![index].id!,
                                                double.tryParse(
                                                    gSpecialOffersList![index]
                                                        .sellingPrice!)!,
                                                gSpecialOffersList![index]
                                                    .productName,
                                                "https://bppshops.com/${gSpecialOffersList![index].productThambnail}",
                                                1);
                                          },
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Icon(
                                              Icons.add_shopping_cart_outlined,
                                              color: tertiaryColor1,
                                              size: 15,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        "${gSpecialOffersList![index].productName}",
                                        //    item.productName.toString(),
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: titleFontColor,
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        "Product ingredient",
                                        // item.runtimeType.toString(),
                                        style: TextStyle(
                                          //fontSize: 20,
                                          color: tertiaryColor2,
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        "${gSpecialOffersList![index].sellingPrice}",
                                        // item.productPrice.toString(),
                                        style: TextStyle(
                                          //fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: primaryColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            )),
        floatingActionButton: floatingButton(context, Color(0xFF3DC73C)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: bottomAppBar(context, Color(0xFF3DC73C)),
      ),
    );
  }
}
