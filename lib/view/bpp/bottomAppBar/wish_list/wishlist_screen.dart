
import 'package:bpp_shop/component/badge.dart';
import 'package:bpp_shop/view_model/bpp/cart_provider.dart';
import 'package:bpp_shop/view_model/bpp/wishlist_provider.dart';

import 'package:bpp_shop/view/bpp/bottomAppBar/bottom_app_bar.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/history_screen/history_screen.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/home_Screen/home_screen.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/profile/profile_screen.dart';
import 'package:bpp_shop/view/bpp/cart/cart_screen.dart';
import 'package:flutter/material.dart';


import 'package:provider/provider.dart';


class MyWishList extends StatefulWidget {
 // const MyWishList({Key? key}) : super(key: key);
  String ?button;
  final String? id;
  final String? productId;
  final String? name;
  final int? quantity;
  final double? price;
  MyWishList({this.id, this.productId, this.price, this.quantity, this.name,this.button});

  @override
  State<MyWishList> createState() => _MyWishListState();
}

class _MyWishListState extends State<MyWishList> {
  @override
  Widget build(BuildContext context) {
    final wishlist = Provider.of<Wish>(context);
    // final wishlistsData = Provider.of<Dummy_Product>(context);
    // final wishlists =wishlistsData.items;
    return Scaffold(
      appBar: AppBar(
leading:widget.button=='pop'? IconButton(
    onPressed: (){
Navigator.pop(context);
//Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Bottom_NavBar()));

    //  Navigator.pop(context);
//Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Bottom_NavBar()));
    },
  icon: Icon(Icons.arrow_back,color: Colors.white,),
):null,
        centerTitle: true,
        title: Text('Wishlist',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.white),),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
margin: EdgeInsets.only(bottom: 30),
            // child: Column(
            //   children: [
            //     Container(
            //         height: 500,
            //         child: ListView.builder(
            //             itemCount: wishlist.items.length,
            //             itemBuilder: (ctx, i) =>WishItems(
            //               productId: wishlist.items.keys.toList()[i],
            //               price: wishlist.items.values.toList()[i].price,
            //               quantity: wishlist.items.values.toList()[i].quantity,
            //               name: wishlist.items.values.toList()[i].name,
            //               imageUrl: wishlist.items.values.toList()[i].imageUrl,
            //             )),
            //     ),
            //     Container(
            //       margin: EdgeInsets.only(left: 25,right:25),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
            //         ElevatedButton(style: ElevatedButton.styleFrom(
            //           primary: Colors.amber,
            //         ),onPressed: (){
            //          // Navigator.of(context).pop();
            //           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CartScreen()));
            //         }, child: Text('Add all to my Cart',style: TextStyle(color: Colors.white),)),
            //         ElevatedButton(style: ElevatedButton.styleFrom(
            //           primary: Colors.grey,
            //         ),onPressed: (){
            //
            //        //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PopularProduct()));
            //         }, child: Text('Continue Shopping')),
            //       ],),
            //     )
            //   ],
            // ),
          ),
        ),
      ),
        // floatingActionButton: widget.button=='pop'?  Consumer<Cart>(
        //   builder: (_, cart, ch) => Badge(
        //     value: cart.itemCount.toString(),
        //     child: ch,
        //   ),
        //   child: FloatingActionButton(
        //
        //     backgroundColor: Theme.of(context).colorScheme.primary,
        //     onPressed: (){
        //       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CartScreen()));
        //     },
        //     child: Icon(Icons.shopping_bag_sharp,color: Colors.white,),
        //
        //
        //   ),
        // ):null,
        // floatingActionButtonLocation:widget.button=='pop'? FloatingActionButtonLocation.centerDocked:null,
        // bottomNavigationBar:widget.button=='pop'? BottomAppBar(
        //   shape: CircularNotchedRectangle(),
        //   notchMargin: 6,
        //   child: Container(
        //     height: 60,
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: <Widget>[
        //         Row(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: <Widget>[
        //             MaterialButton(
        //               minWidth: 40,
        //               onPressed: () {
        //                 setState(() {
        //                   // currentScreen =
        //                   //     Home_Page(); // if user taps on this dashboard tab will be active
        //                   // currentTab = 0;
        //                   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Bottom_NavBar(currentTab: 0,currentScreen: Home_Page(),)), (route) => false);
        //                   //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottom_NavBar(currentTab: 0,currentScreen: Home_Page(),)));
        //                 });
        //               },
        //               child: Column(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: <Widget>[
        //                   Icon(
        //                     Icons.home,
        //                     color: Colors.grey,//currentTab == 0 ? Colors.amber,//: Colors.grey,
        //                   ),
        //                   Text(
        //                     'Home',
        //                     style: TextStyle(
        //                       color: Colors.grey,//currentTab == 0 ? Colors.amber : Colors.grey,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //             // Home_Page(),
        //             // MyWishList(),
        //             // HistoryTabbar(),
        //             // ProfileScreen(),
        //             // PopularProduct(),
        //             MaterialButton(
        //               minWidth: 40,
        //               onPressed: () {
        //                 setState(() {
        //                   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Bottom_NavBar(currentTab: 1,currentScreen: MyWishList(),)), (route) => false);
        //                   // Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottom_NavBar(currentTab: 1,currentScreen: MyWishList(),)));
        //                   // currentScreen =
        //                   //     MyWishList(); // if user taps on this dashboard tab will be active
        //                   // currentTab = 1;
        //                 });
        //               },
        //               child: Column(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: <Widget>[
        //                   Icon(
        //                     Icons.favorite_border_outlined,
        //                     color: Colors.grey,//currentTab == 1 ? Colors.amber : Colors.grey,
        //                   ),
        //                   Text(
        //                     'Favorite',
        //                     style: TextStyle(
        //                       color: Colors.grey,//,currentTab == 1 ? Colors.amber: Colors.grey,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             )
        //           ],
        //         ),
        //
        //         // Right Tab bar icons
        //
        //         Row(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: <Widget>[
        //             MaterialButton(
        //               minWidth: 40,
        //               onPressed: () {
        //                 setState(() {
        //                   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Bottom_NavBar(currentTab: 2,currentScreen: HistoryTabbar(),)), (route) => false);
        //                   //Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottom_NavBar(currentTab: 2,currentScreen: HistoryTabbar(),)));
        //                   // currentScreen =
        //                   //     HistoryTabbar(); // if user taps on this dashboard tab will be active
        //                   // currentTab = 2;
        //                 });
        //               },
        //               child: Column(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: <Widget>[
        //                   Icon(
        //                     Icons.dashboard_outlined,
        //                     color: Colors.grey,//currentTab == 2 ? Colors.amber: Colors.grey,
        //                   ),
        //                   Text(
        //                     'History',
        //                     style: TextStyle(
        //                       color: Colors.amber,//,currentTab == 2 ? Colors.amber : Colors.grey,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //             MaterialButton(
        //               minWidth: 40,
        //               onPressed: () {
        //                 setState(() {
        //                   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Bottom_NavBar(currentTab: 3,currentScreen:IslamicProfileScreen(),)), (route) => false);
        //                   //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottom_NavBar(currentTab: 3,currentScreen: ProfileScreen(),)));
        //                   // currentScreen =
        //                   //     ProfileScreen(); // if user taps on this dashboard tab will be active
        //                   // currentTab = 3;
        //                 });
        //               },
        //               child: Column(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: <Widget>[
        //                   Icon(
        //                     Icons.account_circle,
        //                     color: Colors.grey,//currentTab == 3 ? Colors.amber : Colors.grey,
        //                   ),
        //                   Text(
        //                     'Profile',
        //                     style: TextStyle(
        //                       color: Colors.grey,//currentTab == 3 ? Colors.amber: Colors.grey,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             )
        //           ],
        //         )
        //
        //       ],
        //     ),
        //   ),
        // ):null

        floatingActionButton: widget.button=='pop'?  Consumer<Cart>(
          builder: (_, cart, ch) => Badge(
            value: cart.itemCount.toString(),
            child: ch,
          ),
          child: FloatingActionButton(
            backgroundColor: Theme.of(context).colorScheme.primary,
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CartScreen()));
            },
            child: Icon(
              Icons.shopping_bag_sharp,
              color: Colors.white,
            ),
          ),
        ):null,
        floatingActionButtonLocation:
        FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar:widget.button=='pop'?  BottomAppBar(
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
                          // currentScreen =
                          //     Home_Page(); // if user taps on this dashboard tab will be active
                          // currentTab = 0;
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
                    // Home_Page(),
                    // MyWishList(),
                    // HistoryTabbar(),
                    // ProfileScreen(),
                    // PopularProduct(),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BottomNavBar(
                                    currentTab: 1,
                                    currentScreen:MyWishList(),
                                  )),
                                  (route) => false);
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottom_NavBar(currentTab: 1,currentScreen: MyWishList(),)));
                          // currentScreen =
                          //     MyWishList(); // if user taps on this dashboard tab will be active
                          // currentTab = 1;
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
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottom_NavBar(currentTab: 2,currentScreen: HistoryTabbar(),)));
                          // currentScreen =
                          //     HistoryTabbar(); // if user taps on this dashboard tab will be active
                          // currentTab = 2;
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
                          //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottom_NavBar(currentTab: 3,currentScreen: ProfileScreen(),)));
                          // currentScreen =
                          //     ProfileScreen(); // if user taps on this dashboard tab will be active
                          // currentTab = 3;
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
        ):null
    );
  }
}
