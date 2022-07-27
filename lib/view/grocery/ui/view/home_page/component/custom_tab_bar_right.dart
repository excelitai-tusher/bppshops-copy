import 'package:bpp_shop/models/grocery/top_selling_model.dart';
import 'package:bpp_shop/models/grocery/trending_product_model.dart';
import 'package:bpp_shop/service/grocery/http_recently_added.dart';
import 'package:bpp_shop/service/grocery/http_top_selling.dart';
import 'package:bpp_shop/service/grocery/http_tranding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import '../../../constant/app_colors.dart';

class CustomTabBarRight extends StatefulWidget {
  CustomTabBarRight({
    Key? key,
    this.tab1,
    this.tab2,
  }) : super(key: key);

  String? tab1;
  String? tab2;

  @override
  _CustomTabBarRightState createState() =>
      _CustomTabBarRightState(tab1: tab1!, tab2: tab2!);
}

class _CustomTabBarRightState extends State<CustomTabBarRight>
    with SingleTickerProviderStateMixin {
  _CustomTabBarRightState({
    this.tab1,
    this.tab2,
  });

  String? tab1;
  String? tab2;
  TabController? _controllerTab;

  @override
  void initState() {
    // TODO: implement initState
    _controllerTab = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controllerTab!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: tertiaryColor1,
      height: MediaQuery.of(context).size.height * .3,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 3,
                    child: TabBar(
                      labelColor: primaryColor,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: primaryColor,
                      controller: _controllerTab,
                      tabs: [
                        Tab(
                          //icon: Icon(Icons.directions_bike),
                          child: Text(
                            tab1!,
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        ),
                        Tab(
                          // icon: Icon(
                          //   Icons.directions_car,
                          // ),
                          child: Text(
                            tab2!,
                            style: TextStyle(fontSize: 13.sp),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // create widgets for each tab bar here
            Expanded(
              flex: 3,
              child: TabBarView(
                controller: _controllerTab,
                children: [
                  FutureBuilder(
                      future: getSellingProduct(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          List<GroceryTopSelling> getTop =
                              snapshot.data ?? <GroceryTopSelling>[];
                          return ListView.separated(
                            itemCount: getTop.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                width: 5.w,
                              );
                            },
                            separatorBuilder: (context, index) {
                              //GroceryTrendingProduct item = GroceryTrendingProduct.get[index];
                              return Container(
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height * .3,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * .3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: MediaQuery.of(context).size.height*.1,
                                      width: MediaQuery.of(context).size.width,
                                      child: getTop[index].productThambnail != null
                                          ? Image.network(
                                        'https://bppshops.com/${getTop[index].productThambnail}',
                                        fit: BoxFit.contain,
                                      )
                                          : Image.network(
                                          'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg'),

                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                          height: MediaQuery.of(context).size.height * .1,
                                          width: MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                            BorderRadius.circular(20),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex:2,
                                                  child: Text(
                                                    getTop[index].productName.toString(),
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 10.sp,
                                                      color: titleFontColor,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.star,
                                                        color:
                                                        Colors.orangeAccent,
                                                        size: 10.sp,
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        color:
                                                        Colors.orangeAccent,
                                                        size: 10.sp,
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        color:
                                                        Colors.orangeAccent,
                                                        size: 10.sp,
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        color:
                                                        Colors.orangeAccent,
                                                        size: 10.sp,
                                                      ),
                                                      Icon(
                                                        Icons.star_border_sharp,
                                                        color:
                                                        Colors.orangeAccent,
                                                        size: 10.sp,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    "৳ " +
                                                        getTop[index]
                                                            .sellingPrice
                                                            .toString(),
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 10.sp,
                                                      color: primaryColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                        else {
                          return Container();
                        }
                      }
                  ),
                  FutureBuilder(
                      future: getGTrendProduct(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          List<GroceryTrendProducts> getTR =
                              snapshot.data ?? <GroceryTrendProducts>[];
                          return ListView.separated(
                            itemCount: getTR.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                width: 5,
                              );
                            },
                            separatorBuilder: (context, index) {
                              //GroceryTrendingProduct item = GroceryTrendingProduct.get[index];
                              return Container(
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height * .1,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * .3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 60,
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width,
                                      child: getTR[index].productThambnail != null
                                          ? Image.network(
                                        'https://bppshops.com/${getTR[index].productThambnail}',
                                        fit: BoxFit.contain,
                                      )
                                          : Image.network(
                                          'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg'),

                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                          height: MediaQuery
                                              .of(context)
                                              .size
                                              .height * .1,
                                          width:
                                          MediaQuery
                                              .of(context)
                                              .size
                                              .width,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                            BorderRadius.circular(20),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex:2,
                                                  child: Text(
                                                    getTR[index]
                                                        .productName
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 10,
                                                      color: titleFontColor,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.star,
                                                        color:
                                                        Colors.orangeAccent,
                                                        size: 8,
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        color:
                                                        Colors.orangeAccent,
                                                        size: 8,
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        color:
                                                        Colors.orangeAccent,
                                                        size: 8,
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        color:
                                                        Colors.orangeAccent,
                                                        size: 8,
                                                      ),
                                                      Icon(
                                                        Icons.star_border_sharp,
                                                        color:
                                                        Colors.orangeAccent,
                                                        size: 8,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    "৳ " +
                                                        getTR[index]
                                                            .sellingPrice
                                                            .toString(),
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 10,
                                                      color: primaryColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                        else{
                          return Container();
                        }
                      }
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
