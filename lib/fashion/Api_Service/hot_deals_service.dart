

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../model/Fashion_Model/hot_deals_model.dart';
class HotDealsService {
  Future<HotDealModel> getHotDealService() async {
    Map<String, dynamic>? result;
    try {
      String url = 'https://bppshops.com/api/fashion/hotdeals';
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
     result = convert.jsonDecode(response.body);
        print( 'Hot Deal data: $result');
        return HotDealModel.fromJson(result!) ;
      }
    } catch (e) {
      print(e.toString());
    }
    return HotDealModel.fromJson(result!);
  }
}
