

import 'package:bpp_shop/fashion/Api_Service/banner_service.dart';
import 'package:bpp_shop/fashion/model/Fashion_Model/banner_model.dart';
import 'package:flutter/material.dart';

class BannerProvider extends ChangeNotifier {
  List<Banners> bannerList=[];
 // List<Banners> get _bannerList=> bannerList ;
bool isLoading=false;
 void getBannerProvide() async {
    isLoading=true;
    final data = await BannerService().getBannerService();

    bannerList = data.banner!;
    isLoading=false;

    notifyListeners();
  }
}
