import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BestSellingBanner extends StatelessWidget {
  const BestSellingBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width * .7,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/bestSelling.png"),
                fit: BoxFit.fill)),
      ),
    );
  }
}
