import 'package:bpp_shop/component/badge.dart';
import 'package:bpp_shop/fashion/widget/sub_catagory.dart';
import 'package:bpp_shop/view/bpp/appBar/appbar.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/bottom_app_bar.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/history_screen/history_screen.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/home_Screen/home_screen.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/profile/profile_screen.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/wish_list/wishlist_screen.dart';
import 'package:bpp_shop/view/bpp/cart/cart_screen.dart';
import 'package:bpp_shop/view/bpp/drawer/bpp_drawer.dart';
import 'package:bpp_shop/view_model/bpp/app_provider.dart';
import 'package:bpp_shop/view_model/bpp/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../../FASHION/MyTheme/app_colors.dart';
import '../../FASHION/Provider/banner_provider.dart';
import '../../FASHION/Provider/brand_provider.dart';
import '../../FASHION/Widget/best_selling.dart';
import '../../FASHION/Widget/flashDeal.dart';
import '../../FASHION/widget/daily_best_sell.dart';
import '../../FASHION/widget/hot_deals.dart';
import '../../FASHION/widget/latest_product.dart';
import '../../FASHION/widget/mostPopular_product.dart';
import '../../FASHION/widget/new_products.dart';
import '../../FASHION/widget/special_deal.dart';
import '../../FASHION/widget/special_offer.dart';
import '../../FASHION/widget/sport_food_bikes.dart';
import '../Api_Service/category_class.dart';
import '../widget/top_categoties.dart';

class FashionHomePage extends StatefulWidget {
  const FashionHomePage({Key? key}) : super(key: key);

  @override
  State<FashionHomePage> createState() => _FashionHomePageState();
}

class _FashionHomePageState extends State<FashionHomePage> {
  List categories = [
    {'image': 'assets/pic1.png', 'name': 'Men'},
    {'image': 'assets/pic2.png', 'name': 'Women'},
    {'image': 'assets/pic3.png', 'name': 'Kids'},
    {'image': 'assets/pic1.png', 'name': 'Men'},
    {'image': 'assets/pic2.png', 'name': 'Women'},
  ];

  // late CategoryList categoryList ;

  //BannerProvider? bannerProvider;
  // BrandProvider? brandProvider;
  //int? brandLength;
  // getbanner() {
  //   setState(() {
  //     final bannerProvider =
  //         Provider.of<BannerProvider>(context, listen: false);
  //     bannerProvider.getBannerProvide();
  //   });
  //   // print('ffffffff${bannerProvider!.bannerList.length }');
  // }

  GlobalKey<ScaffoldState> _bppscafoldKey = GlobalKey();

  @override
  void initState() {
    BannerProvider bannerProvider =
        Provider.of<BannerProvider>(context, listen: false);
    bannerProvider.getBannerProvide();
    BrandProvider brandProvider =
        Provider.of<BrandProvider>(context, listen: false);
    brandProvider.getBrandProvider();
    bannerProvider.bannerList.length;

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BannerProvider bannerProvider = Provider.of<BannerProvider>(context);
    //bannerProvider.getBannerProvide();
    BrandProvider brandProvider = Provider.of<BrandProvider>(context);
    //brandProvider.getBrandProvider();
    final appsData = Provider.of<BppApps>(context);
    final apps = appsData.items;
    return Scaffold(
        key: _bppscafoldKey,
        appBar: bppAppBar(context, apps, _bppscafoldKey),
        drawer: BPPMainPageDrawer(),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Stack(
                      children: [
                        Container(
                          height: 150,
                          child: Image.asset("images/fashion.png",
                          ),
                          // child: bannerProvider.isLoading == true
                          //     ? Center(
                          //         child: SpinKitThreeBounce(
                          //           itemBuilder: ((context, index) {
                          //             return DecoratedBox(
                          //                 decoration: BoxDecoration(
                          //                     borderRadius:
                          //                         BorderRadius.circular(15),
                          //                     color: index.isEven
                          //                         ? Colors.red
                          //                         : Colors.green));
                          //           }),
                          //         ),
                          //       )
                          //     : bannerProvider.bannerList.length != 0
                          //         ? Image(
                          //              image: NetworkImage('https://bppshops.com/' +
                          //                 '${bannerProvider.bannerList[0].bennarImg}')
                          //             //  AssetImage('assets/banner.png'),
                          //             ,
                          //             fit: BoxFit.fill,
                          //             //
                          //           )
                          //         : SizedBox(),
                        ),
                        Positioned(
                            left: 20,
                            top: 17,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [],
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                          height: 60,
                          color: Colors.amber,
                          child: Image.asset("images/smart glasses.jpeg",),
                          // child: bannerProvider.isLoading == true
                          //     ? Center(
                          //         child: CircularProgressIndicator(),
                          //       )
                          //     : bannerProvider.bannerList.length != 0
                          //         ? Image(
                          //              image: NetworkImage('https://bppshops.com/' +
                          //                  '${bannerProvider.bannerList[1].bennarImg}')
                          //             //  AssetImage('assets/banner.png'),
                          //             ,
                          //             fit: BoxFit.fill,
                          //             //
                          //           )
                          //         : SizedBox(),
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        Container(),
                        Expanded(
                          child: Container(
                            height: 60,
                            color: Colors.grey,
                            child: Image.asset("images/blue high hill.jpeg"),
                            // child: bannerProvider.isLoading == true
                            //     ? Center(
                            //         child: CircularProgressIndicator(),
                            //       )
                            //     : bannerProvider.bannerList.length != 0
                            //         ? Image(
                            //              image: NetworkImage(
                            //                 'https://bppshops.com/' +
                            //                     '${bannerProvider.bannerList[2].bennarImg}')
                            //             //  AssetImage('assets/banner.png'),
                            //             ,
                            //             fit: BoxFit.fill,
                            //             //
                            //           )
                            //         : SizedBox(),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Center(
                          child: Text(
                        'Our Product Categories',
                        style: TextStyle(
                            fontSize: 18, color: appColor().mainColor),
                      )),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 120,
                      child: ListView.builder(
                          itemCount: categories.length,
                          shrinkWrap: true,
                          // physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ((context, index) {
                            return Container(
                                padding: EdgeInsets.only(right: 10),
                                // height: 80,
                                // width: 80,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                sub_Categories()));
                                  },
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: AssetImage(
                                            categories[index]['image']),
                                        radius: 40,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        //
                                        width: 60,
                                        padding: EdgeInsets.only(bottom: 4),
                                        decoration: BoxDecoration(
                                            color: appColor().buttonColor,
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                        child: Center(
                                            child: Text(
                                                categories[index]['name'])),
                                      )
                                    ],
                                  ),
                                ));
                          })),
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(5),
                        width: 190,
                        decoration: BoxDecoration(
                            border: Border.all(color: appColor().mainColor)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Container(
                                  padding: EdgeInsets.only(top: 0),
                                  child: Text(
                                    'All Catrgories ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: appColor().mainColor),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: Icon(Icons.arrow_forward,
                                  size: 18, color: appColor().mainColor),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Stack(
                      children: [
                        Container(
                          height: 130,
                          child: Image.asset("images/Component 3.jpg"),
                          // child: bannerProvider.isLoading == true
                          //     ? Center(
                          //         child: CircularProgressIndicator(),
                          //       )
                          //     : bannerProvider.bannerList.length != 0
                          //         ? Image(
                          //             image: NetworkImage('https://bppshops.com/' +
                          //                 '${bannerProvider.bannerList[3].bennarImg}')
                          //             //  AssetImage('assets/banner.png'),
                          //             ,
                          //             fit: BoxFit.fill,
                          //             //
                          //           )
                          //         : SizedBox(),
                        ),
                        // Positioned(
                        //     left: 20,
                        //     top: 17,
                        //     child: Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       mainAxisAlignment: MainAxisAlignment.start,
                        //       children: [
                        //         Text(
                        //           'Smart Watch ',
                        //           style: TextStyle(
                        //               color: appColor().yellow_color,
                        //               fontWeight: FontWeight.w600,
                        //               fontSize: 15),
                        //         ),
                        //         SizedBox(
                        //           height: 1,
                        //         ),
                        //         Text(
                        //           'SPECIAL OFFER',
                        //           style: TextStyle(
                        //               letterSpacing: 2,
                        //               color: Colors.white,
                        //               fontWeight: FontWeight.w600,
                        //               fontSize: 14),
                        //         ),
                        //         SizedBox(
                        //           height: 1,
                        //         ),
                        //         SizedBox(
                        //           height: 15,
                        //         ),
                        //         GestureDetector(
                        //           onTap: () {},
                        //           child: Container(
                        //               width: 88,
                        //               height: 25,
                        //               decoration: BoxDecoration(
                        //                 borderRadius: BorderRadius.circular(5),
                        //                 color: appColor().buttonColor,
                        //               ),
                        //               padding: EdgeInsets.all(6),
                        //               child: Center(
                        //                   child: Text(
                        //                 'Shop Now',
                        //                 style: TextStyle(
                        //                     fontSize: 13, color: Colors.white),
                        //               ))),
                        //         ),
                        //       ],
                        //     ))
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          'Our Brands',
                          style: TextStyle(
                            fontSize: 18,
                            color: appColor().mainColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    brandProvider.isLoading == true
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Container(
                            height: 118,
                            child: ListView.builder(
                                itemCount:
                                    brandProvider.brandList.length != null
                                        ? brandProvider.brandList.length
                                        : 5,
                                shrinkWrap: true,
                                // physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: ((context, index) {
                                  print(
                                      'Brand List Length ${brandProvider.brandList.length}');
                                  return Container(
                                      //  padding: EdgeInsets.only(right: 10),
                                      // height: 80,
                                      // width: 80,
                                      height: 100,
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 100,
                                            child: Card(
                                              elevation: 10,
                                              shadowColor: Colors.white54,
                                              //   color: Colors.amber,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: Image(
                                                    image: NetworkImage(
                                                        ('https://bppshops.com/' +
                                                            '${brandProvider.brandList[index].brandImage}'))
                                                    //AssetImage('assets/banner.png'),
                                                    ,
                                                    fit: BoxFit.fill,
                                                    height: 100,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          //   Expanded(
                                          //       child: Text(brandProvider
                                          //           .brandList[index]
                                          //           .brandNameCatsEye
                                          //           .toString()))
                                        ],
                                      ));
                                })),
                          ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(5),
                        width: 190,
                        decoration: BoxDecoration(
                            border: Border.all(color: appColor().mainColor)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Container(
                                  padding: EdgeInsets.only(top: 0),
                                  child: Text(
                                    'Brands ',// text
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: appColor().mainColor),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: Icon(Icons.arrow_forward,
                                  size: 18, color: appColor().mainColor),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    HotDeals(),
                    SizedBox(
                      height: 20,
                    ),
                    LatestProduct(),
                    SizedBox(
                      height: 20,
                    ),
                    MostPopularProduct(),
                    SizedBox(
                      height: 20,
                    ),
                    Sports_food_bikes(),
                    SizedBox(
                      height: 20,
                    ),
                    DailyBestSelling(),
                    SizedBox(
                      height: 20,
                    ),
                    TopCatagories(),
                    SizedBox(
                      height: 20,
                    ),
                    DailyBestSelling(),
                    SizedBox(
                      height: 20,
                    ),
                    NewProducts(),
                    SizedBox(
                      height: 20,//Sized Box
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Special_Offer(), SpecialDeals()],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FlashDeal(),
                    SizedBox(
                      height: 180,
                    )
                  ]))),
        ),
        floatingActionButton: Consumer<Cart>(
          builder: (_, cart, ch) => Badge(
            value: cart.itemCount.toString(),
            child: ch!,
            // ch,,
            color: Colors.amber,
          ),
          child: FloatingActionButton(
            backgroundColor: Theme.of(context).colorScheme.primary,
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => CartScreen()));
            },
            child: Icon(
              Icons.shopping_bag_sharp,
              color: Colors.white,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 6,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BottomNavBar(
                                        currentTab: 0,
                                        currentScreen: HomeScreen(),
                                      )),
                              (route) => false);
                          //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottom_NavBar(currentTab: 0,currentScreen: Home_Page(),)));
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.home,
                            color: Colors
                                .amber, //currentTab == 0 ? Colors.amber,//: Colors.grey,
                          ),
                          Text(
                            'Home',
                            style: TextStyle(
                              color: Colors
                                  .amber, //currentTab == 0 ? Colors.amber : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BottomNavBar(
                                        currentTab: 1,
                                        currentScreen: MyWishList(),
                                      )),
                              (route) => false);
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.favorite_border_outlined,
                            color: Colors
                                .grey, //currentTab == 1 ? Colors.amber : Colors.grey,
                          ),
                          Text(
                            'Favorite',
                            style: TextStyle(
                              color: Colors
                                  .grey, //,currentTab == 1 ? Colors.amber: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),

                // Right Tab bar icons

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BottomNavBar(
                                        currentTab: 2,
                                        currentScreen: HistoryScreen(),
                                      )),
                              (route) => false);
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.dashboard_outlined,
                            color: Colors
                                .grey, //currentTab == 2 ? Colors.amber: Colors.grey,
                          ),
                          Text(
                            'History',
                            style: TextStyle(
                              color: Colors
                                  .grey, //,currentTab == 2 ? Colors.amber : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BottomNavBar(
                                        currentTab: 3,
                                        currentScreen: ProfileScreen(),
                                      )),
                              (route) => false);
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.account_circle,
                            color: Colors
                                .grey, //currentTab == 3 ? Colors.amber : Colors.grey,
                          ),
                          Text(
                            'Profile',
                            style: TextStyle(
                              color: Colors
                                  .grey, //currentTab == 3 ? Colors.amber: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
