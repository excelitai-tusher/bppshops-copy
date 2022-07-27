import 'package:bpp_shop/view/bpp/bottomAppBar/bottom_app_bar.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/home_Screen/home_screen.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/profile/profile_screen.dart';
import 'package:flutter/material.dart';

AppBar bppAppBar2(BuildContext context,var _scafoldKey, String? nameFromFacebook,
int? routeKey) {
  //GlobalKey<ScaffoldState> _scafoldKey = GlobalKey();
  return AppBar(
    elevation: 0,
    backgroundColor: Color(0xFFE37D4E),
    leading: IconButton(
      onPressed: () {
        _scafoldKey.currentState!.openDrawer();
      },
      icon: Icon(
        Icons.menu,
        color: Colors.white,
      ),
    ),
    centerTitle: true,
    title: TextButton(
      onPressed: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    BottomNavBar(currentTab: 0, currentScreen: HomeScreen(),)),
                (route) => false);

        //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BottomNavBar(currentTab: 0,currentScreen: HomeScreen(),),));
      },
      child: Text(
        "BPPSHOPS",
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    ),
    actions: [
      GestureDetector(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ProfileScreen()));
        },
        child: routeKey == 1
            ? CircleAvatar(
          backgroundImage:
          NetworkImage(nameFromFacebook.toString()),
        )
            : routeKey == 3
            ? Center(
            child: Text(
              nameFromFacebook.toString(),
              style: TextStyle(color: Colors.white),
            ))
            : Icon(
          (Icons.person),
          color: Colors.white,
        ),
      ),
      SizedBox(
        width: 15,
      )
    ],
  );
}