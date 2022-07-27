import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:bpp_shop/fashion/provider/top_Rated_provider.dart';
import 'package:bpp_shop/view/bpp/cart/cart_item.dart';
import 'package:bpp_shop/view/grocery/controller/product_detail_data_controller.dart';


import 'package:bpp_shop/view_model/bpp/wishlist_provider.dart';
import 'package:bpp_shop/view_model/bpp/app_provider.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/bottom_app_bar.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/history_screen/myOrder_provider.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/home_Screen/home_screen.dart';
import 'package:bpp_shop/view_model/bpp/order_proceed_view_model.dart';
import 'package:bpp_shop/view_model/islamic/drawer_data_viewmodel.dart';
import 'package:page_transition/page_transition.dart';
import 'package:bpp_shop/view_model/bpp/order_provider.dart';
import 'package:bpp_shop/view_model/bpp/cart_provider.dart';
import 'package:bpp_shop/view/islamic/productDetails/product%20details.dart';
import 'package:country_code_picker/country_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'FASHION/Provider/all_brand_filter_provider.dart';
import 'FASHION/Provider/banner_provider.dart';
import 'FASHION/Provider/brand_provider.dart';
import 'FASHION/Provider/categories_Provider.dart';
import 'FASHION/Provider/hot_deals_provider.dart';
import 'component/cart.dart';
import 'fashion/Screen/fashion_home_page.dart';
import 'fashion/fashion_product_details/fashion_product_details.dart';
import 'fashion/grocery/grocery_drawer_view_model.dart';
import 'fashion/provider/fashion_color.dart';
import 'fashion/provider/fashion_product_details.dart';
import 'fashion/provider/latestProvider.dart';
import 'FASHION/Screen/brands_flitter.dart';
import 'FASHION/Widget/check_box.dart';
import 'fashion/widget/product_page.dart';

final List<String> imgList = [
  'images/bike.png',
  'images/headPhone.png',
  'images/phone.png',
  'images/food.png',
  'images/bike.png',
]; //from rahim

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BannerProvider>(create: (BuildContext) => BannerProvider()),
        ChangeNotifierProvider<LatestProvider>(create: (BuildContext) => LatestProvider()),
        ChangeNotifierProvider<BrandProvider>(create: (BuildContext) => BrandProvider()),
        ChangeNotifierProvider<HotDealsProvider>(create: (BuildContext) => HotDealsProvider()),
        ChangeNotifierProvider<CatgoriesProvider>(create: (BuildContext) => CatgoriesProvider()),
        ChangeNotifierProvider<AllBrandfilterProvider>(create: (BuildContext) => AllBrandfilterProvider()),
        ChangeNotifierProvider.value(value: BppApps()),
        ChangeNotifierProvider<TopRatedProvider>(create: (BuildContext) => TopRatedProvider()),
        ChangeNotifierProvider<FashionDetailsController>(create: (BuildContext) => FashionDetailsController()),
        ChangeNotifierProvider<FashionColor>(create: (BuildContext) => FashionColor()),
        //ChangeNotifierProvider.value(value: Cancelled2()),
        //ChangeNotifierProvider.value(value: SubCategoriesProvide()),
        ChangeNotifierProvider.value(value: BannerProvider()),
        ChangeNotifierProvider.value(value: BrandProvider()),
        ChangeNotifierProvider.value(value: HotDealsProvider()),
        ChangeNotifierProvider.value(value: BppApps()),
        ChangeNotifierProvider.value(value: Cart()),
        ChangeNotifierProvider.value(value: Cart1()),
        ChangeNotifierProvider.value(value: Wish()),
        ChangeNotifierProvider.value(value: Order()),
        ChangeNotifierProvider.value(value: ProductDetailDataController()),
        ChangeNotifierProvider.value(value: MyOrderProvider()), //CustomScafoldKey
        ChangeNotifierProvider.value(value: DrawerViewModel()),
        ChangeNotifierProvider.value(value: GroceryDrawerViewModel()), //CustomScafoldKey
        ChangeNotifierProvider.value(value: OrderProceedViewModel()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 640),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          final drawerProvider = Provider.of<DrawerViewModel>(context, listen: false);drawerProvider.loadDrawerData();
          final gdrawerProvider = Provider.of<GroceryDrawerViewModel>(context);gdrawerProvider.loadGDrawerData();
          final orderProceedViewModel = Provider.of<OrderProceedViewModel>(context);orderProceedViewModel.loadAddressList();

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              fontFamily: GoogleFonts.robotoSlab().fontFamily,
              scaffoldBackgroundColor: Colors.white,
              canvasColor: Colors.transparent,
              primarySwatch: Colors.amber,
            ),
            supportedLocales: [
              Locale("af"),
              Locale("am"),
              Locale("ar"),
              Locale("az"),
              Locale("be"),
              Locale("bg"),
              Locale("bn"),
              Locale("bs"),
              Locale("ca"),
              Locale("cs"),
              Locale("da"),
              Locale("de"),
              Locale("el"),
              Locale("en"),
              Locale("es"),
              Locale("et"),
              Locale("fa"),
              Locale("fi"),
              Locale("fr"),
              Locale("gl"),
              Locale("ha"),
              Locale("he"),
              Locale("hi"),
              Locale("hr"),
              Locale("hu"),
              Locale("hy"),
              Locale("id"),
              Locale("is"),
              Locale("it"),
              Locale("ja"),
              Locale("ka"),
              Locale("kk"),
              Locale("km"),
              Locale("ko"),
              Locale("ku"),
              Locale("ky"),
              Locale("lt"),
              Locale("lv"),
              Locale("mk"),
              Locale("ml"),
              Locale("mn"),
              Locale("ms"),
              Locale("nb"),
              Locale("nl"),
              Locale("nn"),
              Locale("no"),
              Locale("pl"),
              Locale("ps"),
              Locale("pt"),
              Locale("ro"),
              Locale("ru"),
              Locale("sd"),
              Locale("sk"),
              Locale("sl"),
              Locale("so"),
              Locale("sq"),
              Locale("sr"),
              Locale("sv"),
              Locale("ta"),
              Locale("tg"),
              Locale("th"),
              Locale("tk"),
              Locale("tr"),
              Locale("tt"),
              Locale("uk"),
              Locale("ug"),
              Locale("ur"),
              Locale("uz"),
              Locale("vi"),
              Locale("zh")
            ],
            localizationsDelegates: [
              CountryLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            home: AnimatedSplashScreen(
              duration: 2000,
              splash: SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset("assets/ic_launcher copy.png")),
              nextScreen: BottomNavBar(
                currentTab: 0,
                currentScreen: HomeScreen(),
              ),
              splashTransition: SplashTransition.sizeTransition,
              pageTransitionType: PageTransitionType.leftToRight,
              backgroundColor: Colors.white,
            ),
            routes: {
              ProductDetails.routeName: (context) => ProductDetails(),
              Fashion_Product_Details.routeName: (context) => Fashion_Product_Details(),
            },
          );
        },
      ),
    );
  }
}
