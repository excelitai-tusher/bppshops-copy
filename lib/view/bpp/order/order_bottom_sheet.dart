import 'package:bpp_shop/view/bpp/bottomAppBar/bottom_app_bar.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/home_Screen/home_screen.dart';
import 'package:flutter/material.dart';


class OrderBottomSheet extends StatelessWidget {
  const OrderBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.fromLTRB(15, 150, 15, 200),
        height: MediaQuery.of(context).size.height * .8,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(50, 50, 50, 30),
                child: Image.asset('assets/Rectangle 237.webp')
            ),
            Text(
              'Order Successful',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text('Your order id #1245 successfully placed'),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BottomNavBar(
                                currentTab: 0,
                                currentScreen: HomeScreen(),
                              )),
                      (route) => false);
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Bottom_NavBar()));
                },
                child: Text(
                  'Go to Homepage',
                  style: TextStyle(fontSize: 18),
                ))
          ],
        ),
      ),
    );
  }
}
