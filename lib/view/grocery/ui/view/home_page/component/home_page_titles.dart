import 'package:bpp_shop/view/grocery/ui/view/category%20page/category.dart';
import 'package:bpp_shop/view/grocery/ui/view/home_page/component/bundle_offers_see_all.dart';
import 'package:bpp_shop/view/grocery/ui/view/home_page/component/daily_best_sell_see_all.dart';
import 'package:bpp_shop/view/grocery/ui/view/home_page/component/deal_of_day_see_all.dart';
import 'package:bpp_shop/view/grocery/ui/view/home_page/component/popular_see_all.dart';
import 'package:bpp_shop/view/grocery/ui/view/home_page/component/special_offers_list_view.dart';
import 'package:flutter/material.dart';

import '../../../constant/app_colors.dart';

class CustomHomePageTitles extends StatelessWidget {
  CustomHomePageTitles(
      {Key? key, this.leadingTitle, this.trailingTitle, this.sp})
      : super(key: key);
  String? leadingTitle;
  String? trailingTitle;
  String? sp;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leadingTitle!,
            style: TextStyle(fontSize: 20, color: titleFontColor),
          ),
          GestureDetector(
            onTap: () {
              if (leadingTitle == "Special Offers") {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => SpecialOfferListView()));
              }
              if (leadingTitle == "Bundle Offers") {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => BundleOfferSeeAll()));
              }
              if (leadingTitle == "Categories") {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => AllCategory()));
              }
              if (leadingTitle == "Popular") {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => PopularSeeAll()));
              }
              if (leadingTitle == "Deals Of The Day") {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => DealsOfTheDaySeeAll()));
              }
              if (leadingTitle == "Daily Best Sells") {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => DailyBestSellSeeAll()));
              }
            },
            child: Text(
              trailingTitle!,
              style: TextStyle(
                color: primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
