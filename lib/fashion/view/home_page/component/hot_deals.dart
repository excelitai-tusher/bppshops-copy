import 'package:bpp_shop/fashion/controller/app_bar_controler.dart';
import 'package:bpp_shop/fashion/controller/product_detail_controller.dart';
import 'package:bpp_shop/fashion/controller/secondary_page_controller.dart';
import 'package:bpp_shop/fashion/model/best_selling_product.dart';
import 'package:bpp_shop/fashion/model/hot_deals_model.dart';
import 'package:bpp_shop/fashion/model/new_arrival_madel.dart';
import 'package:bpp_shop/fashion/view/home_page/component/hot_deal_diagonal_path.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotDeals extends StatefulWidget {
  const HotDeals({Key? key}) : super(key: key);

  @override
  State<HotDeals> createState() => _HotDealsState();
}

class _HotDealsState extends State<HotDeals>
    with SingleTickerProviderStateMixin {
  final CarouselController _controller = CarouselController();
  //HotDealsModel list=HotDealsModel();
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        //color: Colors.grey,
        height: 355,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 4,
              blurRadius: 2,
              offset: Offset(2, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: ClipPath(
                  clipper: HotDealDiagonalPath(),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          color: Colors.white,
                          gradient: LinearGradient(
                            colors: [Colors.white, Colors.white],
                            begin: Alignment.topRight,
                            end: Alignment.bottomCenter,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 4,
                              blurRadius: 2,
                              offset:
                                  Offset(2, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.black,
                                child: Center(
                                  child: Text(
                                    "Hot Deals",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 10,
                              child: CarouselSlider.builder(
                                  //items: imageSliders,
                                  itemCount: HotDealsModel.list.length,
                                  options: CarouselOptions(
                                    enlargeCenterPage: true,
                                    reverse: false,
                                    autoPlay: true,
                                    autoPlayInterval: Duration(seconds: 3),
                                    autoPlayAnimationDuration:
                                        Duration(milliseconds: 1000),
                                    height: MediaQuery.of(context).size.height,
                                  ),
                                  carouselController: _controller,
                                  itemBuilder: (BuildContext context,
                                      int itemIndex, int pageViewIndex) {
                                    HotDealsModel item =
                                        HotDealsModel.list[itemIndex];
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white,
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                      item.type1Image
                                                          .toString(),
                                                    ),
                                                    fit: BoxFit.fill,
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                      spreadRadius: 1,
                                                      blurRadius: 3,
                                                      offset: Offset(0,
                                                          1), // changes position of shadow
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white,
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                      item.type2Image
                                                          .toString(),
                                                    ),
                                                    fit: BoxFit.fill,
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                      spreadRadius: 1,
                                                      blurRadius: 3,
                                                      offset: Offset(0,
                                                          1), // changes position of shadow
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white,
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                      item.type3Image
                                                          .toString(),
                                                    ),
                                                    fit: BoxFit.fill,
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                      spreadRadius: 1,
                                                      blurRadius: 3,
                                                      offset: Offset(0,
                                                          1), // changes position of shadow
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          item.notification.toString(),
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            height: 70,
                                            width: 70,
                                            child: Image.asset(
                                              item.type2Image.toString(),
                                              fit: BoxFit.fill,
                                              width: 1000.0,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          item.offerEndText.toString(),
                                          style: TextStyle(
                                            fontSize: 10,
                                            //fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 20,
                                                width: 20,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                      spreadRadius: 1,
                                                      blurRadius: 3,
                                                      offset: Offset(0,
                                                          1), // changes position of shadow
                                                    ),
                                                  ],
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    item.day.toString(),
                                                    style:
                                                        TextStyle(fontSize: 8),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 20,
                                                width: 20,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                      spreadRadius: 1,
                                                      blurRadius: 3,
                                                      offset: Offset(0,
                                                          1), // changes position of shadow
                                                    ),
                                                  ],
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    item.h.toString(),
                                                    style:
                                                        TextStyle(fontSize: 8),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 20,
                                                width: 20,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                      spreadRadius: 1,
                                                      blurRadius: 3,
                                                      offset: Offset(0,
                                                          1), // changes position of shadow
                                                    ),
                                                  ],
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    item.m.toString(),
                                                    style:
                                                        TextStyle(fontSize: 8),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 20,
                                                width: 20,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                      spreadRadius: 1,
                                                      blurRadius: 3,
                                                      offset: Offset(0,
                                                          1), // changes position of shadow
                                                    ),
                                                  ],
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    item.s.toString(),
                                                    style:
                                                        TextStyle(fontSize: 8),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 20,
                                                width: 20,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                      spreadRadius: 1,
                                                      blurRadius: 3,
                                                      offset: Offset(0,
                                                          1), // changes position of shadow
                                                    ),
                                                  ],
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "D",
                                                    style:
                                                        TextStyle(fontSize: 8),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 20,
                                                width: 20,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                      spreadRadius: 1,
                                                      blurRadius: 3,
                                                      offset: Offset(0,
                                                          1), // changes position of shadow
                                                    ),
                                                  ],
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "H",
                                                    style:
                                                        TextStyle(fontSize: 8),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 20,
                                                width: 20,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                      spreadRadius: 1,
                                                      blurRadius: 3,
                                                      offset: Offset(0,
                                                          1), // changes position of shadow
                                                    ),
                                                  ],
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "M",
                                                    style:
                                                        TextStyle(fontSize: 8),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 20,
                                                width: 20,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                      spreadRadius: 1,
                                                      blurRadius: 3,
                                                      offset: Offset(0,
                                                          1), // changes position of shadow
                                                    ),
                                                  ],
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "S",
                                                    style:
                                                        TextStyle(fontSize: 8),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    );
                                  }),
                            ),
                            Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                color: Colors.white,
                                child: Row(
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 40,
                                      width: 55,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.white),
                                        onPressed: () =>
                                            _controller.previousPage(),
                                        child: Text(
                                          '<Pre',
                                          style: TextStyle(
                                              fontSize: 8, color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                      width: 70,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.white),
                                        onPressed: () => _controller.nextPage(),
                                        child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Next>',
                                              style: TextStyle(
                                                  fontSize: 8,
                                                  color: Colors.black),
                                            )),
                                      ),
                                    ),
                                    // ...Iterable<int>.generate(imgList.length).map(
                                    //       (int pageIndex) => Flexible(
                                    //     child: ElevatedButton(
                                    //       onPressed: () => _controller.animateToPage(pageIndex),
                                    //       child: Text("$pageIndex"),
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.white10,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: AppBar(
                          backgroundColor: Colors.white,
                          bottom: TabBar(
                            labelColor: Colors.red,
                            unselectedLabelColor: Colors.grey,
                            indicatorColor: Colors.red,
                            controller: _controllerTab,
                            tabs: [
                              Tab(
                                //icon: Icon(Icons.directions_bike),
                                child: Text(
                                  "Latest Products",
                                  style: TextStyle(fontSize: 10.sp),
                                ),
                              ),
                              Tab(
                                // icon: Icon(
                                //   Icons.directions_car,
                                // ),
                                child: Text(
                                  "Top Rated",
                                  style: TextStyle(fontSize: 10.sp),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // create widgets for each tab bar here
                      Expanded(
                        flex: 11,
                        child: TabBarView(
                          controller: _controllerTab,
                          children: [
                            // first tab bar view widget
                            GridView.builder(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8),
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: false,
                              itemCount: BestSellingProductModel.list.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 5,
                                childAspectRatio: 3 / 2,
                                mainAxisSpacing: 5,
                                mainAxisExtent:
                                    MediaQuery.of(context).size.height * .15,
                              ),
                              itemBuilder: (BuildContext context, i) {
                                BestSellingProductModel product =
                                    BestSellingProductModel.list[i];
                                return GestureDetector(
                                  onTap: () {
                                    final appBar =
                                        Provider.of<PrimaryScreenState>(context,
                                            listen: false);
                                    appBar.setPrimaryState(false);
                                    final pageState =
                                        Provider.of<SecondaryPage>(context,
                                            listen: false);
                                    pageState.setSecondaryPage(2);
                                    final view =
                                        Provider.of<ProductDetailController>(
                                            context,
                                            listen: false);
                                    view.setProductData(
                                      product.imageUrl.toString(),
                                      product.productName.toString(),
                                      product.productPrice.toString(),
                                    );
                                  },
                                  child: Container(
                                    //margin: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                    height:
                                        MediaQuery.of(context).size.height * .5,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
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
                                      //borderRadius: BorderRadius.circular(15),
                                      // image: DecorationImage(
                                      //   image: AssetImage(product.imageUrl.toString()),
                                      //   fit: BoxFit.fill
                                      // )
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            width: double.infinity,
                                            height: 70,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(product
                                                      .imageUrl
                                                      .toString()),
                                                  fit: BoxFit.contain),
                                              color: Colors.transparent,
                                              //borderRadius: BorderRadius.circular(15),
                                            ),
                                          ),
                                        ),
                                        //Divider(),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(product.productName
                                                  .toString()),
                                              //Text(product.productDetail.toString()),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "\৳ " +
                                                            product.productPrice
                                                                .toString(),
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xffFF6000),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 12),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.star,
                                                        color:
                                                            Color(0xffFF6000),
                                                        size: 20,
                                                      ),
                                                      Text(
                                                        " " +
                                                            product
                                                                .productRating
                                                                .toString(),
                                                        style: TextStyle(
                                                            //color: Color(0xffFF6000),
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),

                            // second tab bar viiew widget
                            GridView.builder(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 8),
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: false,
                              itemCount: NewArrivalModel.list.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                childAspectRatio: 3 / 2,
                                mainAxisSpacing: 10,
                                mainAxisExtent:
                                    MediaQuery.of(context).size.height * .15,
                              ),
                              itemBuilder: (BuildContext context, i) {
                                NewArrivalModel product =
                                    NewArrivalModel.list[i];
                                return GestureDetector(
                                  onTap: () {
                                    final appBar =
                                        Provider.of<PrimaryScreenState>(context,
                                            listen: false);
                                    appBar.setPrimaryState(false);
                                    final pageState =
                                        Provider.of<SecondaryPage>(context,
                                            listen: false);
                                    pageState.setSecondaryPage(2);
                                    final view =
                                        Provider.of<ProductDetailController>(
                                            context,
                                            listen: false);
                                    view.setProductData(
                                      product.imageUrl.toString(),
                                      product.productName.toString(),
                                      product.productPrice.toString(),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          //margin: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 1,
                                                blurRadius: 3,
                                                offset: Offset(0,
                                                    1), // changes position of shadow
                                              ),
                                            ],
                                            color: Colors.white,
                                            //borderRadius: BorderRadius.circular(15),
                                            // image: DecorationImage(
                                            //   image: AssetImage(product.imageUrl.toString()),
                                            //   fit: BoxFit.fill
                                            // )
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                flex: 3,
                                                child: Container(
                                                  width: double.infinity,
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .height,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            product.imageUrl
                                                                .toString()),
                                                        fit: BoxFit.contain),
                                                    color: Colors.transparent,
                                                    //borderRadius: BorderRadius.circular(15),
                                                  ),
                                                ),
                                              ),
                                              //Divider(),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(product.productName
                                                        .toString()),
                                                    //Text(product.productDetail.toString()),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text(
                                                              "\৳ " +
                                                                  product
                                                                      .productPrice
                                                                      .toString(),
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xffFF6000),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 12),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons.star,
                                                              color: Color(
                                                                  0xffFF6000),
                                                              size: 20,
                                                            ),
                                                            // Text(
                                                            //   " " + product..toString(),
                                                            //   style: TextStyle(
                                                            //     //color: Color(0xffFF6000),
                                                            //       fontWeight: FontWeight.bold),
                                                            // ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
