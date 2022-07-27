// import 'package:bpp_shop/FASHION/widget/mostPopular_product.dart';
// import 'package:bpp_shop/fashion/view/home_page/component/best_selling_product.dart';
// import 'package:bpp_shop/fashion/widget/top_categoties.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../../FASHION/MyTheme/app_colors.dart';
// import '../../../FASHION/Provider/banner_provider.dart';
// import '../../../component/badge.dart';
// import '../../../component/cart.dart';
// import '../../../models/islamic/special_offers.dart';
// import '../../FASHION/Provider/brand_provider.dart';
// import '../../view/bpp/bottomAppBar/home_Screen/home_screen.dart';
// import '../../view/bpp/cart/cart_screen.dart';
// import '../../view/islamic/Home_Screen/home_page.dart';
// import '../../view_model/bpp/app_provider.dart';
// import '../widget/daily_best_sell.dart';
// import '../widget/hot_deals.dart';
// import '../widget/latest_product.dart';
// import '../widget/new_products.dart';
// import '../widget/special_deal.dart';
// import '../widget/special_offer.dart';
// import '../widget/sport_food_bikes.dart';
//
// class FashionHomePage extends StatefulWidget {
//   const FashionHomePage({Key? key}) : super(key: key);
//
//   @override
//   State<FashionHomePage> createState() => _FashionHomePageState();
// }
//
// class _FashionHomePageState extends State<FashionHomePage> {
//   List categories = [
//     {'image': 'assets/pic1.png', 'name': 'Men'},
//     {'image': 'assets/pic2.png', 'name': 'Women'},
//     {'image': 'assets/pic3.png', 'name': 'Kids'},
//     {'image': 'assets/pic1.png', 'name': 'Men'},
//     {'image': 'assets/pic2.png', 'name': 'Women'},
//   ];
//
//   //BannerProvider? bannerProvider;
//   // BrandProvider? brandProvider;
//   //int? brandLength;
//
//   @override
//   void initState() {
//     //final brandProvider = Provider.of<BrandProvider>(context, listen: false);
//     //brandProvider.getBrandProvider(context);
//     //final bannerProvider =
//     //Provider.of<BannerProvider>(context, listen: false);
//     // bannerProvider = Provider.of<BannerProvider>(context, listen: false);
//     //bannerProvider.getBannerProvide(context);
//
//     // TODO: implement initState
//     super.initState();
//   }
//
//   GlobalKey<ScaffoldState> _bppscafoldKey = GlobalKey();
//
//   @override
//   Widget build(BuildContext context) {
//     final bannerProvider = Provider.of<BannerProvider>(context);
//     bannerProvider.getBannerProvide();
//     final brandProvider = Provider.of<BrandProvider>(context);
//     brandProvider.getBrandProvider();
//     final appsData = Provider.of<BppApps>(context);
//     final apps = appsData.items;
//     return Scaffold(
//         key: _bppscafoldKey,
//         //appBar: bppAppBar(context, apps, _bppscafoldKey),
//         //drawer: BPPMainPageDrawer(),
//         body: SingleChildScrollView(
//           child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//               child: Container(
//                   child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                     Stack(
//                       children: [
//                         Container(
//                           height: 130,
//                           child: bannerProvider.isLoading == true
//                               ? Center(
//                                   child: CircularProgressIndicator(),
//                                 )
//                               : bannerProvider.bannerList.length != 0
//                                   ? Image(
//                                       image: NetworkImage('https://bppshops.com/' +
//                                           '${bannerProvider.bannerList[0].bennarImg}')
//                                       //  AssetImage('assets/banner.png'),
//                                       ,
//                                       fit: BoxFit.fill,
//                                       //
//                                     )
//                                   : SizedBox(),
//                         ),
//                         Positioned(
//                             left: 20,
//                             top: 17,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'All Products',
//                                   style: TextStyle(
//                                       color: appColor().yellow_color,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 15),
//                                 ),
//                                 SizedBox(
//                                   height: 1,
//                                 ),
//                                 Text(
//                                   'MEGASTORE',
//                                   style: TextStyle(
//                                       color: appColor().red_color,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 14),
//                                 ),
//                                 SizedBox(
//                                   height: 1,
//                                 ),
//                                 Text(
//                                   'save Up to 20% off',
//                                   style: TextStyle(
//                                       color: appColor().black_color,
//                                       // fontWeight: FontWeight.w500,
//                                       fontSize: 14),
//                                 ),
//                                 SizedBox(
//                                   height: 15,
//                                 ),
//                                 GestureDetector(
//                                   onTap: () {},
//                                   child: Container(
//                                       width: 88,
//                                       // height: 30,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(5),
//                                         color: appColor().buttonColor,
//                                       ),
//                                       padding: EdgeInsets.only(bottom: 4),
//                                       child: Center(
//                                         child: Text(
//                                           'Shop Now',
//                                           style: TextStyle(
//                                               fontSize: 13,
//                                               color: Colors.white),
//                                         ),
//                                       )),
//                                 ),
//                               ],
//                             ))
//                       ],
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       children: [
//                         Expanded(
//                             child: Container(
//                           height: 60,
//                           color: Colors.amber,
//                           child: bannerProvider.isLoading == true
//                               ? Center(
//                                   child: CircularProgressIndicator(),
//                                 )
//                               : bannerProvider.bannerList.length != 0
//                                   ? Image(
//                                       image: NetworkImage('https://bppshops.com/' +
//                                           '${bannerProvider.bannerList[1].bennarImg}')
//                                       //  AssetImage('assets/banner.png'),
//                                       ,
//                                       fit: BoxFit.fill,
//                                       //
//                                     )
//                                   : SizedBox(),
//                         )),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Container(),
//                         Expanded(
//                           child: Container(
//                             height: 60,
//                             color: Colors.amber,
//                             child: bannerProvider.isLoading == true
//                                 ? Center(
//                                     child: CircularProgressIndicator(),
//                                   )
//                                 : bannerProvider.bannerList.length != 0
//                                     ? Image(
//                                         image: NetworkImage(
//                                             'https://bppshops.com/' +
//                                                 '${bannerProvider.bannerList[2].bennarImg}')
//                                         //  AssetImage('assets/banner.png'),
//                                         ,
//                                         fit: BoxFit.fill,
//                                         //
//                                       )
//                                     : SizedBox(),
//                           ),
//                         )
//                       ],
//                     ),
//
//                     SizedBox(
//                       height: 15,
//                     ),
//                     Container(
//                       child: Center(
//                           child: Text(
//                         'Our Product Categories',
//                         style: TextStyle(
//                             fontSize: 18, color: appColor().mainColor),
//                       )),
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     Container(
//                       height: 120,
//                       child: ListView.builder(
//                           itemCount: categories.length,
//                           shrinkWrap: true,
//                           // physics: NeverScrollableScrollPhysics(),
//                           scrollDirection: Axis.horizontal,
//                           itemBuilder: ((context, index) {
//                             return Container(
//                                 padding: EdgeInsets.only(right: 10),
//                                 // height: 80,
//                                 // width: 80,
//                                 child: Column(
//                                   children: [
//                                     CircleAvatar(
//                                       backgroundImage: AssetImage(
//                                           categories[index]['image']),
//                                       radius: 40,
//                                     ),
//                                     SizedBox(
//                                       height: 5,
//                                     ),
//                                     Container(
//                                       //
//                                       width: 60,
//                                       padding: EdgeInsets.only(bottom: 4),
//                                       decoration: BoxDecoration(
//                                           color: appColor().buttonColor,
//                                           borderRadius:
//                                               BorderRadius.circular(3)),
//                                       child: Center(
//                                           child:
//                                               Text(categories[index]['name'])),
//                                     )
//                                   ],
//                                 ));
//                           })),
//                     ),
//                     Center(
//                       child: Container(
//                         padding: EdgeInsets.all(5),
//                         margin: EdgeInsets.all(5),
//                         width: 190,
//                         decoration: BoxDecoration(
//                             border: Border.all(color: appColor().mainColor)),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Center(
//                               child: Container(
//                                   padding: EdgeInsets.only(top: 0),
//                                   child: Text(
//                                     'All Catrgories ',
//                                     style: TextStyle(
//                                         fontSize: 18,
//                                         color: appColor().mainColor),
//                                   )),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(top: 0),
//                               child: Icon(Icons.arrow_forward,
//                                   size: 18, color: appColor().mainColor),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Stack(
//                       children: [
//                         Container(
//                           height: 130,
//                           child: bannerProvider.isLoading == true
//                               ? Center(
//                                   child: CircularProgressIndicator(),
//                                 )
//                               : bannerProvider.bannerList.length != 0
//                                   ? Image(
//                                       image: NetworkImage('https://bppshops.com/' +
//                                           '${bannerProvider.bannerList[3].bennarImg}')
//                                       //  AssetImage('assets/banner.png'),
//                                       ,
//                                       fit: BoxFit.fill,
//                                       //
//                                     )
//                                   : SizedBox(),
//                         ),
//                         Positioned(
//                             left: 20,
//                             top: 17,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'Smart Watch ',
//                                   style: TextStyle(
//                                       color: appColor().yellow_color,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 15),
//                                 ),
//                                 SizedBox(
//                                   height: 1,
//                                 ),
//                                 Text(
//                                   'SPECIAL OFFER',
//                                   style: TextStyle(
//                                       letterSpacing: 2,
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 14),
//                                 ),
//                                 SizedBox(
//                                   height: 1,
//                                 ),
//                                 SizedBox(
//                                   height: 15,
//                                 ),
//                                 GestureDetector(
//                                   onTap: () {},
//                                   child: Container(
//                                       width: 88,
//                                       height: 25,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(5),
//                                         color: appColor().buttonColor,
//                                       ),
//                                       padding: EdgeInsets.all(6),
//                                       child: Center(
//                                           child: Text(
//                                         'Shop Now',
//                                         style: TextStyle(
//                                             fontSize: 13, color: Colors.white),
//                                       ))),
//                                 ),
//                               ],
//                             ))
//                       ],
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     Container(
//                       child: Center(
//                           child: Text(
//                         'Our Brands',
//                         style: TextStyle(
//                             fontSize: 18, color: appColor().mainColor),
//                       )),
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     brandProvider.isLoading == true ? Center(
//                       child: CircularProgressIndicator(),
//                     )
//                         : Container(
//                       height: 118,
//                       child: ListView.builder(
//                         //  itemCount: brandProvider.brandList.length != null ? brandProvider.brandList.length : 5,
//                           shrinkWrap: true,
//                           // physics: NeverScrollableScrollPhysics(),
//                           scrollDirection: Axis.horizontal,
//                           itemBuilder: ((context, index) {
//                             // print(
//                             //     'Brand List Length ${brandProvider.brandList.length}');
//                             return Container(
//                               //  padding: EdgeInsets.only(right: 10),
//                               // height: 80,
//                               // width: 80,
//                                 height: 100,
//                                 child: Column(
//                                   children: [
//                                     Container(
//                                       width: 100,
//                                       child: Card(
//                                         elevation: 10,
//                                         shadowColor: Colors.white54,
//                                         //   color: Colors.amber,
//                                         child: ClipRRect(
//                                           borderRadius:
//                                           BorderRadius.circular(
//                                               10),
//                                           child: Padding(
//                                             padding:
//                                             const EdgeInsets
//                                                 .all(2.0),
//                                             child: Image(
//                                               image: NetworkImage(
//                                                   ('https://bppshops.com/' +
//                                                       '${brandProvider.brandList[index].brandImage}')),
//                                               //AssetImage('assets/banner.png'),
//
//                                               fit: BoxFit.fill,
//                                               height: 100,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 5,
//                                     ),
//                                       Expanded(
//                                           child: Text(brandProvider
//                                               .brandList[index]
//                                               .brandNameCatsEye
//                                               .toString()))
//                                   ],
//                                 ));
//                           })),
//                     ),
//                     Center(
//                       child: Container(
//                         padding: EdgeInsets.all(5),
//                         margin: EdgeInsets.all(5),
//                         width: 190,
//                         decoration: BoxDecoration(
//                             border: Border.all(color: appColor().mainColor)),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Center(
//                               child: Container(
//                                   padding: EdgeInsets.only(top: 0),
//                                   child: Text(
//                                     'Brands ',
//                                     style: TextStyle(
//                                         fontSize: 18,
//                                         color: appColor().mainColor),
//                                   )),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(top: 0),
//                               child: Icon(Icons.arrow_forward,
//                                   size: 18, color: appColor().mainColor),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                       HotDeals(),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     LatestProduct(),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     MostPopularProduct(),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Sports_food_bikes(),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     BestSellingProduct(),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     TopCatagories(),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     DailyBestSelling(),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     NewProducts(),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[Special_Offer(), SpecialDeals()],
//                     )
//                   ]))),
//         ),
//     );
//   }
// }
