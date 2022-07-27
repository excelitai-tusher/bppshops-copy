import 'package:bpp_shop/component/badge.dart';
import 'package:bpp_shop/component/filter.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/BottomAppBar2.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/bottom_app_bar.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/history_screen/history_screen.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/home_Screen/home_screen.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/profile/profile_screen.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/wish_list/wishlist_screen.dart';
import 'package:bpp_shop/component/dropdown.dart';
import 'package:bpp_shop/view/bpp/cart/cart_screen.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/floatingButton.dart';
import 'package:bpp_shop/view/islamic/Home_Screen/popular_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../view_model/bpp/cart_provider.dart';


class PopularProduct extends StatefulWidget {
  const PopularProduct({Key? key}) : super(key: key);

  @override
  State<PopularProduct> createState() => _PopularProductState();
}

class _PopularProductState extends State<PopularProduct> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
            title: const Text(
              "Popular Product",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: const [
              Icon(Icons.search, color: Colors.white),
              SizedBox(
                width: 5,
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.notifications_outlined, color: Colors.white),
              ),
            ],
          ),
          //  bottomNavigationBar: Bottom_NavBar() ,
          body: Container(
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: [
                Container(
                  height: 35,
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.filter_alt_outlined,
                              color: Colors.grey,
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Filter()));
                                },
                                child: Text(
                                  'Filters',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                )),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.height,
                              color: Colors.grey,
                            ),
                            MyDropDown(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  height: MediaQuery.of(context).size.height * .72,
                  width: MediaQuery.of(context).size.width,
                  child: PopularProductHome(''),
                ),
              ],
            ),
          ),
        floatingActionButton: floatingButton(context,Colors.amber),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: bottomAppBar(context,Colors.amber),
      ),
    );
  }
}
