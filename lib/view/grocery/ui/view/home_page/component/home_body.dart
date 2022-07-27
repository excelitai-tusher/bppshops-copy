import 'package:bpp_shop/view/grocery/ui/view/home_page/component/daily_best_sell_list_view.dart';
import 'package:bpp_shop/view/grocery/ui/view/home_page/component/g_banner.dart';
import 'package:bpp_shop/view/grocery/ui/view/home_page/component/popular_product_list_view.dart';
import 'package:flutter/material.dart';
import 'bundle_offers_list_view.dart';
import 'categories_list_view.dart';
import 'custom_tab_bar_left.dart';
import 'custom_tab_bar_right.dart';
import 'deals_of_the_day_list_view.dart';
import 'home_page_titles.dart';
import 'image_slide_show.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomHomePageTitles(
            leadingTitle: "Categories",
            trailingTitle: "See All",
          ),
          SizedBox(
            height: 10,
          ),
          CategoriesListView(),

          ImageSlideShowCustom(),
          CustomHomePageTitles(
            leadingTitle: "Bundle Offers",
            trailingTitle: "See All",
          ),
          BundleOffersListView(),

          CustomHomePageTitles(
            leadingTitle: "Popular",
            trailingTitle: "See All",
          ),
          PopularProductListView(),
          SizedBox(
            height: 10,
          ),
          CustomHomePageTitles(
            leadingTitle: "Daily Best Sells",
            trailingTitle: "See All",
          ),
          DailyBestSellListView(),
          CustomHomePageTitles(
            leadingTitle: "Deals Of The Day",
            trailingTitle: "View All",
          ),
          DealsOfTheDayListView(),
          SizedBox(
            height: 10,
          ),
          GroceryHomeBanner(),
          CustomTabBarRight(
            tab1: "Top Selling",
            tab2: "Trending Products",
          ),

          CustomTabBarLeft(
            tab1: "Recently Added",
            tab2: "Top Rated",
          ),
        ],
      ),
    );
  }
}
