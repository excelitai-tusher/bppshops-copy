import 'package:bpp_shop/component/badge.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/BottomAppBar2.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/floatingButton.dart';
import 'package:bpp_shop/view_model/bpp/cart_provider.dart';
import 'package:bpp_shop/models/islamic/latest_discount_model.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/bottom_app_bar.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/history_screen/history_screen.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/home_Screen/home_screen.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/profile/profile_screen.dart';
import 'package:bpp_shop/view/bpp/cart/cart_screen.dart';

import 'package:bpp_shop/component/dropdown.dart';
import 'package:bpp_shop/component/filter.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/wish_list/wishlist_screen.dart';
import 'package:bpp_shop/view/islamic/productDetails/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../service/islamic/http_latest_discount.dart';



class LatestDiscountShopNow extends StatefulWidget {
  const LatestDiscountShopNow({Key? key}) : super(key: key);

  @override
  State<LatestDiscountShopNow> createState() => _LatestDiscountShopNowState();
}

class _LatestDiscountShopNowState extends State<LatestDiscountShopNow> {
//  HttpRequests _httpRequests = HttpRequests();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
            title: const Text(
              "Latest Discount",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: const [
              Icon(Icons.search, color: Colors.white),
              SizedBox(
                width: 5,
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.notifications_outlined, color: Colors.white),
              ),
            ],
          ),
          //  bottomNavigationBar: Bottom_NavBar() ,
          body: Container(
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: [
                Container(
                  height: 35,
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.filter_alt_outlined,
                              color: Colors.grey,
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Filter()));
                                },
                                child: Text(
                                  'Filters',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                )),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.height,
                              color: Colors.grey,
                            ),
                            MyDropDown(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                height: MediaQuery.of(context).size.height * .68,
                  width: MediaQuery.of(context).size.width,
                  child: FutureBuilder(
                      future: getlatestDiscountData(), //getPopularData(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          List<Latestdiscountproduct> get = snapshot.data ?? <Latestdiscountproduct>[];
                          return Container(
                            height:get.length<3?MediaQuery.of(context).size.width/2+20:get.length>=3?(MediaQuery.of(context).size.width/2+25)*2:0,
                            child: GridView.builder(
                              itemCount: get.length,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 2 / 2.5,
                                  crossAxisSpacing: 15,
                                  mainAxisSpacing: 10),
                              itemBuilder:(context,index)=> Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,

                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.grey, width: 1)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 90,
                                      alignment: Alignment.center,
                                      child:get[index].productThambnail != null? Image.network(
                                        'https://bppshops.com/${get[index].productThambnail}',
                                        fit: BoxFit.cover,
                                      ):
                                      Image.network('https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg'),
                                    ),
                                    Text(
                                      '${get[index].productName}',
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.start,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 12,
                                          color: Colors.orangeAccent,
                                        ),
                                        Icon(
                                          Icons.star,
                                          size: 12,
                                          color: Colors.orangeAccent,
                                        ),
                                        Icon(
                                          Icons.star,
                                          size: 12,
                                          color: Colors.orangeAccent,
                                        ),
                                        Icon(
                                          Icons.star,
                                          size: 12,
                                          color: Colors.grey,
                                        ),
                                        Icon(
                                          Icons.star,
                                          size: 12,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '(4)',
                                          style: TextStyle(color: Colors.black),
                                        )
                                      ],
                                    ),
                                    FittedBox(
                                      child: RichText(
                                        text: TextSpan(
                                          text: '৳ ${double.tryParse(get[index].sellingPrice!)!.toStringAsFixed(1)}  ',
                                          style: TextStyle(color: Colors.green),
                                          children:  <TextSpan>[
                                            TextSpan(text:  '৳ ${double.tryParse(get[index].discountPrice!)!.toStringAsFixed(1)}', style: TextStyle(
                                                color: Theme.of(context).errorColor,
                                                decoration: TextDecoration
                                                    .lineThrough)),

                                          ],
                                        ),
                                      ),
                                    ),

                                    Center(
                                      child: FittedBox(
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
                                              builder: (BuildContext context) {
                                                return MyBottomSheet(
                                                  productId: get[index].id.toString(),
                                                  productImage:get[index].productThambnail != null?
                                                  'https://bppshops.com/${get[index]
                                                      .productThambnail}':'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg',
                                                  productName: get[index].productName,
                                                  productDetail: get[index].metaDesc,
                                                 productPrePrice: get[index].discountPrice,
                                                color: get[index].productColor,
                                                size: get[index].productSize,
                                                //  shipping: double.tryParse(get[index].shipping!),
                                                  productPrice:
                                                  double.tryParse(get[index].sellingPrice!),
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
                                    ),
                                  ],
                                ),
                              ) ,
                            ),
                          );

                        } else {
                          return Container(
                            height: (MediaQuery.of(context).size.width/2+25)*3,
                            child: GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
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
              ],
            ),
          ),
        floatingActionButton: floatingButton(context,Colors.amber),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: bottomAppBar(context,Colors.amber),
      ),
    );
  }
}
