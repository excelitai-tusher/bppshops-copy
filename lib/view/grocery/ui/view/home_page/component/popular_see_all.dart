import 'package:bpp_shop/service/grocery/http_popular.dart';
import 'package:bpp_shop/view/bpp/appBar/appBar2.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/BottomAppBar2.dart';
import 'package:bpp_shop/view/bpp/drawer/bpp_drawer.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/floatingButton.dart';
import 'package:bpp_shop/view_model/bpp/cart_provider.dart';

import 'package:bpp_shop/models/grocery/most_popular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../../constant/app_colors.dart';

GlobalKey<ScaffoldState> _scafoldKey = GlobalKey();

class PopularSeeAll extends StatelessWidget {
  PopularSeeAll({Key? key}) : super(key: key);
  String? nameFromFacebook;
  int? routeKey;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);

    return Scaffold(
      key: _scafoldKey,
      appBar: bppAppBar2(context, _scafoldKey, nameFromFacebook, routeKey),
      drawer: BPPMainPageDrawer(),
      body: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Popular Product",
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
            future: getGroceryPopularData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<GroceryMostPopularAll> get =
                    snapshot.data ?? <GroceryMostPopularAll>[];
                return ListView.separated(
                  itemBuilder: (BuildContext context, i) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                      child: ListTile(
                        tileColor: tertiaryColor1,
                        leading: SizedBox(
                          width: 50,
                          height: 50,
                          child: get[i].productThambnail != null
                              ? Image.network(
                                  "https://bppshops.com/${get[i].productThambnail}",
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg'),
                        ),
                        title: Text(
                          " ${get[i].productName}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16,
                            color: titleFontColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(get[i].total.toString()
                            // item.productQuantity.toString(),
                            ),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: primaryColor),
                              child: GestureDetector(
                                onTap: () {
                                  cart.addItem(
                                      get[i].productId!,
                                      double.tryParse(get[i].sellingPrice!)!,
                                      get[i].productName,
                                      "https://bppshops.com/${get[i].productThambnail}",
                                      1);
                                },
                                child: Icon(
                                  Icons.add_shopping_cart_outlined,
                                  color: tertiaryColor1,
                                  size: 18,
                                ),
                              ),
                            ),
                            Container(
                              width: 100,
                              child:get[i].discountPrice!="0.00"? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '৳ ${double.tryParse(get[i].sellingPrice!)?.toStringAsFixed(1)}',
                                    style: TextStyle(
                                      color: primaryColor,
                                    ),
                                  ),
                                  Text(
                                    '৳ ${double.tryParse(get[i].discountPrice!)?.toStringAsFixed(1)}',
                                    style: TextStyle(
                                        color: Colors.red,
                                        decoration: TextDecoration.lineThrough),
                                  ),
                                ],
                              ):       Text(
                                '৳ ${double.tryParse(get[i].sellingPrice!)?.toStringAsFixed(1)}',textAlign: TextAlign.end,
                                style: TextStyle(
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: get.length,
                );
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
