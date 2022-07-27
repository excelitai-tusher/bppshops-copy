

import 'package:bpp_shop/fashion/provider/latestProvider.dart';
import 'package:bpp_shop/fashion/provider/top_Rated_provider.dart';
import 'package:bpp_shop/fashion/widget/View_More_Screen.dart';
import 'package:bpp_shop/view_model/bpp/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../FASHION/MyTheme/app_colors.dart';

class   LatestProduct extends StatefulWidget {
  const   LatestProduct({Key? key}) : super(key: key);

  @override
  State<  LatestProduct> createState() => _LatestProductState();
}

class _LatestProductState extends State<  LatestProduct> {
  bool isLatest = true;
  bool isSale = false;
  bool isRate = false;





  // List productsList = [
  //   {
  //     'image': 'assets/banner.png',
  //     'name': 'Men',
  //     'price': '\$2000',
  //     'discount': '\$2500'
  //   },
  //   {
  //     'image': 'assets/banner.png',
  //     'name': 'Women',
  //     'price': '\$2000',
  //     'discount': '\$2500'
  //   },
  //   //{'image': 'assets/pic3.png', 'name': 'Kids','price':'\$2000','discount':'\$2500'},
  //   //{'image': 'assets/banner.png', 'name': 'Men','price':'\$2000','discount':'\$2500'},
  //   // {'image': 'assets/banner.png', 'name': 'Women','price':'\$2000','discount':'\$2500'},
  //   // {'image': 'assets/banner.png', 'name': 'Men','price':'\$2000','discount':'\$2500'},
  //   // {'image': 'assets/banner.png', 'name': 'Women','price':'\$2000','discount':'\$2500'},
  //   // {'image': 'assets/pic3.png', 'name': 'Kids','price':'\$2000','discount':'\$2500'},
  //   {
  //     'image': 'assets/banner.png',
  //     'name': 'Men',
  //     'price': '\$2000',
  //     'discount': '\$2500'
  //   },
  //   {
  //     'image': 'assets/banner.png',
  //     'name': 'Women',
  //     'price': '\$2000',
  //     'discount': '\$2500'
  //   },
  // ];

  @override
  void initState(){
LatestProvider latestProvider = Provider.of<LatestProvider>(context,listen: false);
latestProvider .getLatestProvider();

TopRatedProvider topRatedProvider=Provider.of<TopRatedProvider>(context,listen: false);
topRatedProvider.getRatedProvider();

super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LatestProvider latestProvider = Provider.of<LatestProvider>(context);
    TopRatedProvider topRatedProvider=Provider.of<TopRatedProvider>(context);

    final cart =Provider.of<Cart>(context,listen: false);
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: (() {
                      setState(() {
                        isLatest = true;
                        isSale = false;
                        isRate = false;
                      });
                    }),
                    child: Text(
                      'Latest Product',
                      style: TextStyle(
                          color: isLatest
                              ? appColor().mainColor
                              : appColor().soft_grey_color,fontSize: 15),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isLatest = false;
                        isSale = true;
                        isRate = false;
                      });
                    },
                    child: Text(
                      'On Sale',
                      style: TextStyle(fontSize: 15,
                          color: isSale
                              ? appColor().mainColor
                              : appColor().soft_grey_color),
                    ),
                  ),
                  // SizedBox(
                  //   height: 3,
                  // ),
                  // Container(
                  //   height: 2,
                  //   width: 55,
                  //   color: appColor().mainColor,
                  // )
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isLatest = false;
                        isSale = false;
                        isRate = true;
                      });
                    },
                    child: Text(
                      'Top Rated',
                      style: TextStyle(fontSize: 15,
                          color: isRate
                              ? appColor().mainColor
                              : appColor().soft_grey_color),
                    ),
                  ),
                  // SizedBox(
                  //   height: 3,
                  // ),
                  // Container(
                  //   height: 2,
                  //   width: 70,
                  //   color: appColor().mainColor,
                  // )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 3,
          ),
          Stack(
            children: [
              Container(height: 2, color: appColor().soft_grey_color),
              Container(
                  height: 2,
                  width: 97,
                  color: isLatest
                      ? appColor().mainColor
                      : appColor().soft_grey_color),
              Positioned(
                left: 188,
                child: Container(
                    height: 2,
                    width: 55,
                    color: isSale
                        ? appColor().mainColor
                        : appColor().soft_grey_color),
              ),
              Positioned(
                left: 335,
                child: Container(
                    height: 2,
                    width: 80,
                    color: isRate
                        ? appColor().mainColor
                        : appColor().soft_grey_color),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          GridView.builder(
           // addAutomaticKeepAlives: true,
            itemCount:latestProvider.getLatestlist.length==1?1:latestProvider.getLatestlist.length==2?2:latestProvider.getLatestlist.length==3?3:4,
          //  scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                childAspectRatio: isRate ? 0.7 : 0.8),
            // padding: EdgeInsets.all(8),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              // 3
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                elevation: 10.0,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                            padding: EdgeInsets.all(5),
                            width: double.infinity,
                            //height: (MediaQuery.of(context).size.width - 36) / 3.5,
                            height:
                                (MediaQuery.of(context).size.width - 36) / 3.8,
                            // height: 200,

                            child: ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(10),
                                    bottom: Radius.zero),
                                child:
                                Image(
                                  image:isLatest? NetworkImage('https://bppshops.com/' +
                                      '${latestProvider.getLatestlist[index].productThambnail}'):
                                  isRate?
                                  NetworkImage('https://bppshops.com/' +
                                      '${topRatedProvider.getTopRatedList[index].productThambnail}')
                                      :     NetworkImage('')

                                  //  AssetImage('assets/banner.png'),
                                  ,
                                  fit: BoxFit.fill,
                                  //
                                ),

                                // Image.asset(
                                //   productsList[index]['image'],
                                //   fit: BoxFit.fill,
                                //   width: double.infinity,
                                // )
                            )
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(isLatest?
                              latestProvider.getLatestlist[index].productName.toString():
                            isRate?
                             topRatedProvider.getTopRatedList[index].productName.toString()
                                :"toprated",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 15,
                                  height: 1.2,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                                child: Text(isLatest?
                                  latestProvider.getLatestlist[index].sellingPrice.toString():
                                    isRate?
                                        topRatedProvider.getTopRatedList[index].sellingPrice.toString():"topRated",
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              isRate == true
                                  ? Padding(
                                      padding: EdgeInsets.fromLTRB(8, 0, 8, 3),
                                      child: Text(isLatest?
                                       latestProvider.getLatestlist[index].discountPrice.toString():
                                          isRate?topRatedProvider.getTopRatedList[index].discountPrice.toString():"Topratede",
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontSize: 13,
                                            color: appColor().red_color,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )
                                  : Container()
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              cart.addItem(
                                  latestProvider.getLatestlist[index].id.toString(),
                                  double.tryParse(latestProvider.getLatestlist[index].sellingPrice!)!,
                                  latestProvider.getLatestlist[index].productName,
                                  'https://bppshops.com/${latestProvider.getLatestlist[index].productThambnail}' , 1);

                            },
                            child: Container(
                                width: 88,
                                //height: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: appColor().buttonColor,
                                ),
                              padding: EdgeInsets.only(bottom: 4),
                                child: Center(
                                    child: Text(
                                  'Shop Now',
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.white),
                                ))),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      )
                    ]),
              );
            },
          ),
          SizedBox(
            height: 16,
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => View_More(),
                ));
              },
          child: Text('View All',style: TextStyle(fontSize: 16,color: appColor().mainColor),)),
          Icon(Icons.arrow_forward,color: appColor().mainColor)
        ],)],
      ),
    );
  }}