
import 'package:bpp_shop/component/gradient_text.dart';
import 'package:bpp_shop/models/islamic/recently_added_model.dart';
import 'package:bpp_shop/view/islamic/productDetails/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../service/islamic/http_recently_added.dart';


class RecentlyAddedWidget extends StatefulWidget {
  @override
  State<RecentlyAddedWidget> createState() => _RecentlyAddedWidgetState();
}

class _RecentlyAddedWidgetState extends State<RecentlyAddedWidget> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getRecentlyAdded(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<RecentlyAdded> get = snapshot.data ?? <RecentlyAdded>[];

            return get.length>0? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text(
                          "Recently Added",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 120,
                            height: 4,
                            color: Colors.amber,
                          ),
                          Container(
                            width: 80,
                            height: 4,
                            color: Colors.grey[300],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height*.3,
                        // height: get.length < 3
                        //     ? MediaQuery.of(context).size.width / 4
                        //     : get.length >= 3
                        //         ? (MediaQuery.of(context).size.width / 4) * 2
                        //         : 0,
                        child: GridView.builder(
                         scrollDirection: Axis.horizontal,

                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent:180,
                                    mainAxisExtent: 180,
                                    mainAxisSpacing: 5),
                           itemCount: get.length,
                            // itemCount: get.length == 1
                            //     ? 1
                            //     : get.length == 2
                            //         ? 2
                            //         : get.length == 3
                            //             ? 3
                            //             :4,
                            itemBuilder: (context, index) {
                              return ListTile(
                                isThreeLine: true,
                                onTap: (){
                                  showModalBottomSheet<void>(
                                    isDismissible: false,
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return MyBottomSheet(
                                        productId: get[index].id.toString(),
                                        productImage:get[index].productThambnail != null?'https://bppshops.com/${get[index].productThambnail}':'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg',
                                        productName: get[index].productName,
                                        productDetail: get[index].productDescp,
                                        productPrePrice: get[index].discountPrice,
                                        size: get[index].productSize,
                                       color: get[index].productColor,
                                        productPrice:double.tryParse(get[index].sellingPrice!) ,
                                      );
                                    },
                                  );
                                },
                                leading: get[index].productThambnail != null
                                    ? Image.network(
                                        "https://bppshops.com/${get[index].productThambnail}",
                                        fit: BoxFit.cover,
                                      )
                                    : Image.network(
                                        'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                title: Padding(
                                  padding: const EdgeInsets.only(top: 0),
                                  child: Text(
                                    "${get[index].productName}",
                                    style: TextStyle(color: Colors.black),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                                dense:true,
                                subtitle: FittedBox(
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 11,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 11,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 11,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 11,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.grey,
                                              size: 10,
                                            ),
                                            Text(
                                              "(14)",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                              ),
                                            )
                                          ],
                                        ),
                                        Text(
                                          "৳ ${double.tryParse(get[index].sellingPrice!)!.toStringAsFixed(1)}",
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          "৳ ${double.tryParse(get[index].discountPrice!)!.toStringAsFixed(1)}",
                                          style: TextStyle(
                                            color: Colors.red,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ):Container();

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
                    margin: EdgeInsets.symmetric(vertical: 10),
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
                    height: (MediaQuery.of(context).size.width / 4) * 2,
                    child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 4 / 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Shimmer(
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
                                    ]),
                                    align: TextAlign.center,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ));
                        })),
              ],
            );
          }
        });
  }
}
