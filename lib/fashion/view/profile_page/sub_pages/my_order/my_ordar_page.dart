
import 'package:bpp_shop/fashion/controller/app_bar_controler.dart';
import 'package:bpp_shop/fashion/controller/peimary_page_controller.dart';
import 'package:bpp_shop/fashion/view/profile_page/sub_pages/my_order/componnent/body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({Key? key}) : super(key: key);

  @override
  _MyOrderState createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: InkWell(
        onTap: () {
          //Navigator.pop(context);
          final status =
          Provider.of<PrimaryScreenState>(context, listen: false);
          status.setPrimaryState(true);
          final primaryPageState = Provider.of<PrimaryPageController>(context,listen: false);
          primaryPageState.setPrimaryPage(3);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: InkWell(
          onTap: () {
            //Navigator.push(context, MaterialPageRoute(builder: (context) => Shipping()));
          },
          child: Text(
            "My Order",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Roboto-Regular.ttf'),
          ),
        ),
      ),
    );
  }
}
