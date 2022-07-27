import 'package:bpp_shop/component/gradient_text.dart';
import 'package:bpp_shop/view/islamic/productDetails/bottom_sheet.dart';
import 'package:bpp_shop/models/islamic/daily_best_sell.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../service/islamic/http_daily_best_sell.dart';

class DailyBestSellWidget extends StatefulWidget {
  @override
  _DailyBestSellWidgetState createState() => _DailyBestSellWidgetState();
}

class _DailyBestSellWidgetState extends State<DailyBestSellWidget> {
  // HttpRequests _httpRequests=HttpRequests();

  @override
  Widget build(BuildContext context) {
    return
      FutureBuilder(
          future: getDailyBestSell(),
          //_httpRequests.httpGetRequest(suffixUrl: _httpRequests.islamicHomepage, returnValue: _httpRequests.returnDailyBestSales),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<DailyBestSales> get = snapshot.data ?? <DailyBestSales>[];
              return get.length > 0
                  ?
              Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Daily Best Sells",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: get.length < 3
                        ? MediaQuery.of(context).size.width / 1.5 + 10
                        : get.length > 3
                        ? (MediaQuery.of(context).size.width / 1.5 +
                        10) *
                        2
                        : 0,
                    child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 3,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 10),
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: get.length == 1
                            ? 1
                            : get.length == 2
                            ? 2
                            : get.length == 3
                            ? 3
                            : 4,
                        itemBuilder: (context, index) => Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                  color: Colors.grey, width: 1)),
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child: get[index]
                                        .productThambnail !=
                                        null
                                        ? Image.network(
                                      'https://bppshops.com/${get[index].productThambnail}',
                                      fit: BoxFit.cover,
                                    )
                                        : Image.network(
                                        'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg'),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    child: Text(
                                      '${get[index].productName}',
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 15),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '৳ ${double.tryParse(get[index].sellingPrice!)?.toStringAsFixed(1)}',
                                              style: TextStyle(
                                                  color: Colors.green),
                                            ),
                                            Text(
                                              '৳ ${double.tryParse(get[index].discountPrice!)?.toStringAsFixed(1)}',
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  decoration:
                                                  TextDecoration
                                                      .lineThrough),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.only(
                                              top: 12),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            children: [
                                              Expanded(
                                                child: Icon(
                                                  Icons.star,
                                                  size: 11,
                                                  color: Colors
                                                      .orangeAccent,
                                                ),
                                              ),
                                              Expanded(
                                                child: Icon(
                                                  Icons.star,
                                                  size: 11,
                                                  color: Colors
                                                      .orangeAccent,
                                                ),
                                              ),
                                              Expanded(
                                                child: Icon(
                                                  Icons.star,
                                                  size: 11,
                                                  color: Colors
                                                      .orangeAccent,
                                                ),
                                              ),
                                              Expanded(
                                                child: Icon(
                                                  Icons.star,
                                                  size: 11,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              Expanded(
                                                child: Icon(
                                                  Icons.star,
                                                  size: 11,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              //  SizedBox(width: 5,),
                                              Expanded(
                                                child: Text(
                                                  '(4)',
                                                  style: TextStyle(
                                                      color:
                                                      Colors.black,
                                                      fontSize: 8),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.amber,
                                      minimumSize: Size(90, 30),
                                    ),
                                    onPressed: () {
                                      showModalBottomSheet<void>(
                                        isDismissible: false,
                                        isScrollControlled: true,
                                        context: context,
                                        builder:
                                            (BuildContext context) {
                                          return MyBottomSheet(
                                            productId:
                                            get[index].productId,
                                            productImage: get[index]
                                                .productThambnail !=
                                                null
                                                ? 'https://bppshops.com/${get[index].productThambnail}'
                                                : 'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg',
                                            productName:
                                            get[index].productName,
                                            productDetail:
                                            get[index].productDescp,
                                            //  shipping: double.tryParse(get[index].shipping!),
                                            productPrePrice: get[index]
                                                .discountPrice,
                                            color:
                                            get[index].productColor,
                                            productPrice:
                                            double.tryParse(
                                                get[index]
                                                    .sellingPrice!),
                                          );
                                        },
                                      );
                                    },
                                    icon: Icon(
                                      Icons.shopping_bag_outlined,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                    label: Text(
                                      'Add to Bag',
                                      style: TextStyle(
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                  ),
                ],
              )
                  : Container();
            } else {
              return Column(
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
                      // padding: EdgeInsets.only(top: 10),
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      height: 35,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(6),
                        // border:
                        // Border.all(color: Colors.grey, width: 1)
                      ),
                    ),
                  ),
                  Container(
                    height: (MediaQuery.of(context).size.width / 2 + 25) * 2,
                    child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 2.5,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 10),
                        itemCount: 4,
                        itemBuilder: (context, index) => Shimmer(
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
                            child: Center(
                              child: GradientText(
                                'Bpp Shop',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0,
                                ),
                                gradient: LinearGradient(colors: [
                                  // Colors.grey.shade900,
                                  // Colors.grey.shade800,
                                  // Colors.grey.shade700,
                                  Colors.grey.shade500,
                                  Colors.grey.shade500,
                                  Colors.grey.shade500,
                                  Colors.grey.shade500,
                                  Colors.grey.shade500,
                                  // Colors.grey.shade400,
                                  // Colors.grey.shade300,
                                  // Colors.grey.shade200,
                                  // Colors.grey.shade100,
                                  // Colors.teal,
                                  // Colors.green,
                                  // Colors.lightGreen,
                                  // Colors.lime,
                                  // Colors.yellow,
                                  // Colors.amber,
                                  // Colors.orange,
                                  // Colors.deepOrange,
                                ]),
                                align: TextAlign.center,
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(6),
                              // border:
                              // Border.all(color: Colors.grey, width: 1)
                            ),
                          ),
                        )),
                  ),
                ],
              );
            }
          });
  }
}
