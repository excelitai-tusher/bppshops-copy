
import 'package:bpp_shop/service/grocery/http_grocery_banner.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class GroceryHomeBanner extends StatelessWidget {
  const GroceryHomeBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
        future:getGroceryBanner(),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.hasData) {
    return  snapshot.data!=null ? Container(
      //margin: EdgeInsets.symmetric(vertical: 8),
      height: 130,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              image:snapshot.data.bennarImg!=null? NetworkImage("https://bppshops.com/${snapshot.data.bennarImg}"):NetworkImage("https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg"),
              fit: BoxFit.fill
          )
      ),
    ):Container();

    }

    else{
      return Shimmer(
        duration: Duration(seconds: 2), //Default value
        interval:
        Duration(seconds: 1), //Default value: Duration(seconds: 0)
        color: Colors.black, //Colors.grey.shade700, //Default value
        colorOpacity: 0, //Default value
        enabled: true, //Default value
        direction: ShimmerDirection.fromLTRB(),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          height: 80,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(6),

          ),
        ),
      );
    }
        }
    ) ;
  }

}
