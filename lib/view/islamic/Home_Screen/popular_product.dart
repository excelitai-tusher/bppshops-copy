import 'package:bpp_shop/models/islamic/most_popular.dart';
import 'package:bpp_shop/view/islamic/Home_Screen/popular_product_seeAll.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import '../../../component/gradient_text.dart';
import '../../../models/islamic/islamic_home_page.dart';
import '../../../service/islamic/http_most_popular.dart';
import '../productDetails/bottom_sheet.dart';

class PopularProductHome extends StatefulWidget {
  String scrollControl;
  PopularProductHome(
    this.scrollControl,
  );
  @override
  _PopularProductHomeState createState() => _PopularProductHomeState();
}

class _PopularProductHomeState extends State<PopularProductHome> {
  //HttpRequests _httpRequests = HttpRequests();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getPopularData(), //getPopularData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<MostPopularAll> get = snapshot.data ?? <MostPopularAll>[];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                widget.scrollControl == 'neverScroll'
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Popular Products",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                    : Container(),
                Container(
                  height: widget.scrollControl == 'neverScroll'
                      ? (get.length < 3
                          ? MediaQuery.of(context).size.width / 1.5 + 10
                          : get.length >= 3
                              ? (MediaQuery.of(context).size.width / 1.5 + 10) *
                                  2
                              : 0)
                      : MediaQuery.of(context).size.height * .7,
                  child: GridView.builder(
                    itemCount: widget.scrollControl == 'neverScroll'
                        ? (get.length == 1
                            ? 1
                            : get.length == 2
                                ? 2
                                : get.length == 3
                                    ? 3
                                    : 4)
                        : get.length,
                    physics: widget.scrollControl == 'neverScroll'
                        ? NeverScrollableScrollPhysics()
                        : null,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2 / 3,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 10),
                    itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.grey, width: 1)),
                      child: GridTile(
                        footer: GridTileBar(
                          title: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.amber,
                              minimumSize: Size(90, 30),
                            ),
                            onPressed: () {
                              showModalBottomSheet<void>(
                                isDismissible: false,
                                isScrollControlled: true,
                                context: context,
                                builder: (BuildContext context) {
                                  return MyBottomSheet(
                                    productId: get[index].id.toString(),
                                    productImage: get[index].productThambnail != null
                                        ? 'https://bppshops.com/${get[index].productThambnail}'
                                        : 'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg',
                                    productName: get[index].productName,
                                    productDetail: get[index].productDescp,
                                    productPrePrice: get[index].discountPrice,
                                    //  shipping: double.tryParse(get[index].shipping!),
                                    color: get[index].productColor,
                                    size: get[index].productSize,
                                    video: get[index].videoLink,
                                    productPrice: double.tryParse(
                                      get[index].sellingPrice!,
                                    ),
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
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              child: get[index].productThambnail != null
                                  ? Image.network(
                                      'https://bppshops.com/${get[index].productThambnail}',
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(
                                      'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 2, right: 2),
                              child: Text(
                                '${get[index].productName}',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: Text(
                                'Unit: ${get[index].unit}',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  '৳ ${double.tryParse(get[index].sellingPrice!)?.toStringAsFixed(1)}',
                                  style: TextStyle(color: Colors.green),
                                ),
                                Text(
                                  '৳ ${double.tryParse(get[index].discountPrice!)?.toStringAsFixed(1)}',
                                  style: TextStyle(
                                      color: Colors.red,
                                      decoration: TextDecoration.lineThrough),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                widget.scrollControl == 'neverScroll'
                    ? Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PopularProduct(),
                            ));
                          },
                          child: Text(
                            //
                            "See All →",
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                          style: ButtonStyle(
                            //padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(color: Colors.black)),
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            );
          } else {
            return Column(
              children: [
                widget.scrollControl == 'neverScroll'
                    ? Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Shimmer(
                          duration: Duration(seconds: 2), //Default value
                          interval: Duration(
                              seconds: 1), //Default value: Duration(seconds: 0)
                          color: Colors
                              .black, //Colors.grey.shade700, //Default value
                          colorOpacity: 0, //Default value
                          enabled: true, //Default value
                          direction: ShimmerDirection.fromLTRB(),
                          child: Container(
                            height: 35,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                      )
                    : Container(),
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: Container(
                    height: widget.scrollControl == 'neverScroll'
                        ? (MediaQuery.of(context).size.width / 2 + 25) * 2
                        : MediaQuery.of(context).size.height * .7,
                    child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 2.5,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 10),
                        itemCount:
                            widget.scrollControl == 'neverScroll' ? 4 : 6,
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
                                ),
                              ),
                            )),
                  ),
                ),
                widget.scrollControl == 'neverScroll'
                    ? Shimmer(
                        duration: Duration(seconds: 2), //Default value
                        interval: Duration(
                            seconds: 1), //Default value: Duration(seconds: 0)
                        color: Colors
                            .black, //Colors.grey.shade700, //Default value
                        colorOpacity: 0, //Default value
                        enabled: true, //Default value
                        direction: ShimmerDirection.fromLTRB(),
                        child: Container(
                          height: 25,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(6),
                            // border:
                            // Border.all(color: Colors.grey, width: 1)
                          ),
                        ),
                      )
                    : Container(),
              ],
            );
          }
        });
  }
}
