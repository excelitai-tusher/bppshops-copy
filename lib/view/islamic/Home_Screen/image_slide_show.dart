// import 'dart:convert';
// import 'package:bpp_shop/models/islamic/banner_category.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;
// import 'package:shimmer_animation/shimmer_animation.dart';
//
// class ImageSlideShowCustom extends StatefulWidget {
//   const ImageSlideShowCustom({Key? key}) : super(key: key);
//
//   @override
//   State<ImageSlideShowCustom> createState() => _ImageSlideShowCustomState();
// }
//
// class _ImageSlideShowCustomState extends State<ImageSlideShowCustom> {
//   final CarouselController? _carouselSlider = CarouselController();
//   List<BannerCategory>? bannerCategory;
//   @override
//   void initState() {
//     // TODO: implement initState
//     getData();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return bannerCategory == null
//         ? Shimmer(
//             duration: Duration(seconds: 2), //Default value
//             interval:
//                 Duration(seconds: 1), //Default value: Duration(seconds: 0)
//             color: Colors.black, //Colors.grey.shade700, //Default value
//             colorOpacity: 0, //Default value
//             enabled: true, //Default value
//             direction: ShimmerDirection.fromLTRB(),
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade300,
//                 borderRadius: BorderRadius.circular(6),
//               ),
//             ),
//           )
//         : SizedBox(
//       height: 120,
//           child: CarouselSlider.builder(
//               itemCount: bannerCategory!.length,
//               options: CarouselOptions(
//                   pauseAutoPlayOnTouch: true,
//                   viewportFraction: 1,
//                   reverse: false,
//                   autoPlay: true,
//                   autoPlayAnimationDuration: Duration(
//                     milliseconds: 2000,
//                   ),
//                   height: MediaQuery.of(context).size.height),
//               carouselController: _carouselSlider,
//               itemBuilder:
//                   (BuildContext context, int itemIndex, int pageViewIndex) {
//                 //bannerCategory![itemIndex];
//                 return Container(
//                   height: 120,
//                   margin: EdgeInsets.symmetric(horizontal: 10),
//                   child: bannerCategory![itemIndex].bennarImg != null
//                       ? Image.network(
//                           'https://bppshops.com/${bannerCategory![itemIndex].bennarImg}',
//                           fit: BoxFit.fill,
//                         )
//                       : Image.network(
//                           'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg'),
//                 );
//               }),
//         );
//   }
//
//   Future<void> getData() async {
//     var url = Uri.parse('https://bppshops.com/api/bannerCategory/view');
//     http.Response response = await http.get(url);
//     // print(response.body);
//     List<dynamic> body = jsonDecode(response.body);
//     bannerCategory =
//         body.map((dynamic item) => BannerCategory.fromJson(item)).toList();
//     setState(() {});
//   }
// }
