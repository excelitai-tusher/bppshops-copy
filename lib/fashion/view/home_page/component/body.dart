import 'package:bpp_shop/fashion/controller/app_bar_controler.dart';
import 'package:bpp_shop/fashion/controller/secondary_page_controller.dart';
import 'package:bpp_shop/fashion/view/home_page/component/best_selling_product.dart';
import 'package:bpp_shop/fashion/view/home_page/component/image_slide_show_custom.dart';
import 'package:bpp_shop/fashion/view/home_page/component/most_populler_HeadLine.dart';
import 'package:bpp_shop/fashion/view/home_page/component/most_populler_list_view_builder.dart';
import 'package:bpp_shop/fashion/view/home_page/component/new_arrivals_headline_button.dart';
import 'package:bpp_shop/fashion/view/home_page/component/new_arrivals_list_view.dart';
import 'package:bpp_shop/fashion/view/home_page/component/top_category_listview_builder.dart';
import 'package:bpp_shop/fashion/view/home_page/component/trending.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:provider/provider.dart';

import 'hot_deals.dart';
import 'best_selling_banner.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  // final CarouselController _controller = CarouselController();
  // //HotDealsModel list=HotDealsModel();
  // TabController? _controllerTab;
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   _controllerTab = TabController(length: 2, vsync: this);
  //   super.initState();
  // }
  //
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   _controllerTab!.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Top Categories", style: TextStyle(fontSize: 16.sp),),
                GestureDetector(
                  onTap: (){
                    final appBar =
                    Provider.of<PrimaryScreenState>(context, listen: false);
                    appBar.setPrimaryState(false);
                    final view = Provider.of<SecondaryPage>(context,
                        listen: false);
                    view.setSecondaryPage(1);
                  },
                  child: Text("View All", style: TextStyle(fontSize: 13.sp)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          TopCategoryListviewBuilder(),
          ImageSlideShowCustom(),

          ///
          ///
          /// Most populler
          ///
          ///
          MostPopullerHeadLine(),
          MostPopullerListViewBuilder(),

          ///
          ///
          /// Most populler
          ///
          ///
          SizedBox(
            height: 20.h,
          ),

          ///
          ///
          /// New Arrivals
          ///
          ///
          NewArrivalsHeadLineButton(),
          NewArrivalsListView(),

          ///
          ///
          /// New Arrivals
          ///
          ///
          SizedBox(
            height: 40.h,
          ),

          ///
          ///
          ///
          ///Special Offers
          ///
          ///
          ///
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/offers.png"), fit: BoxFit.fill)),
          ),
          SizedBox(
            height: 30.h,
          ),

          ///
          ///
          ///
          ///Offers banner
          ///
          ///
          ///
          BestSellingBanner(),
          SizedBox(
            height: 20.h,
          ),

          ///
          ///
          ///
          ///Best Selling Products
          ///
          ///
          ///
          BestSellingProduct(),

          ///
          ///
          ///
          ///Hot Deals
          ///
          ///
          SizedBox(
            height: 20.h,
          ),
          HotDeals(),

          ///
          ///
          /// Trending
          ///
          ///
          Trending(),
          Divider(),
        ],
      ),
    );
  }

  // final List<Widget> imageSliders = imgList
  //     .map((item) => Container(
  //           margin: EdgeInsets.all(5.0),
  //           child: Column(
  //             children: <Widget>[
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   CircleAvatar(
  //                     radius: 10,
  //                     backgroundColor: Colors.grey,
  //                     backgroundImage: AssetImage(
  //                       item.toString(),
  //                     ),
  //                   ),
  //                   CircleAvatar(
  //                     radius: 10,
  //                     backgroundColor: Colors.grey,
  //                     backgroundImage: AssetImage(
  //                       item.toString(),
  //                     ),
  //                   ),
  //                   CircleAvatar(
  //                     radius: 10,
  //                     backgroundColor: Colors.grey,
  //                     backgroundImage: AssetImage(
  //                       item.toString(),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               Text("Hero Thriller 160R"),
  //               Image.asset(item.toString(), fit: BoxFit.cover, width: 1000.0),
  //               Text("Hurry Up!"),
  //               Text("Offer ends in:"),
  //               //   Image.asset(item.toString(), fit: BoxFit.cover, width: 1000.0),
  //               //   Positioned(
  //               //     bottom: 0.0,
  //               //     left: 0.0,
  //               //     right: 0.0,
  //               //     child: Container(
  //               //       decoration: BoxDecoration(
  //               //         gradient: LinearGradient(
  //               //           colors: [
  //               //             Color.fromARGB(200, 0, 0, 0),
  //               //             Color.fromARGB(0, 0, 0, 0)
  //               //           ],
  //               //           begin: Alignment.bottomCenter,
  //               //           end: Alignment.topCenter,
  //               //         ),
  //               //       ),
  //               //       padding: EdgeInsets.symmetric(
  //               //           vertical: 10.0, horizontal: 20.0),
  //               //       child: Text(
  //               //         'No. ${imgList.indexOf(item)} image',
  //               //         style: TextStyle(
  //               //           color: Colors.white,
  //               //           fontSize: 20.0,
  //               //           fontWeight: FontWeight.bold,
  //               //         ),
  //               //       ),
  //               //     ),
  //               //   ),
  //             ],
  //           ),
  //         ))
  //     .toList();
}
