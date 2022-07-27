import 'package:flutter/cupertino.dart';

import '../Api_Service/latest_service.dart';
import '../model/Fashion_Model/latest_product.dart';

class LatestProvider extends ChangeNotifier{
  List<LatestProducts>getLatestlist=[];
  getLatestProvider()async{
    var data = await LatestService().getLatestService();
    getLatestlist=data.latestProducts!;
    print("LatestProduct:${getLatestlist.length}");
    notifyListeners();

  }
}