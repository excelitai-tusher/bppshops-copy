// import 'dart:io';
//
// import 'package:bpp_shop/fashion/view/home_page/component/app_color.dart';
// import 'package:bpp_shop/islamic/provider/constants/colors.dart';
// import 'package:bpp_shop/view/bpp/bottomAppBar/bottom_app_bar.dart';
// import 'package:bpp_shop/view/bpp/bottomAppBar/history_screen/history_screen.dart';
// import 'package:bpp_shop/view/bpp/bottomAppBar/home_screen.dart';
// import 'package:bpp_shop/view/bpp/bottomAppBar/profile/profile_screen.dart';
// import 'package:bpp_shop/view/bpp/cart/cart_screen.dart';
// import 'package:bpp_shop/view/bpp/drawer/bpp_drawer.dart';
// import 'package:bpp_shop/view_model/bpp/app_provider.dart';
// import 'package:bpp_shop/islamic/component/badge.dart';
// import 'package:bpp_shop/fashion/controller/app_bar_controler.dart';
// import 'package:bpp_shop/fashion/controller/peimary_page_controller.dart';
// import 'package:bpp_shop/fashion/controller/product_detail_controller.dart';
// import 'package:bpp_shop/fashion/controller/secondary_page_controller.dart';
// import 'package:bpp_shop/fashion/view/cart_page/cart_page.dart';
// import 'package:bpp_shop/fashion/view/drawer_page/drawer_page.dart';
// import 'package:bpp_shop/fashion/view/filter_page/filter_page.dart';
// import 'package:bpp_shop/fashion/view/home_page/component/body.dart';
// import 'package:bpp_shop/fashion/view/home_page/component/search_bar.dart';
// import 'package:bpp_shop/fashion/view/product_details/product_detail_page.dart';
// import 'package:bpp_shop/fashion/view/profile_page/profile_page.dart';
// import 'package:bpp_shop/fashion/view/profile_page/sub_pages/edit_address/edit_address_page.dart';
// import 'package:bpp_shop/fashion/view/profile_page/sub_pages/help_page/help_page.dart';
// import 'package:bpp_shop/fashion/view/profile_page/sub_pages/my_order/my_ordar_page.dart';
// import 'package:bpp_shop/fashion/view/profile_page/sub_pages/order_status_page.dart';
// import 'package:bpp_shop/fashion/view/profile_page/sub_pages/payment_method_page/payment_methods_page.dart';
// import 'package:bpp_shop/fashion/view/profile_page/sub_pages/shipping_address_page/shipping_address_pages.dart';
// import 'package:bpp_shop/fashion/view/sub_category_item/sub_category_item_page.dart';
// import 'package:bpp_shop/fashion/view/sub_sub_categories_page/sub_sub_categories_page.dart';
// import 'package:bpp_shop/fashion/view/top_categories_page/top_categories_page.dart';
// import 'package:bpp_shop/fashion/view/wishList_page/wishlist_page.dart';
// import 'package:bpp_shop/fashion/view/women_categori_Page/woman_categories_body.dart';
// import 'package:bpp_shop/bpp/provider/cart_provider.dart';
//
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';
//
// import '../../../view/bpp/bottomAppBar/wishlist_screen.dart';
// import '../home_page copy.dart';
//
// var scaffoldKey = GlobalKey<ScaffoldState>();
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   GlobalKey<ScaffoldState> _bppScaffoldKey = GlobalKey();
//   final CarouselController? _carouselSlider = CarouselController();
//   //final appBar=Provider.of<AppBarController>(context);
//   int currentIndex = 0;
//   //var productDetail=false;
//   PrimaryScreenState appBar = PrimaryScreenState();
//   @override
//   void initState() {
//     // TODO: implement initState
//     appBar.setPrimaryState(true);
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     appBar.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final appsData = Provider.of<BppApps>(context);
//
//     final apps = appsData.items;
//     final productAppBar = Provider.of<PrimaryScreenState>(context);
//     final primaryPageState = Provider.of<PrimaryPageController>(context);
//     return WillPopScope(
//       onWillPop: () async{
//         final status = Provider.of<PrimaryScreenState>(context, listen: false);
//
//         final pageState = Provider.of<SecondaryPage>(context, listen: false);
//         //pageState.setSecondaryPage(5);
//         if (productAppBar.status){
//           if (Platform.isAndroid){
//             SystemNavigator.pop();
//           }else if (Platform.isIOS){
//             exit(0);
//           }
//         }
//         if (pageState.secondaryPageNo == 6){
//           status.setPrimaryState(false);
//           pageState.setSecondaryPage(5);
//         }else{
//           productAppBar.setPrimaryState(true);
//           final selection = Provider.of<ProductDetailController>(context, listen: false);
//           selection.sizeSelected(0);
//           selection.colorSelected(0);
//         }
//         return false;
//       },
//       child: Scaffold(
//         key: _bppScaffoldKey,
//         appBar: AppBar(
//           elevation: 0,
//           backgroundColor: Color(0xFFE37D4E),
//           leading: IconButton(
//             onPressed: () {
//               _bppScaffoldKey.currentState!.openDrawer();
//             },
//             icon: Icon(
//               Icons.menu,
//               color: Colors.white,
//             ),
//           ),
//           centerTitle: true,
//           title: TextButton(
//             onPressed: (){
//               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BottomNavBar(currentTab: 0,currentScreen: HomeScreen(),),));
//             },
//             child: Text(
//               "BPP Shop",
//               style: TextStyle(color: Colors.white,fontSize: 18),
//             ),
//           ),
//           actions: [
//             IconButton(
//               onPressed: () {
//                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfileScreen()));
//               },
//               icon: Icon(
//                 Icons.person,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//           bottom: PreferredSize(
//             preferredSize: Size(MediaQuery.of(context).size.width, 50),
//             child: Container(
//               height: 50,
//               color: Color(0xffF3D0B7),
//               child: CarouselSlider.builder(
//
//                   itemCount: apps.length,
//                   options: CarouselOptions(
//
//                       viewportFraction:.4,
// //disableCenter: true,
// //enableInfiniteScroll: true,
//                       // enlargeCenterPage: true,
//                       reverse: false,
//                       autoPlay: true,
//                       autoPlayAnimationDuration: Duration(
//                         milliseconds: 2000,
//                       ),
//                       height: MediaQuery.of(context).size.height
//                   ),
//                   carouselController: _carouselSlider,
//                   itemBuilder:
//                       (BuildContext context, int itemIndex, int pageViewIndex) {
//                     apps[itemIndex];
//                     return GestureDetector(
//                       onTap: apps[itemIndex].subApps!= null?
//                           (){
//                         Navigator.of(context).push(MaterialPageRoute(builder:(context)=> apps[itemIndex].subApps!));
//
//                       } :null,
//                       child: Container(
//                         margin: EdgeInsets.symmetric(vertical: 6),
//                         height: 30,
//                         width: 140,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Container(
//                               margin: EdgeInsets.symmetric(horizontal: 15),
//                               height: 25,
//                               width: 25,
//                               child: Image.asset('${apps[itemIndex].icon}',fit: BoxFit.cover,),
//                               // decoration: BoxDecoration(
//                               //   color: Colors.red,
//                               //   borderRadius: BorderRadius.circular(6),
//                               // ),
//                             ),
//                             Flexible(
//                               child: Container(
//                                 width:90,
//                                 child: Text(
//                                   '${apps[itemIndex].title}',
//                                   overflow: TextOverflow.ellipsis,
//                                   style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.indigo),
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     );
//                   }),
//             ),
//           ),
//         ),
//         drawer: BPPMainPageDrawer(),
//
//         body: Scaffold(
//           key: scaffoldKey,
//           appBar: productAppBar.status
//               ? AppBar(
//                  // backgroundColor: Color(0xffFFA800),
//                  backgroundColor: appColor().mainColor,
//                   leading: IconButton(
//                     onPressed: () {
//                       // Scaffold.of(context).openDrawer();
//                       scaffoldKey.currentState?.openDrawer();
//                     },
//                     icon: Icon(Icons.menu_open),
//                   ),
//                   title: Center(
//                     child: Text("Fashion"),
//                   ),
//                   actions: [
//                     IconButton(
//                       onPressed: () {
//                         showSearch(context: context, delegate: Search());
//                       },
//                       icon: Icon(
//                         Icons.search,
//                       ),
//                     ),
//                   ],
//                 )
//               : null,
//           drawer: ComplexDrawer(),
//           body: productAppBar.status
//               ? _getBodyPrimary()
//               : _getBodySecondary(), //ProductDetail(),
//
//             floatingActionButton: Consumer<Cart>(
//               builder: (_, cart, ch) => Badge(
//                 value: cart.itemCount.toString(),
//                 child: ch,
//               ),
//               child: FloatingActionButton(backgroundColor: appColor().mainColor,
//                // backgroundColor: Theme.of(context).colorScheme.primary,
//                 onPressed: () {
//                   Navigator.of(context).push(
//                       MaterialPageRoute(builder: (context) => CartScreen()));
//                 },
//                 child: Icon(
//                   Icons.shopping_bag_sharp,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             floatingActionButtonLocation:
//             FloatingActionButtonLocation.centerDocked,
//             bottomNavigationBar: BottomAppBar(
//               shape: CircularNotchedRectangle(),
//               notchMargin: 6,
//               child: Container(
//                 height: 60,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         MaterialButton(
//                           minWidth: 40,
//                           onPressed: () {
//                             setState(() {
//                               // currentScreen =
//                               //     Home_Page(); // if user taps on this dashboard tab will be active
//                               // currentTab = 0;
//                               Navigator.pushAndRemoveUntil(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => BottomNavBar(
//                                         currentTab: 0,
//                                         currentScreen: HomeScreen(),
//                                       )),
//                                       (route) => false);
//                               //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottom_NavBar(currentTab: 0,currentScreen: Home_Page(),)));
//                             });
//                           },
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: <Widget>[
//                               Icon(
//                                 Icons.home,
//                                 color: appColor().mainColor //currentTab == 0 ? Colors.amber,//: Colors.grey,
//                               ),
//                               Text(
//                                 'Home',
//                                 style: TextStyle(
//                                   color:  appColor().mainColor, //currentTab == 0 ? Colors.amber : Colors.grey,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         // Home_Page(),
//                         // MyWishList(),
//                         // HistoryTabbar(),
//                         // ProfileScreen(),
//                         // PopularProduct(),
//                         MaterialButton(
//                           minWidth: 40,
//                           onPressed: () {
//                             setState(() {
//                               Navigator.pushAndRemoveUntil(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => BottomNavBar(
//                                         currentTab: 1,
//                                         currentScreen: MyWishList(),//WishListScreen(),
//                                       )),
//                                       (route) => false);
//                               // Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottom_NavBar(currentTab: 1,currentScreen: MyWishList(),)));
//                               // currentScreen =
//                               //     MyWishList(); // if user taps on this dashboard tab will be active
//                               // currentTab = 1;
//                             });
//                           },
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: <Widget>[
//                               Icon(
//                                 Icons.favorite_border_outlined,
//                                 color: Colors
//                                     .grey, //currentTab == 1 ? Colors.amber : Colors.grey,
//                               ),
//                               Text(
//                                 'Favorite',
//                                 style: TextStyle(
//                                   color: Colors
//                                       .grey, //,currentTab == 1 ? Colors.amber: Colors.grey,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//
//                     // Right Tab bar icons
//
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         MaterialButton(
//                           minWidth: 40,
//                           onPressed: () {
//                             setState(() {
//                               Navigator.pushAndRemoveUntil(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => BottomNavBar(
//                                         currentTab: 2,
//                                         currentScreen: HistoryScreen(),
//                                       )),
//                                       (route) => false);
//                               //Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottom_NavBar(currentTab: 2,currentScreen: HistoryTabbar(),)));
//                               // currentScreen =
//                               //     HistoryTabbar(); // if user taps on this dashboard tab will be active
//                               // currentTab = 2;
//                             });
//                           },
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: <Widget>[
//                               Icon(
//                                 Icons.dashboard_outlined,
//                                 color: Colors
//                                     .grey, //currentTab == 2 ? Colors.amber: Colors.grey,
//                               ),
//                               Text(
//                                 'History',
//                                 style: TextStyle(
//                                   color: Colors
//                                       .grey, //,currentTab == 2 ? Colors.amber : Colors.grey,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         MaterialButton(
//                           minWidth: 40,
//                           onPressed: () {
//                             setState(() {
//                               Navigator.pushAndRemoveUntil(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => BottomNavBar(
//                                         currentTab: 3,
//                                         currentScreen: ProfileScreen(),
//                                       )),
//                                       (route) => false);
//                               //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottom_NavBar(currentTab: 3,currentScreen: ProfileScreen(),)));
//                               // currentScreen =
//                               //     ProfileScreen(); // if user taps on this dashboard tab will be active
//                               // currentTab = 3;
//                             });
//                           },
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: <Widget>[
//                               Icon(
//                                 Icons.account_circle,
//                                 color: Colors
//                                     .grey, //currentTab == 3 ? Colors.amber : Colors.grey,
//                               ),
//                               Text(
//                                 'Profile',
//                                 style: TextStyle(
//                                   color: Colors
//                                       .grey, //currentTab == 3 ? Colors.amber: Colors.grey,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             )
//           // bottomNavigationBar: BottomAppBar(
//           //   shape: CircularNotchedRectangle(),
//           //   child: Row(
//           //     mainAxisSize: MainAxisSize.max,
//           //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           //     children: [
//           //       ...MainHomePageBottomAppBarModel.list
//           //           .map((MainHomePageBottomAppBarModel data) {
//           //         return data.isBlank
//           //             ? SizedBox(
//           //                 width: 10,
//           //               )
//           //             : GestureDetector(
//           //                 onTap: () {
//           //                   //final primaryPageState = Provider.of<PrimaryPageController>(context);
//           //                   primaryPageState.setPrimaryPage(data.index);
//           //                   productAppBar.setPrimaryState(true);
//           //                   print(data.index.toString());
//           //                 },
//           //                 child: Padding(
//           //                   padding: const EdgeInsets.symmetric(
//           //                     horizontal: 8,
//           //                     vertical: 8,
//           //                   ),
//           //                   child: Column(
//           //                     mainAxisSize: MainAxisSize.min,
//           //                     children: [
//           //                       // SizedBox(
//           //                       //   height: 5,
//           //                       // ),
//           //                       buildCustomConsumer(
//           //                         context,
//           //                         data.label!,
//           //                         data.icon!,
//           //                         data.index,
//           //                       ),
//           //                       // SizedBox(
//           //                       //   height: 12,
//           //                       // ),
//           //                       FittedBox(
//           //                         fit: BoxFit.scaleDown,
//           //                         child: Text(
//           //                           data.label!,
//           //                           style: Theme.of(context)
//           //                               .textTheme
//           //                               .bodyText1!
//           //                               .copyWith(
//           //                                 color: primaryPageState.currentIndex ==
//           //                                         data.index //currentIndex == data.index
//           //                                     ? Color(0xffFF6000)
//           //                                     : Colors.grey,
//           //                               ),
//           //                         ),
//           //                       )
//           //                     ],
//           //                   ),
//           //                 ),
//           //               );
//           //       })
//           //     ],
//           //   ),
//           // ),
//         ),
//       ),
//     );
//   }
//
//   // Widget buildCustomConsumer(
//   //     BuildContext context, String label, IconData icon, int index) {
//   //   final size = MediaQuery.of(context).size;
//   //   final primaryPageState = Provider.of<PrimaryPageController>(context);
//   //   if (label == "Wishlist") {
//   //     return Consumer<WishlistModel>(
//   //       builder: (_, wishList, ch) {
//   //         return Badge(
//   //           child: ch!,
//   //           value: wishList.itemCount.toString(),
//   //           color: Colors.red,
//   //         );
//   //       },
//   //       child: Container(
//   //         width: size.width * .1, //50,
//   //         child: Icon(
//   //           icon,
//   //           color: primaryPageState.currentIndex ==
//   //                   index //currentIndex == data.index
//   //               ? Color(0xffFF6000)
//   //               : Colors.grey,
//   //         ),
//   //       ),
//   //     );
//   //   }
//   //   if (label == "Cart") {
//   //     return Consumer<CartModel>(
//   //       builder: (_, cart, ch) {
//   //         return Badge(
//   //           child: ch!,
//   //           value: cart.itemCount.toString(),
//   //           color: Colors.red,
//   //         );
//   //       },
//   //       child: Container(
//   //         width: size.width * .1,
//   //         child: Icon(
//   //           icon,
//   //           color: primaryPageState.currentIndex ==
//   //                   index //currentIndex == data.index
//   //               ? Color(0xffFF6000)
//   //               : Colors.grey,
//   //         ),
//   //       ),
//   //     );
//   //   } else {
//   //     return Icon(
//   //       icon,
//   //       color:
//   //           primaryPageState.currentIndex == index //currentIndex == data.index
//   //               ? Color(0xffFF6000)
//   //               : Colors.grey,
//   //     );
//   //   }
//   // }
//
//   _getBodyPrimary() {
//     final primaryPageState = Provider.of<PrimaryPageController>(context);
//     switch (primaryPageState.currentIndex) {
//       case 0:
//         return FashionHomePage();
//       case 1:
//         return Wishlist(); //TopCategoriesPage();//ProductDetail();//Wishlist();
//       case 2:
//         return CartList();
//       case 3:
//         return Profile();
//       default:
//         return FashionHomePage();
//     }
//   }
//
//   _getBodySecondary() {
//     final page = Provider.of<SecondaryPage>(context);
//
//     switch (page.secondaryPageNo) {
//       case 1:
//         return TopCategoriesPage();
//       case 2:
//         return ProductDetail(); //Wishlist();
//       case 3:
//         return CategoryScreen();
//       case 4:
//         return SubCatScreen(); //FilterScreen
//       case 5:
//         return SubSubProductScreen();
//       case 6:
//         return FilterScreen(); //OrderStatus
//       case 7:
//         return OrderStatus(); //MyOrder
//       case 8:
//         return MyOrder(); //EditAddress
//       case 9:
//         return EditAddress(); //ShippingAddress
//       case 10:
//         return ShippingAddress(); //PaymentMethod
//       case 11:
//         return PaymentMethod(); //HelpPage
//       case 12:
//         return HelpPage();
//       default:
//         return ProductDetail();
//     }
//   }
// }
