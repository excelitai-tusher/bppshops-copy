// import 'package:bpp_shop/models/grocery/categories.dart';
// import 'package:bpp_shop/models/grocery/deal_of_day_grocery.dart';
// import 'package:bpp_shop/models/grocery/grocery_banner.dart';
// import 'package:bpp_shop/models/grocery/grocery_daily_best_sell.dart';
// import 'package:bpp_shop/models/grocery/most_popular.dart';
// import 'package:bpp_shop/models/grocery/recently_added_model.dart';
// import 'package:bpp_shop/models/grocery/slider.dart';
// import 'package:bpp_shop/models/grocery/top_selling_model.dart';
// import 'package:bpp_shop/models/grocery/trending_product_model.dart';
// import 'package:bpp_shop/service/grocery/http_categories.dart';
// import 'package:bpp_shop/service/grocery/http_daily_best_sell.dart';
// import 'package:bpp_shop/service/grocery/http_deal_of_day_grocery.dart';
// import 'package:bpp_shop/service/grocery/http_grocery_banner.dart';
// import 'package:bpp_shop/service/grocery/http_grocery_slider.dart';
// import 'package:bpp_shop/service/grocery/http_popular.dart';
// import 'package:bpp_shop/service/grocery/http_recently_added.dart';
// import 'package:bpp_shop/service/grocery/http_top_selling.dart';
// import 'package:bpp_shop/service/grocery/http_tranding.dart';
// import 'package:flutter/cupertino.dart';
//
// class GHomeViewModel with ChangeNotifier {
//   Banner12? gbanners;
//   List<GCategory>? gcategoryList;
//   List<GSliders>? gSliders;
//   List<GDailyBestSales>? gdailyBestSelList;
//   List<DealOfDay>? gDealOfDayList;
//   List<GroceryMostPopularAll>? gPopularDataList;
//   List<GRecentlyAdded>? gRecentAddedList;
//   List<GroceryTopSelling>? gSellingProductlList;
//   List<GroceryTrendProducts>? gTrendProductlList;
//
//   void loadGHomeData() async {
//    // final gBanner = await getGroceryBanner();
//   //  final getSliderList = await getGrocerySlider();
//    // final gCateGoryList = await getGroceryCategories();
//    // final listOfDailyBestSell = await getGDailyBestSell();
//     final listOfDealOfDay = await getDealOfDay();
//     final listOfPopularData = await getGroceryPopularData();
//   final listOfRecentAdded = await getGRecentAdded();
//  final listOfSellingProduct = await getSellingProduct();
//  final listOfTrendProduct = await getGTrendProduct();
//
//    // gcategoryList = gCateGoryList;
//   //  gSliders = getSliderList;
//   //  gbanners = gBanner;
//   //  gdailyBestSelList = listOfDailyBestSell;
//     gDealOfDayList = listOfDealOfDay;
//     gPopularDataList = listOfPopularData;
//     gRecentAddedList = listOfRecentAdded;
//     gSellingProductlList = listOfSellingProduct;
//     gTrendProductlList = listOfTrendProduct;
//
//     notifyListeners();
//   }
// }
