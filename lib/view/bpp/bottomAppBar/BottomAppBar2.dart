import 'package:bpp_shop/view/bpp/bottomAppBar/bottom_app_bar.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/history_screen/history_screen.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/home_Screen/home_screen.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/profile/profile_screen.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/wish_list/wishlist_screen.dart';
import 'package:flutter/material.dart';
BottomAppBar bottomAppBar(BuildContext context,Color color) {
  return BottomAppBar(
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

                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.home,
                      color: color, //currentTab == 0 ? Colors.amber,//: Colors.grey,
                    ),
                    Text(
                      'Home',
                      style: TextStyle(
                          color: color//currentTab == 0 ? Colors.amber : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              MaterialButton(
                minWidth: 40,
                onPressed: () {

                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BottomNavBar(
                            currentTab: 1,
                            currentScreen: MyWishList(),//WishListScreen(),
                          )),
                          (route) => false);

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
  );
}