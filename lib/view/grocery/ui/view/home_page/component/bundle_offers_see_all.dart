import 'package:bpp_shop/service/grocery/http_daily_best_sell.dart';
import 'package:bpp_shop/view/bpp/appBar/appBar2.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/BottomAppBar2.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/floatingButton.dart';
import 'package:bpp_shop/view/bpp/drawer/bpp_drawer.dart';
import 'package:bpp_shop/view/grocery/controller/product_detail_data_controller.dart';
import 'package:bpp_shop/view/grocery/ui/constant/clip.dart';
import 'package:bpp_shop/view_model/bpp/cart_provider.dart';

import 'package:bpp_shop/models/grocery/grocery_daily_best_sell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

import '../../../constant/app_colors.dart';
import '../../product_details/product details.dart';

GlobalKey<ScaffoldState> _scafoldKey = GlobalKey();

class BundleOfferSeeAll extends StatelessWidget {
  String? nameFromFacebook;
  int? routeKey;
BundleOfferSeeAll({Key? key}) : super(key: key);

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
            "Bundle Offers",
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
        body: FutureBuilder(
            future: getGDailyBestSell(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<GDailyBestSales> get =
                    snapshot.data ?? <GDailyBestSales>[];
                return Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 3 / 4,
                          crossAxisSpacing: 6),
                      itemCount: get.length,
                      itemBuilder: (BuildContext context, index) {
                        //  BundleOffersModel item = BundleOffersModel.list[index];
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              productDetailData.setProductDetailData(
                                productName: get[index].productName,
                                //item.productName,
                                productImageUrl:
                                    "https://bppshops.com/${get[index].productThambnail}",
                                //item.productImageUrl,
                                productPrice: get[index].sellingPrice,
                                productDetails: get[index].productDescp,
                                productId: get[index].productId,
                                discountPrice: get[index].discountPrice,
                                unit: get[index].total,
                                //item.productPrice,
                              );

                              ///way:1
                              showDialog(
                                context: context,
                                builder: (context) => ProductDetails(),
                              );

                              ///way:1
                              ///way:2
                              // showGeneralDialog(
                              //   context: context,
                              //   pageBuilder: (context, animation1, animation2) {
                              //     return SizedBox();
                              //   },
                              //   transitionBuilder: (context, a1, a2, widget) {
                              //     return Transform.scale(
                              //       scale: a1.value,
                              //       child: ProductDetails(),
                              //     );
                              //   },
                              // );
                              ///way:2
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
                                      offset: Offset(
                                          0, 1), // changes position of shadow
                                    ),
                                  ],
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              color: tertiaryColor1,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              image: DecorationImage(
                                                image: get[index]
                                                            .productThambnail !=
                                                        null
                                                    ? NetworkImage(
                                                        "https://bppshops.com/${get[index].productThambnail}")
                                                    : NetworkImage(
                                                        'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg'),
                                                // AssetImage(item.productImageUrl.toString()),
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
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        16)),
                                                        color:
                                                            Color(0xFF9FF348),
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
                                                                color: Colors
                                                                    .white))),
                                                  )
                                                ],
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    cart.addItem(
                                                        get[index].productId!,
                                                        double.tryParse(get[
                                                                index]
                                                            .sellingPrice!)!,
                                                        get[index].productName,
                                                        "https://bppshops.com/${get[index].productThambnail}",
                                                        1);
                                                  },
                                                  child: Container(
                                                    height: 20,
                                                    width: 20,
                                                    decoration: BoxDecoration(
                                                      color: Colors.green,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: Icon(
                                                      Icons
                                                          .add_shopping_cart_outlined,
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                "${get[index].productName}",
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
                                                "${get[index].sellingPrice}",
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
                    ));
              } else {
                return Center(
                  child: SpinKitSpinningLines(
                    color: Color(0xFF9FF348),
                    size: 80.0,
                  ),
                );
              }
            }),
        floatingActionButton: floatingButton(context, Color(0xFF3DC73C)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: bottomAppBar(context, Color(0xFF3DC73C)),
      ),
    );
  }
}
