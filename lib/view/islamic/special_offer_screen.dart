import 'package:bpp_shop/component/badge.dart';
import 'package:bpp_shop/models/islamic/special_offers.dart';
import 'package:bpp_shop/view/bpp/appBar/appBar2.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/BottomAppBar2.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/floatingButton.dart';
import 'package:bpp_shop/view_model/bpp/cart_provider.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/wish_list/wishlist_screen.dart';

import 'package:bpp_shop/view/islamic/productDetails/bottom_sheet.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/bottom_app_bar.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/history_screen/history_screen.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/home_Screen/home_screen.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/profile/profile_screen.dart';
import 'package:bpp_shop/view/bpp/cart/cart_screen.dart';
import 'package:bpp_shop/view/bpp/drawer/bpp_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import '../../service/islamic/http_special_offer.dart';


class SpecialOfferScreen extends StatefulWidget {
  String? nameFromFacebook;
  int? routeKey;
 SpecialOfferScreen({Key? key}) : super(key: key);

  @override
  _SpecialOfferScreenState createState() => _SpecialOfferScreenState();
}

class _SpecialOfferScreenState extends State<SpecialOfferScreen> {


  GlobalKey<ScaffoldState> _scafoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scafoldKey,
      appBar: bppAppBar2(context,_scafoldKey,widget.nameFromFacebook,widget.routeKey),
      drawer: BPPMainPageDrawer(),
      body: Scaffold(
        appBar: AppBar(
          title: Text(
            'Special Offer',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                //  Navigator.pop(context);
              },
            ),
          ],
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: FutureBuilder(
              future: getSpecialOffer(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List<SpecialOffers> get = snapshot.data ?? <SpecialOffers>[];
                  return Container(
                 //  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2 / 2.5,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 10),

                      children: get
                          .map((SpecialOffers get) => Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                    color: Colors.grey, width: 1)),
                            child: GridTile(
                              footer: GridTileBar(

                              title:  ElevatedButton.icon(
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
                                              productId: get.id.toString(),
                                              productImage:get.productThambnail != null?
                                              'https://bppshops.com/${get.productThambnail}':'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg',
                                              productName: get.productName,
                                              productDetail: get.productDescp,
                                              productPrePrice: get.discountPrice,

                                              productPrice:
                                              double.tryParse(get.sellingPrice!),
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
                                      height: 90,
                                      child:get.productThambnail != null? Image.network(
                                        'https://bppshops.com/${get.productThambnail}',
                                        fit: BoxFit.cover,
                                      ):
                                      Image.network('https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg'),

                                  ),
                                  Flexible(
                                    child: Text(
                                      '${get.productName}',overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Text(
                                      '${get.unit}',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: '৳ ${double.tryParse(get.sellingPrice!)!.toStringAsFixed(1)}  ',
                                      style: TextStyle(color: Colors.green),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: '৳ ${double.tryParse(get.discountPrice!)!.toStringAsFixed(1)}',
                                          style: TextStyle(
                                              color: Colors.red,
                                              decoration: TextDecoration
                                                  .lineThrough),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ))
                          .toList(),
                    ),
                  );
                } else {
                  return Container(
                    height: (MediaQuery.of(context).size.width/2+25)*3,
                    child: GridView.builder(
                       // physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 2.5,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 10),
                        itemCount: 6,
                        itemBuilder:(context,index)=> Shimmer(
                          duration: Duration(seconds: 2), //Default value
                          interval: Duration(seconds: 1), //Default value: Duration(seconds: 0)
                          color: Colors.black,//Colors.grey.shade700, //Default value
                          colorOpacity: 0, //Default value
                          enabled: true, //Default value
                          direction: ShimmerDirection.fromLTRB(),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(6),

                            ),
                          ),
                        )
                    ),
                  );
                }
              }),
        ),
      ),
      floatingActionButton: floatingButton(context,Colors.amber),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottomAppBar(context,Colors.amber),
    );
  }
}
