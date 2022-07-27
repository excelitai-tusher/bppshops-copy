import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import '../../../models/islamic/bannar.dart';
import '../../../service/islamic/http_banner.dart';

class Home_Banner extends StatefulWidget {
  const Home_Banner({Key? key}) : super(key: key);
  @override
  State<Home_Banner> createState() => _Home_BannerState();
}

class _Home_BannerState extends State<Home_Banner> {

  @override
  Widget build(BuildContext context){
    return FutureBuilder(
        future: getBanner(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.hasData){
    List<Banner1> get = snapshot.data ?? <Banner1>[];
    return Container(
      height: MediaQuery.of(context).size.height * .1,
      // width: MediaQuery.of(context).size.width * .45,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 2,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            childAspectRatio: 2 / .8),
        itemBuilder: (context, index) {
          return Container(
            child: get[index].bennarImg != null
                ? Image.network(
              "https://bppshops.com/${get[index].bennarImg}",
              fit: BoxFit.fill,
            )
                : Image.network(
                'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg'),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 1),
                )
              ],
            ),
          );
        },
      ),
    );
    }
    else {
    return   Shimmer(
      duration: Duration(seconds: 2), //Default value
      interval:
      Duration(seconds: 1), //Default value: Duration(seconds: 0)
      color: Colors.black, //Colors.grey.shade700, //Default value
      colorOpacity: 0, //Default value
      enabled: true, //Default value
      direction: ShimmerDirection.fromLTRB(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * .45,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * .45,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ],
      ),
    );  }

        });


  }

}
