import 'dart:convert';
import 'package:bpp_shop/models/grocery/grocery_daily_best_sell.dart';
import 'package:http/http.dart'as http;

Future<List<GDailyBestSales>> getGDailyBestSell() async {
  final response = await http
      .get(Uri.parse('https://bppshops.com/api/dailyBestSales_2'));

  if (response.statusCode == 200) {
    final json=jsonDecode(response.body);
    GroceryDailyBestSell dailyBestSellData =GroceryDailyBestSell.fromJson(json);
    return dailyBestSellData.dailyBestSales!;
  } else {

    throw Exception('Failed to load ${response.statusCode}');
  }

}