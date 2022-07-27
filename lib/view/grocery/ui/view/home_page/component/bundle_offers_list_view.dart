import 'package:bpp_shop/service/grocery/http_daily_best_sell.dart';
import 'package:bpp_shop/view/grocery/controller/product_detail_data_controller.dart';
import 'package:bpp_shop/view/grocery/ui/constant/clip.dart';
import 'package:bpp_shop/view_model/bpp/cart_provider.dart';

import 'package:bpp_shop/models/grocery/grocery_daily_best_sell.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'dart:math' as math;
import '../../../constant/app_colors.dart';
import '../../product_details/product details.dart';
import 'home_page_titles.dart';

class BundleOffersListView extends StatelessWidget {
  const BundleOffersListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    final productDetailData = Provider.of<ProductDetailDataController>(context);
    // final homeProvider = Provider.of<GHomeViewModel>(context);
    return FutureBuilder(
        future: getGDailyBestSell(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<GDailyBestSales> getdata =
                snapshot.data ?? <GDailyBestSales>[];
            return getdata.length > 0
                ? Column(
                    children: [
                      CustomHomePageTitles(
                        leadingTitle: "Bundle Offers",
                        trailingTitle: "See All",
                      ),
                      SizedBox(
                        height: 220,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.separated(
                          itemCount: getdata.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, index) {
                            // final  get=homeProvider.gdailyBestSelList![index];
                            final get = getdata[index];
                            return Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: GestureDetector(
                                onTap: () {
                                  productDetailData.setProductDetailData(
                                    productName: get.productName,
                                    //item.productName,
                                    productImageUrl:
                                        "https://bppshops.com/${get.productThambnail}",
                                    //item.productImageUrl,
                                    productPrice: get.sellingPrice,
                                    productDetails: get.productDescp,
                                    productId: get.productId,
                                    discountPrice: get.discountPrice,
                                    unit: get.total,
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
                                          offset: Offset(0,
                                              1), // changes position of shadow
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
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(
                                                  color: tertiaryColor1,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  image: DecorationImage(
                                                    image: get.productThambnail !=
                                                            null
                                                        ? NetworkImage(
                                                            "https://bppshops.com/${get.productThambnail}")
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
                                                        clipper:
                                                            SimpleClipper(),
                                                        child: Container(
                                                          width: 70.h,
                                                          height: 45.h,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            16)),
                                                            color: Color(
                                                                0xFF9FF348),
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        top: 2,
                                                        child: Transform.rotate(
                                                            angle: -math.pi / 4,
                                                            child: Text('20%',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16,
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
                                                            get.productId!,
                                                            double.tryParse(get
                                                                .sellingPrice!)!,
                                                            get.productName,
                                                            "https://bppshops.com/${get.productThambnail}",
                                                            1);
                                                      },
                                                      child: Container(
                                                        height: 20,
                                                        width: 20,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.green,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
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
                                                    "${get.productName}",
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
                                                    "${get.sellingPrice}",
                                                    // item.productPrice.toString(),
                                                    style: TextStyle(
                                                      //fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: 0,
                            );
                          },
                          //  itemCount:homeProvider.gdailyBestSelList!.length,
                        ),
                      ),
                    ],
                  )
                : Container();
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Shimmer(
                    duration: Duration(seconds: 2), //Default value
                    interval: Duration(
                        seconds: 1), //Default value: Duration(seconds: 0)
                    color: Colors.black, //Colors.grey.shade700, //Default value
                    colorOpacity: 0, //Default value
                    enabled: true, //Default value
                    direction: ShimmerDirection.fromLTRB(),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      height: 30,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Shimmer(
                            duration: Duration(seconds: 2), //Default value
                            interval: Duration(
                                seconds:
                                    1), //Default value: Duration(seconds: 0)
                            color: Colors
                                .black, //Colors.grey.shade700, //Default value
                            colorOpacity: 0, //Default value
                            enabled: true, //Default value
                            direction: ShimmerDirection.fromLTRB(),
                            child: Container(
                              height: 120,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }
}
