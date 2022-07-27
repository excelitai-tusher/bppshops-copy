import 'dart:convert';
import 'package:bpp_shop/models/islamic/daily_best_sell.dart';
import 'package:http/http.dart'as http;

Future<List<DailyBestSales>?> getDailyBestSell() async {
  final response = await http
      .get(Uri.parse('https://bppshops.com/api/dailyBestSales'));
  if (response.statusCode == 200) {
    final json=jsonDecode(response.body);
    DailyBestSell dailyBestSellData =DailyBestSell.fromJson(json);
    return dailyBestSellData.dailyBestSales;

  } else {
    throw Exception('Failed to load');
  }

}
