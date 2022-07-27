import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:bpp_shop/component/badge.dart';
import 'package:bpp_shop/view_model/bpp/cart_provider.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/bottom_app_bar.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/history_screen/history_screen.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/home_Screen/home_screen.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/profile/profile_screen.dart';
import 'package:bpp_shop/view/bpp/cart/cart_item.dart';
import 'package:bpp_shop/view/bpp/coupon/my_coupon.dart';
import 'package:bpp_shop/view/bpp/login/fb&mail_login_screen.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/wish_list/wishlist_screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../service/bpp/local_storage_service.dart';
import '../../view/bpp/address/order_proceed_screen.dart';

class FashionCart extends StatefulWidget {
  static const routeName = '/cart-screen';
  final String? id;
  final String? productId;
  final String? name;
  final int? quantity;
  final int? price;
  final double delivery;
  final int? qty;
  FashionCart(
      {this.id,
        this.productId,
        this.price,
        this.quantity,
        this.name,
        this.delivery = 50.0,
        this.qty});

  @override
  State<FashionCart> createState() => _FashionCartState();
}

class _FashionCartState extends State<FashionCart> {
  LocalStorageStore localStorageStore = LocalStorageStore();
  @override
  Widget build(BuildContext context) {
    bool visibleButton = MediaQuery.of(context).viewInsets.bottom != 0;
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFE37D4E),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(
          'My Cart',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          // Container(
          //   height: MediaQuery.of(context).size.height/2,
          //child:
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) => CartItems(
                index: i,
                //subprice:cart.items.values.toList()[i].subprice ,
                //  id: cart.items.values.toList()[i].id.toString(),
                productId: cart.items.keys.toList()[i],
                price: cart.items.values.toList()[i].price,
                quantity: cart.items.values.toList()[i].quantity,
                name: cart.items.values.toList()[i].name,
                imageUrl: "${cart.items.values.toList()[i].imageUrl}",
                qty: cart.items.values.toList()[i].qty!,
              )),
          //),
          Card(
            elevation: 5,
            shadowColor: Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            margin: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
            child: ListTile(
              title: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'coupon code'),
              ),
              trailing: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyCoupons()));
                },
                child: Container(
                    height: 40,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFFE37D4E)),
                    child: Center(
                        child: Text(
                          'Apply',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ))),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.black, width: 1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Sub total',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18)),
                      AnimatedFlipCounter(
                        value: cart.subAmount,
                        duration: Duration(seconds: 1),
                        curve: Curves.bounceOut,
                        wholeDigits: 1,
                        fractionDigits: 1,
                        textStyle:
                        TextStyle(fontSize: 18, color: Color(0xFFE37D4E)),
                      ),
                      // Text('${cart.subAmount}',style: TextStyle(fontSize: 18,color: Colors.amber))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.black, width: 1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Delivery Charge',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18)),
                      Text(
                        '${cart.subAmount != 0.0 ? widget.delivery : 0.0}',
                        style:
                        TextStyle(fontSize: 18, color: Color(0xFFE37D4E)),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.black, width: 1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      AnimatedFlipCounter(
                        value: cart.subAmount != 0.0 ? cart.totalAmount : 0,
                        duration: Duration(seconds: 1),
                        curve: Curves.bounceOut,
                        wholeDigits: 1,
                        fractionDigits: 1,
                        textStyle:
                        TextStyle(fontSize: 18, color: Color(0xFFE37D4E)),
                      ),
                      //Text('${cart.totalAmount}',style: TextStyle(fontSize: 18,color: Colors.amber),)
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(90, 40), primary: Color(0xFFE37D4E)),
                onPressed: cart.items.isNotEmpty
                    ? () async {
                  String token = await localStorageStore.getUserToken();
                  print("token======${token}");
                  token != "null"
                      ? Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => OrderProceedScreen()))
                      : Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EmailLogin(
                        from: "cart",
                      )));
                }
                    : () {},
                child: Text(
                  'Proceed to CheckOut',
                  style: TextStyle(color: Colors.white),
                )),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
      floatingActionButton: Visibility(
        visible: !visibleButton,
        child: Consumer<Cart>(
          builder: (_, cart, ch) => Badge(
            value: cart.itemCount.toString(),
            child: ch,
            color: Color(0xFFE37D4E),
          ),
          child: FloatingActionButton(
            backgroundColor: Color(0xFFE37D4E),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => FashionCart()));
            },
            child: Icon(
              Icons.shopping_bag_sharp,
              color: Colors.white,
            ),
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
                          color: Color(
                              0xFFE37D4E), //currentTab == 0 ? Colors.amber,//: Colors.grey,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            color: Color(
                                0xFFE37D4E), //currentTab == 0 ? Colors.amber : Colors.grey,
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
                                  currentScreen: MyWishList(),
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
      ),
    );
  }
}
