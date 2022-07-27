import 'package:flutter/material.dart';
import '../Api_Service/hot_deals_service.dart';
import '../model/Fashion_Model/hot_deals_model.dart';

class HotDealsProvider extends ChangeNotifier{//Allah
  List<HotDeal> hotDealList=[];
  getHotDealsProvider()async{
    var data= await HotDealsService().getHotDealService();
    hotDealList=data.hotDeals!;
    print('hotDeal Length ${hotDealList.length}');
 notifyListeners();
  }
}