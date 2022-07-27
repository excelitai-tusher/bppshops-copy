import 'package:flutter/material.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({Key? key}) : super(key: key);

  @override
  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.white,),
        title: FittedBox(
          child: Text(
            "Wishlist",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          children: [
            Image(image: AssetImage("images/empty wishlist1.png",),
            ),
            SizedBox(height: 20),
            FittedBox(
              child: Text(
                "Your wishlist is empty",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: FittedBox(
                child: Text(
                  "Tap heart button to start saving your favorite items",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                ),
                maximumSize: Size(200, 40),
                primary: Colors.amber,
              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(child: Text('Add Now',style: TextStyle(fontSize: 16, color: Colors.white),)),
                ],
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
