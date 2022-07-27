import 'package:bpp_shop/component/badge.dart';
import 'package:bpp_shop/models/islamic/drawer_sub_category.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/BottomAppBar2.dart';
import 'package:bpp_shop/view/bpp/drawer/bpp_drawer.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/floatingButton.dart';
import 'package:bpp_shop/view/islamic/Home_Screen/daily_best_sell.dart';
import 'package:bpp_shop/view/islamic/Home_Screen/home_banner.dart';
import 'package:bpp_shop/view/islamic/Home_Screen/home_slider.dart';
import 'package:bpp_shop/view/islamic/Home_Screen/latest_discount.dart';
import 'package:bpp_shop/view/islamic/Home_Screen/popular_product.dart';
import 'package:bpp_shop/view/islamic/Home_Screen/recently_added.dart';
import 'package:bpp_shop/view/islamic/Home_Screen/tranding_product.dart';
import 'package:bpp_shop/view/islamic/category/Category_Offers.dart';
import 'package:bpp_shop/view/islamic/drawer/islamic_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/islamic/drawer_sub_sub_category.dart';
import '../../../models/islamic/home_page_category.dart';
import '../../../view_model/bpp/app_provider.dart';
import '../../../service/islamic/http_drawer_category.dart';
import '../../../view/bpp/appBar/appbar.dart';

class Home_Page extends StatefulWidget {
  Home_Page({
    Key? key,
  }) : super(key: key);
  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  GlobalKey<ScaffoldState> _islamicScafoldKey = GlobalKey();
  GlobalKey<ScaffoldState> _bppscafoldKey = GlobalKey();
  List<Getcategory>? categoryList;
  List<Subcategory>? subCategoryList;
  List<Subsubcategories>? subSubcategoryList;

  void getList() async {
    final listOfCategory = await getDrawerCategory();
    final listOfSubCategory = await getDrawerSubCategory();
    final listOfSubSubCategory = await getDrawerSubSubCategory();
    setState(() {
      categoryList = listOfCategory;
      subCategoryList = listOfSubCategory;
      subSubcategoryList = listOfSubSubCategory;
      print(categoryList![0].categorySlugName);
      print("<<<<<<<<<category>>>>>>>");
      print(subCategoryList![0].subCategorySlugName);
      print("<<<<<<<<<subCategoryList>>>>>>>");
      print(subSubcategoryList![0].subsubcategorySlugName);
      print("<<<<<<<<<subSubCategoryList>>>>>>>");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getList();
  }

  @override
  Widget build(BuildContext context) {
    final appsData = Provider.of<BppApps>(context);
    final apps = appsData.items;
    bool visibleButton = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      key: _bppscafoldKey,
      appBar: bppAppBar(context, apps, _bppscafoldKey),
      drawer: BPPMainPageDrawer(),
      body: Scaffold(
        key: _islamicScafoldKey,
        backgroundColor: Color(0xFFEEEEEE),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.amber,
          centerTitle: true,
          title: Text(
            'Islamic',
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            onPressed: () {
              _islamicScafoldKey.currentState!.openDrawer();
              //Drawer(child: MyDrawer());
            },
            icon: Icon(
              Icons.menu,
              color: Colors.white,
              size: 30,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
        drawer: MyDrawer(
          categoryId: '',
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 15, right: 15, bottom: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15),
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search here',
                      prefixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {},
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      contentPadding: EdgeInsets.zero,
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                HomeMainSlider(),
                Home_Banner(),
                SizedBox(
                  height: 10,
                ),
                Category_offer(),
                //  ImageSlideShowCustom(),
                PopularProductHome("neverScroll"),
                DailyBestSellWidget(),
                LatestDiscount(),
                TrandingProductWidget('topselling'),
                TrandingProductWidget('TrendingProduct'),
                RecentlyAddedWidget(),
                TrandingProductWidget('TopRated'),
                //TopRatedProduct(),
                SizedBox(
                  height: 2,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Visibility(
            visible: !visibleButton,
            child: floatingButton(context, Colors.amber)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Visibility(
            visible: !visibleButton,
            child: bottomAppBar(context, Colors.amber)),
      ),
    );
  }
}
