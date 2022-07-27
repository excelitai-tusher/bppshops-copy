// import 'package:bpp_shop/islamic/provider/constants/constant.dart';
// import 'package:bpp_shop/islamic/provider/model/cart_provider.dart';
// import 'package:bpp_shop/islamic/provider/model/order/track%20order/track%20order%20model%20class.dart';
// import 'package:bpp_shop/islamic/screen/bottom_app_bar.dart';
// import 'package:bpp_shop/bpp/navbar/cart_screen.dart';
// import 'package:bpp_shop/islamic/screen/Home_Screen/home_page.dart';
// import 'package:bpp_shop/islamic/screen/tap_bar/order%20history%20tabbar.dart';
// import 'package:bpp_shop/islamic/screen/profile_screen.dart';
// import 'package:bpp_shop/islamic/screen/wishlist_screen.dart';
// import 'package:bpp_shop/islamic/component/badge.dart';
// import 'package:flutter/material.dart';
// import 'package:im_stepper/stepper.dart';
// import 'package:provider/provider.dart';
//
// class TrackOrder extends StatefulWidget {
//   const TrackOrder({Key? key}) : super(key: key);
//
//   @override
//   _TrackOrderState createState() => _TrackOrderState();
// }
//
// class _TrackOrderState extends State<TrackOrder> {
//   // var _itemCount = null;
//   @override
//   Widget build(BuildContext context) {
//     final trackOrder = Provider.of<OrderTracking>(context);
//     final track = trackOrder.item;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.amber,
//         elevation: 0,
//         centerTitle: true,
//         leading: IconButton(
//          icon:Icon(Icons.arrow_back,
//            color: Colors.white,),
//           onPressed: (){
//            Navigator.of(context).pop();
//           },
//         ),
//         title: Text(
//           "Track Order",
//           style: TextStyle(
//             fontSize: 20,
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   children: [
//                     FittedBox(
//                       child: Text(
//                         "ESTIMATED TIME",
//                         style: TextStyle(
//                           fontSize: 13,
//                           color: Colors.grey,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     FittedBox(
//                       child: Text(
//                         "40 minutes",
//                         style: TextStyle(
//                           fontSize: 10,
//                           color: Colors.grey,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     FittedBox(
//                       child: Text(
//                         "ORDER NUMBER",
//                         style: TextStyle(
//                           fontSize: 13,
//                           color: Colors.grey,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     FittedBox(
//                       child: Text(
//                         "# 4563217",
//                         style: TextStyle(
//                           fontSize: 10,
//                           color: Colors.grey,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Divider(
//             color: Colors.grey,
//             thickness: 1,
//           ),
//           Container(
//             height: MediaQuery.of(context).size.height * .73,
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   height: MediaQuery.of(context).size.height,
//                   width: MediaQuery.of(context).size.width * .18,
//                   child: IconStepper(
//                     direction: Axis.vertical,
//                     enableNextPreviousButtons: false,
//                     enableStepTapping: false,
//                     stepColor: Colors.green,
//                     activeStepBorderColor: kWhiteColor,
//                     activeStepBorderWidth: 0.0,
//                     activeStepBorderPadding: 0.0,
//                     scrollingDisabled: true,
//                     lineColor: Colors.green,
//                     lineLength: 80.0,
//                     lineDotRadius: 2.0,
//                     stepRadius: 10.0,
//                     icons: [
//                       Icon(Icons.radio_button_checked, color: Colors.green),
//                       Icon(Icons.check, color: kWhiteColor),
//                       Icon(Icons.check, color: kWhiteColor),
//                       Icon(Icons.check, color: kWhiteColor),
//                       Icon(Icons.check, color: kWhiteColor),
//                       Icon(Icons.check, color: kWhiteColor),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width * .8,
//                   child: ListView.builder(
//                     physics: NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     itemCount: track.length,
//                     itemBuilder: (context, index) {
//                       return ListTile(
//                         contentPadding: EdgeInsets.symmetric(
//                           vertical: 16.0,
//                         ),
//                         leading: Image(
//                           image: AssetImage(("${track[index].image}")),
//                         ),
//                         title: Text(
//                           "${track[index].title}",
//                           style: TextStyle(fontSize: 16.0),
//                         ),
//                         subtitle: Text(
//                           "${track[index].subtitle}",
//                           style: TextStyle(fontSize: 10.0),
//                         ),
//                         trailing: Text(
//                           "${track[index].time}",
//                           style: TextStyle(fontSize: 16.0, color: Colors.red),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Card(
//             margin: EdgeInsets.symmetric(horizontal: 25),
//             color: Color(0xFFfff2df),
//             elevation: 4,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: ListTile(
//               leading: Icon(
//                 Icons.home,
//                 color: Theme.of(context).errorColor,
//               ),
//               title: Text('Delivery address'),
//               subtitle: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: 5,),
//                   Text("Home,  Work & Other Address"),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   Text("House No. 54, 4th Floor, Sector 11, Uttara Dhaka-1212"),
//                 ],
//               ),
//               isThreeLine: true,
//             ),
//           ),
//           Card(
//             margin: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
//            color: Color(0xFFfff2df),
//             elevation: 4,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: ListTile(
//               leading: Icon(
//                 Icons.star,
//                 color: Colors.amber,
//               ),
//               isThreeLine: true,
//               title: Text('Don’t forget to rate'),
//               subtitle: Column(
//                 children: [
//                   SizedBox(height: 5,),
//                   Text(
//                       "Lorem ipsum dolor sit amet, consectetur adipiscing elit."),
//                   SizedBox(height: 5,),
//                   Row(
//                     children: [
//                       Icon(
//                         Icons.star,
//                         color: Colors.grey,
//                       ),
//                       Icon(
//                         Icons.star,
//                         color: Colors.grey,
//                       ),
//                       Icon(
//                         Icons.star,
//                         color: Colors.grey,
//                       ),
//                       Icon(
//                         Icons.star,
//                         color: Colors.grey,
//                       ),
//                       Icon(
//                         Icons.star,
//                         color: Colors.grey,
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(height: 30,)
//         ]),
//       ),
//         // floatingActionButton:   Consumer<Cart>(
//         //   builder: (_, cart, ch) => Badge(
//         //     value: cart.itemCount.toString(),
//         //     child: ch,
//         //   ),
//         //   child: FloatingActionButton(
//         //
//         //     backgroundColor: Theme.of(context).colorScheme.primary,
//         //     onPressed: (){
//         //       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CartScreen()));
//         //     },
//         //     child: Icon(Icons.shopping_bag_sharp,color: Colors.white,),
//         //
//         //
//         //   ),
//         // ),
//         // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//         // bottomNavigationBar: BottomAppBar(
//         //   shape: CircularNotchedRectangle(),
//         //   notchMargin: 6,
//         //   child: Container(
//         //     height: 60,
//         //     child: Row(
//         //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         //       children: <Widget>[
//         //         Row(
//         //           crossAxisAlignment: CrossAxisAlignment.start,
//         //           children: <Widget>[
//         //             MaterialButton(
//         //               minWidth: 40,
//         //               onPressed: () {
//         //                 setState(() {
//         //                   // currentScreen =
//         //                   //     Home_Page(); // if user taps on this dashboard tab will be active
//         //                   // currentTab = 0;
//         //                   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Bottom_NavBar(currentTab: 0,currentScreen: Home_Page(),)), (route) => false);
//         //                   //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottom_NavBar(currentTab: 0,currentScreen: Home_Page(),)));
//         //                 });
//         //               },
//         //               child: Column(
//         //                 mainAxisAlignment: MainAxisAlignment.center,
//         //                 children: <Widget>[
//         //                   Icon(
//         //                     Icons.home,
//         //                     color: Colors.grey,//currentTab == 0 ? Colors.amber,//: Colors.grey,
//         //                   ),
//         //                   Text(
//         //                     'Home',
//         //                     style: TextStyle(
//         //                       color: Colors.grey,//currentTab == 0 ? Colors.amber : Colors.grey,
//         //                     ),
//         //                   ),
//         //                 ],
//         //               ),
//         //             ),
//         //
//         //             MaterialButton(
//         //               minWidth: 40,
//         //               onPressed: () {
//         //                 setState(() {
//         //                   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Bottom_NavBar(currentTab: 1,currentScreen: MyWishList(),)), (route) => false);
//         //
//         //                 });
//         //               },
//         //               child: Column(
//         //                 mainAxisAlignment: MainAxisAlignment.center,
//         //                 children: <Widget>[
//         //                   Icon(
//         //                     Icons.favorite_border_outlined,
//         //                     color: Colors.grey,//currentTab == 1 ? Colors.amber : Colors.grey,
//         //                   ),
//         //                   Text(
//         //                     'Favorite',
//         //                     style: TextStyle(
//         //                       color: Colors.grey,//,currentTab == 1 ? Colors.amber: Colors.grey,
//         //                     ),
//         //                   ),
//         //                 ],
//         //               ),
//         //             )
//         //           ],
//         //         ),
//         //
//         //         // Right Tab bar icons
//         //
//         //         Row(
//         //           crossAxisAlignment: CrossAxisAlignment.start,
//         //           children: <Widget>[
//         //             MaterialButton(
//         //               minWidth: 40,
//         //               onPressed: () {
//         //                 setState(() {
//         //                   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Bottom_NavBar(currentTab: 2,currentScreen: HistoryTabbar(),)), (route) => false);
//         //                   //Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottom_NavBar(currentTab: 2,currentScreen: HistoryTabbar(),)));
//         //                   // currentScreen =
//         //                   //     HistoryTabbar(); // if user taps on this dashboard tab will be active
//         //                   // currentTab = 2;
//         //                 });
//         //               },
//         //               child: Column(
//         //                 mainAxisAlignment: MainAxisAlignment.center,
//         //                 children: <Widget>[
//         //                   Icon(
//         //                     Icons.dashboard_outlined,
//         //                     color: Colors.grey,//currentTab == 2 ? Colors.amber: Colors.grey,
//         //                   ),
//         //                   Text(
//         //                     'History',
//         //                     style: TextStyle(
//         //                       color: Colors.amber,//,currentTab == 2 ? Colors.amber : Colors.grey,
//         //                     ),
//         //                   ),
//         //                 ],
//         //               ),
//         //             ),
//         //             MaterialButton(
//         //               minWidth: 40,
//         //               onPressed: () {
//         //                 setState(() {
//         //                   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Bottom_NavBar(currentTab: 3,currentScreen: IslamicProfileScreen(),)), (route) => false);
//         //                   //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottom_NavBar(currentTab: 3,currentScreen: ProfileScreen(),)));
//         //                   // currentScreen =
//         //                   //     ProfileScreen(); // if user taps on this dashboard tab will be active
//         //                   // currentTab = 3;
//         //                 });
//         //               },
//         //               child: Column(
//         //                 mainAxisAlignment: MainAxisAlignment.center,
//         //                 children: <Widget>[
//         //                   Icon(
//         //                     Icons.account_circle,
//         //                     color: Colors.grey,//currentTab == 3 ? Colors.amber : Colors.grey,
//         //                   ),
//         //                   Text(
//         //                     'Profile',
//         //                     style: TextStyle(
//         //                       color: Colors.grey,//currentTab == 3 ? Colors.amber: Colors.grey,
//         //                     ),
//         //                   ),
//         //                 ],
//         //               ),
//         //             )
//         //           ],
//         //         )
//         //
//         //       ],
//         //     ),
//         //   ),
//         // )
//     );
//   }
// }
