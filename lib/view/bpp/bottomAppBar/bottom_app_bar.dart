import 'package:bpp_shop/component/badge.dart';
import 'package:bpp_shop/view_model/bpp/cart_provider.dart';

import 'package:bpp_shop/view/bpp/bottomAppBar/wish_list/wishlist_screen.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/profile/profile_screen.dart';
import 'package:bpp_shop/view/bpp/cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'history_screen/history_screen.dart';
import 'home_Screen/home_screen.dart';
class BottomNavBar extends StatefulWidget {
  BottomNavBar({this.currentTab,this.currentScreen});
  final int? currentTab;
  Widget? currentScreen;
  @override
  _BottomNavBarState createState() => _BottomNavBarState(currentTab!,currentScreen!);
}

class _BottomNavBarState extends State<BottomNavBar> {
  // Properties & Variables needed

  _BottomNavBarState(
      this.currentTab,
      this.currentScreen
      );
  int currentTab ; // to keep track of active tab index
  final List<Widget> screens = [
    HomeScreen(),
    MyWishList(),
    HistoryScreen(),
    ProfileScreen(),

  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen; //= Home_Page(); // Our first view in viewport

  @override
  Widget build(BuildContext context) {
    bool visibleButton=MediaQuery.of(context).viewInsets.bottom!=0;
    return Scaffold(

      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),

      floatingActionButton:   Visibility(
        visible: !visibleButton,
        child: Consumer<Cart>(
          builder: (_, cart, ch) => Badge(
            value: cart.itemCount.toString(),
            child: ch,
            color: Color(0xFFE37D4E),
          ),
          child: FloatingActionButton(

            backgroundColor:Color(0xFFE37D4E),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CartScreen()));
            },
            child: Icon(Icons.shopping_bag_sharp,color: Colors.white,),


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
                        currentScreen =
                            HomeScreen(); // if user taps on this dashboard tab will be active
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.home,
                          color: currentTab == 0 ? Color(0xFFE37D4E): Colors.grey,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            color: currentTab == 0 ? Color(0xFFE37D4E): Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            MyWishList(); // if user taps on this dashboard tab will be active
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.favorite_border_outlined,
                          color: currentTab == 1 ?Color(0xFFE37D4E): Colors.grey,
                        ),
                        Text(
                          'Favorite',
                          style: TextStyle(
                            color: currentTab == 1 ? Color(0xFFE37D4E): Colors.grey,
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
                        currentScreen =
                          HistoryScreen(); // if user taps on this dashboard tab will be active
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.dashboard_outlined,
                          color: currentTab == 2 ? Color(0xFFE37D4E): Colors.grey,
                        ),
                        Text(
                          'History',
                          style: TextStyle(
                            color: currentTab == 2 ? Color(0xFFE37D4E) : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            ProfileScreen(); // if user taps on this dashboard tab will be active
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.account_circle,
                          color: currentTab == 3 ? Color(0xFFE37D4E): Colors.grey,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: currentTab == 3 ?Color(0xFFE37D4E): Colors.grey,
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
      ),
    );
  }
}
