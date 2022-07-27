import 'package:bpp_shop/models/bpp/app_model.dart';
import 'package:bpp_shop/view/grocery/ui/view/home_page/home_page_main.dart';
import 'package:bpp_shop/view/islamic/Home_Screen/home_page.dart';
import 'package:flutter/material.dart';
import '../../fashion/Screen/fashion_home_page.dart';
import '../../fashion/Screen/home_page copy.dart';
import '../../fashion/view/home_page/home_page.dart';

class BppApps with ChangeNotifier{
  List<Apps> _items1 = [
    Apps(
      id:'p1',
      upcoming:withoutUpcomming(),
      image: 'assets/subApps/image 1.webp',
      title: 'Islamic Product',
      subApps: Home_Page(),
      icon: 'assets/icons/08.webp',
      drawerIcon: "assets/drawer/image1.webp",
    ),
    Apps(
      id:'p2',
      upcoming:withoutUpcomming(),
      image: 'assets/subApps/image 2.webp',//image 2.png',
       subApps: GroceryHomePage(),
      title: 'Grocery',
      icon: 'assets/icons/02.webp',
      drawerIcon: "assets/drawer/image2.webp",
    ),
    Apps(
      id:'p3',
      upcoming:withoutUpcomming() ,
      image: 'assets/subApps/image 3.webp',
      subApps: FashionHomePage(),
      title: 'Fashion',
      drawerIcon:"assets/drawer/image3.webp",
      icon: 'assets/icons/05.webp',
    ),
    Apps(
      id:'p4',
      upcoming:upcommingWidget(),
      image: 'assets/subApps/image 4.webp',
      icon: 'assets/icons/03.webp',
      title: 'Electronics',
      drawerIcon:"assets/drawer/image4.webp",
    ),
    Apps(
      id:'p5',
      upcoming:upcommingWidget(),
      image: 'assets/subApps/image 5.webp',
      icon: 'assets/icons/07.webp',
      title: 'Baby Care',
      drawerIcon:"assets/drawer/image5.webp",
    ),
    Apps(
      id:'p6',
      upcoming:upcommingWidget(),
      image: 'assets/subApps/image 6.webp',
      icon: 'assets/icons/04.webp',
      title: 'Cosmetic',
      drawerIcon: "assets/drawer/image6.webp",
    ),
    Apps(
      id:'p7',
      upcoming:upcommingWidget(),
      image: 'assets/subApps/image 7.webp',
      icon: 'assets/icons/06.webp',
      title: 'Furniture',
      drawerIcon:"assets/drawer/image7.webp",
    ),
    Apps(
      id:'p8',
      upcoming:upcommingWidget(),
      image: 'assets/subApps/image 8.webp',
      icon: 'assets/icons/01.webp',
      title: 'Shoe',
      drawerIcon:"assets/drawer/image8.webp",
    ),
    Apps(
      id:'p9',
      upcoming:upcommingWidget(),
      image: 'assets/subApps/image 237.webp',
      icon: 'assets/drawer/image 237.webp',
      title: 'Vehicle',
      drawerIcon: "assets/drawer/image 237.webp",
    ),
    Apps(
      id:'p10',
      upcoming:upcommingWidget(),
      image: 'assets/subApps/image 238.webp',
      icon: 'assets/drawer/image 238.webp',
      title: 'Pharmacy',
      drawerIcon: "assets/drawer/image 238.webp",
    ),
    Apps(
      id:'p11',
      upcoming:upcommingWidget(),
      image: 'assets/subApps/image 245.webp',
      icon: 'assets/drawer/image 245.webp',
      title: 'Home Appliance',
      drawerIcon:"assets/drawer/image 245.webp",
    ),
  Apps(
      id:'p12',
      upcoming:upcommingWidget(),
      image: 'assets/subApps/image 246.webp',
    title: 'Hardware & Sanitary',
    icon: 'assets/drawer/image 246.webp',
    drawerIcon:"assets/drawer/image 246.webp",
    ),
    Apps(
      id:'p13',
      upcoming:upcommingWidget(),
      image: 'assets/subApps/image 241.webp',
      icon: 'assets/drawer/image 241.webp',
      title: 'Machinaries',
      drawerIcon:"assets/drawer/image 241.webp",
    ),
    Apps(
      id:'p14',
      upcoming:upcommingWidget(),
      image: 'assets/subApps/image 242.webp',
      icon: 'assets/drawer/image 242.webp',
      title: 'Eye Care',
      drawerIcon:"assets/drawer/image 242.webp",
    ),
    Apps(
      id:'p15',
      upcoming:upcommingWidget(),
      image: 'assets/subApps/image 243.webp',
      title: 'Home Decor',
      icon: 'assets/drawer/image 243.webp',
      drawerIcon:"assets/drawer/image 243.webp",
    ),
Apps(
      id:'p16',
      upcoming:upcommingWidget(),
      image: 'assets/subApps/image 244.webp',
  title: 'Rare Collection',
  icon: 'assets/drawer/image 244.webp',
  drawerIcon:"assets/drawer/image 244.webp",
    ),
  ];
  List<Apps> get items {
    return [..._items1];
  }
  Apps findById(String id) {
    return _items1.firstWhere((prod) => prod.id == id);
  }
}

class withoutUpcomming extends StatelessWidget {
  const  withoutUpcomming({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
    );
  }
}

class upcommingWidget extends StatelessWidget {
  const upcommingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFF426134),
      ),
      alignment: Alignment.topRight,
      height: 30,
      width: MediaQuery.of(context).size.width*.3,

      margin: EdgeInsets.only(top: 10),
      child: Center(child: Text("Upcoming..",style: TextStyle(color: Colors.white),)),
    );
  }
}