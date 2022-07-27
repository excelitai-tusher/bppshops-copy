 import 'package:bpp_shop/service/grocery/http_deal_of_day_grocery.dart';
import 'package:bpp_shop/view/bpp/appBar/appBar2.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/BottomAppBar2.dart';
import 'package:bpp_shop/view/bpp/drawer/bpp_drawer.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/floatingButton.dart';

import 'package:bpp_shop/view_model/bpp/cart_provider.dart';
import 'package:bpp_shop/models/grocery/deal_of_day_grocery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../../constant/app_colors.dart';
 GlobalKey<ScaffoldState> _scafoldKey = GlobalKey();
class DealsOfTheDaySeeAll extends StatelessWidget {
 DealsOfTheDaySeeAll({Key? key}) : super(key: key);
 String? nameFromFacebook;
 int? routeKey;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return Scaffold(
      key: _scafoldKey,
      appBar: bppAppBar2(context,_scafoldKey,nameFromFacebook,routeKey),
      drawer: BPPMainPageDrawer(),
      body: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text("Deal Of The Day",style: TextStyle(color: Colors.black),),
          centerTitle: true,
          leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
            onPressed: (){
              Navigator.pop(context);
            },),
        ),
        body: FutureBuilder(
          future: getDealOfDay(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.hasData) {
      List<DealOfDay> get = snapshot.data ??
      <DealOfDay>[];
          return Container(
            height:  MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView.separated(
              //scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, i) {
                //DealsOfTheDayModel item = DealsOfTheDayModel.list[i];
                return Padding(
                  padding: const EdgeInsets.only(left: 8,top: 8.0, bottom: 8.0),
                  child: Container(
                    height: 250,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: tertiaryColor1,
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image:get[i].productThambnail!=null?NetworkImage("https://bppshops.com/${get[i].productThambnail}"):
                                    NetworkImage('https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg') ,
                                    // AssetImage(item.productImageUrl.toString()),
                                   fit: BoxFit.cover,
                                  )),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        height: 40,
                                        width: MediaQuery.of(context).size.width,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 2),
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(15),
                                                  color: tertiaryColor1,
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
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "1",
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: primaryColor,
                                                      ),
                                                    ),
                                                    Text(
                                                      "D",
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: tertiaryColor2,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 2),
                                                  height: 50,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(15),
                                                    color: tertiaryColor1,
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        "5",
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: primaryColor,
                                                        ),
                                                      ),
                                                      Text(
                                                        "H",
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: tertiaryColor2,
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                            Expanded(
                                              child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 2),
                                                  height: 50,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(15),
                                                    color: tertiaryColor1,
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        "9",
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: primaryColor,
                                                        ),
                                                      ),
                                                      Text(
                                                        "M",
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: tertiaryColor2,
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                            Expanded(
                                              child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 2),
                                                  height: 50,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(15),
                                                    color: tertiaryColor1,
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        "54",
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: primaryColor,
                                                        ),
                                                      ),
                                                      Text(
                                                        "S",
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: tertiaryColor2,
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "${get[i].productName}",maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    //item.productName.toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: titleFontColor,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Row(

                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.orangeAccent,
                                        size: 15,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.orangeAccent,
                                        size: 15,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.orangeAccent,
                                        size: 15,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.orangeAccent,
                                        size: 15,
                                      ),
                                      Icon(
                                        Icons.star_border_sharp,
                                        color: Colors.orangeAccent,
                                        size: 15,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Row(

                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text('৳ ${double.tryParse(get[i].sellingPrice!)?.toStringAsFixed(1)}',
                                                //   "\$ " + item.price.toString(),
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: primaryColor,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                child:get[i].discountPrice!="0.00"? Text('৳ ${double.tryParse(get[i].discountPrice!)?.toStringAsFixed(1)}',
                                                  //  "\$ " + item.prePrice.toString(),
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.red,
                                                    decoration: TextDecoration.lineThrough,
                                                  ),
                                                ):Text(""),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          cart.addItem(
                                              get[i].id.toString(),
                                              double.tryParse(get[i].sellingPrice!)! ,
                                              get[i].productName,
                                              "https://bppshops.com/${get[i].productThambnail}",
                                              1

                                            // widget.productId!,
                                            // widget.productPrice!,
                                            // widget.productName.toString(),
                                            // widget.productImage.toString(),
                                            // widget.qty,
                                          );

                                        },
                                        icon: Icon(
                                          Icons.add_shopping_cart_outlined,
                                          color: primaryColor,
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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
              itemCount: get.length,
            ),
          );}
      else{
        return Center(child:SpinKitSpinningLines(
          color:  Color(0xFF9FF348),
          size: 80.0,
        ),);
      }
      }
        ),

        floatingActionButton: floatingButton(context,Color(0xFF3DC73C)),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: bottomAppBar(context,Color(0xFF3DC73C)),
      ),
    );
  }
}
