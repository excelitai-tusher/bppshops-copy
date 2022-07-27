
import 'package:bpp_shop/component/badge.dart';
import 'package:bpp_shop/view/bpp/payment/Bkash%20login.dart';
import 'package:bpp_shop/view/bpp/payment/credit%20%20card%20payment.dart';
import 'package:bpp_shop/view_model/bpp/cart_provider.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/wish_list/wishlist_screen.dart';

import 'package:bpp_shop/view/bpp/bottomAppBar/bottom_app_bar.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/history_screen/history_screen.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/home_Screen/home_screen.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/profile/profile_screen.dart';
import 'package:bpp_shop/view/bpp/cart/cart_screen.dart';
import 'package:bpp_shop/view/bpp/checkout/checkoutPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Checkout1 extends StatefulWidget {
  @override
  _Checkout1State createState() => _Checkout1State();
}

class _Checkout1State extends State<Checkout1> {
  bool? free_Shipping = false;
  bool? local_Pickup = false;
  bool? flat_Rate = false;
  bool check = false;
  bool check1 = false;
  bool check2 = false;
  bool check3 = false;
  TextEditingController nameController = TextEditingController();
  String fullName = '';


  _free_shipping(bool? value) {
    setState(() {
      free_Shipping = value;
    });
  }

  _local_pickup(bool? value) {
    setState(() {
      local_Pickup = value;
    });
  }

  _flat_rate(bool? value) {
    setState(() {
      flat_Rate = value;
    });
  }

  void _check() {
    setState(() {
      check = !check;
      Navigator.push(context, MaterialPageRoute(builder: (context) =>  CardPayment()));

    });
  }

  void _check1() {
    setState(() {
      check1 = !check1;
      Navigator.push(context, MaterialPageRoute(builder: (context) =>  BkashLogin()));
    });
  }

  void _check2() {
    setState(() {
      check2 = !check2;
    });
  }

  void _check3() {
    setState(() {
      check3 = !check3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyWishList()));
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),

          ),
          title: Text(
            "Checkout",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Returing Customer ?',
                    style: TextStyle(
                        color:
                            Colors.grey), //DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                          text: '  LOGIN',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Have a coupon ?',
                    style: TextStyle(
                        color:
                            Colors.grey), //DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                          text: '  Enter your code',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                FittedBox(
                  child: Text(
                    "Billing Details",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          alignment: Alignment.center,
                          child: Text(
                            "First Name",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          height: 30,
                          width: MediaQuery.of(context).size.width * .4,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              //hintText: 'Full Name',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          child: Text(
                            "Last Name",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          height: 30,
                          width: MediaQuery.of(context).size.width * .4,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              //hintText: 'Full Name',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                FittedBox(
                  alignment: Alignment.center,
                  child: Text(
                    "Email Address",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 40,
                  width: MediaQuery.of(context).size.width * .9,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      //hintText: 'Full Name',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FittedBox(
                  alignment: Alignment.center,
                  child: Text(
                    "Mobile Number",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 40,
                  width: MediaQuery.of(context).size.width * .9,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      //hintText: 'Full Name',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FittedBox(
                  alignment: Alignment.center,
                  child: Text(
                    "Street Address",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 40,
                  width: MediaQuery.of(context).size.width * .9,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      //hintText: 'Full Name',
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          alignment: Alignment.center,
                          child: Text(
                            "Country/Region",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          height: 30,
                          width: MediaQuery.of(context).size.width * .4,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              //hintText: 'Full Name',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          child: Text(
                            "Town/City",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          height: 30,
                          width: MediaQuery.of(context).size.width * .4,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              //hintText: 'Full Name',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                FittedBox(
                  alignment: Alignment.center,
                  child: FittedBox(
                    child: Text(
                      "Zip Code",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 40,
                  width: MediaQuery.of(context).size.width * .9,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      //hintText: 'Full Name',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FittedBox(
                  alignment: Alignment.center,
                  child: FittedBox(
                    child: Text(
                      "Order Notes ( Optional )",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 100,
                  width: MediaQuery.of(context).size.width * .9,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'e.g.special notes for delivery',
                      hintStyle: TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  height: MediaQuery.of(context).size.height * .6,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.grey, spreadRadius: 1),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView(
                     // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Your Order",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Divider(
                          indent: 5,
                          endIndent: 5,
                          color: Colors.grey,
                          thickness: 2,
                          height: 20,
                        ),
                        SingleChildScrollView(
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            height: MediaQuery.of(context).size.height * .24,
                            width: MediaQuery.of(context).size.width,
                            child: DataTable(
                              columns: [
                                DataColumn(
                                    label: Text('ProductName',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold))),
                                DataColumn(
                                    label: Text('QTY',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold))),
                                DataColumn(
                                  label: Text('Price',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                              rows: [
                                DataRow(cells: [
                                  DataCell(Text('Green Burqa With Hijab')),
                                  DataCell(Text('1')),
                                  DataCell(Text('TK.750')),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Surma Dani')),
                                  DataCell(Text('1')),
                                  DataCell(Text('TK.950')),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Lavender Khemar')),
                                  DataCell(Text('1')),
                                  DataCell(Text('TK.500')),
                                ]),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FittedBox(
                                child: Text(
                                  "Subtotal",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              FittedBox(
                                child: Text(
                                  "TK. 8950.00",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Shipping",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * .05,
                          width: MediaQuery.of(context).size.width,
                          child: CheckboxListTile(
                            title: Text(
                              "Free Shipping",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                            controlAffinity: ListTileControlAffinity.leading,
                            value: free_Shipping,
                            onChanged: _free_shipping,
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * .05,
                          width: MediaQuery.of(context).size.width,
                          child: CheckboxListTile(
                            title: Text(
                              "Local Pickup",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                            controlAffinity: ListTileControlAffinity.leading,
                            value: local_Pickup,
                            onChanged: _local_pickup,
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * .05,
                          width: MediaQuery.of(context).size.width,
                          child: CheckboxListTile(
                            title: Text(
                              "Flat Rate: TK.300",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                            controlAffinity: ListTileControlAffinity.leading,
                            value: flat_Rate,
                            onChanged: _flat_rate,
                          ),
                        ),
                        Divider(
                          indent: 5,
                          endIndent: 5,
                          color: Colors.grey,
                          thickness: 2,
                          height: 20,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FittedBox(
                                child: Text(
                                  "Total",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              FittedBox(
                                child: Text(
                                  "TK. 8950.00",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FittedBox(
                  child: Text(
                    "Payment Methods",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        onTap: _check,
                        leading: Icon(
                          Icons.credit_card_rounded,
                          color: Colors.blueAccent,
                          size: 40,
                        ),
                        title: Text('Credit or Debit Card'),
                        trailing: check
                            ? Icon(
                                Icons.check_circle,
                                color: Colors.blueAccent,
                              )
                            : null,
                      ),
                      ListTile(
                        onTap: _check1,
                        leading: Image.asset("images/bKash.png"),
                        title: Text('Bkash'),
                        trailing: check1
                            ? Icon(
                                Icons.check_circle,
                                color: Colors.blueAccent,
                              )
                            : null,
                      ),
                      ListTile(
                        onTap: _check2,
                        leading: Image.asset("images/paypal.png"),
                        title: Text('Paypal'),
                        trailing: check2
                            ? Icon(
                                Icons.check_circle,
                                color: Colors.blueAccent,
                              )
                            : null,
                      ),
                      ListTile(
                        onTap: _check3,
                        leading: Image.asset("images/gift card.png"),
                        title: Text('Gift Card'),
                        trailing: check3
                            ? Icon(
                                Icons.check_circle,
                                color: Colors.blueAccent,
                              )
                            : null,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FittedBox(
                            child: Text(
                          'Place order',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        )),
                      ],
                    ),
                    onPressed: () {

                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CheckOut()));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
          floatingActionButton: Consumer<Cart>(
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
          ),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
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
          )
      ),
    );
  }
}
