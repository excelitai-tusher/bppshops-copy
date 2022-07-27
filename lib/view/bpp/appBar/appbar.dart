import 'package:bpp_shop/models/bpp/app_model.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/bottom_app_bar.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/home_Screen/home_screen.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/profile/profile_screen.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final CarouselController? _carouselSlider = CarouselController();
String? nameFromFacebook;
int? routeKey;
AppBar bppAppBar(BuildContext context, List<Apps> apps,var _bppscafoldKey) {
  return AppBar(
    elevation: 0,
    backgroundColor: Color(0xFFE37D4E),
    leading: IconButton(
      onPressed: () {
        _bppscafoldKey.currentState!.openDrawer();
      },
      icon: Icon(
        Icons.menu,
        color: Colors.white,
      ),
    ),
    centerTitle: true,
    title: TextButton(
      onPressed: (){

          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => BottomNavBar(currentTab: 0,currentScreen: HomeScreen(),)),
                  (route) => false);

        //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BottomNavBar(currentTab: 0,currentScreen: HomeScreen(),),));
      },
      child: Text(
        "BPPSHOPS",
        style: TextStyle(color: Colors.white,fontSize: 18),
      ),
    ),
    actions: [
      GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfileScreen()));
        },
        child:routeKey==1?CircleAvatar(
          backgroundImage: NetworkImage(nameFromFacebook.toString()),
        ): routeKey==3?Center(child: Text(nameFromFacebook.toString(),style: TextStyle(color: Colors.white),)):Icon((Icons.person),color: Colors.white,),
      ),
      SizedBox(width: 15,)
    ],
    bottom: PreferredSize(
      preferredSize: Size(MediaQuery.of(context).size.width, 50),
      child: Container(
        height: 50,
        color: Color(0xffF3D0B7),
        child: CarouselSlider.builder(
            itemCount: apps.length,
            options: CarouselOptions(
                viewportFraction:.4,
                reverse: false,
                autoPlay: true,
                autoPlayAnimationDuration: Duration(
                  milliseconds: 2000,
                ),
                height: MediaQuery.of(context).size.height
            ),
            carouselController: _carouselSlider,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) {
              apps[itemIndex];
              return GestureDetector(
                onTap: apps[itemIndex].subApps!= null?
                    (){
                  Navigator.of(context).push(MaterialPageRoute(builder:(context)=> apps[itemIndex].subApps!));

                } :null,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 6),
                  height: 30,
                  width: 140,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        height: 25,
                        width: 25,
                        child: Image.asset('${apps[itemIndex].icon}',fit: BoxFit.cover,),
                      ),
                      Flexible(
                        child: Container(
                          width:90,
                          child: Text(
                            '${apps[itemIndex].title}',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.indigo),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    ),
  );
}
