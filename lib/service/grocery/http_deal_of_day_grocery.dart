import 'dart:convert';
import 'package:bpp_shop/models/grocery/deal_of_day_grocery.dart';
import 'package:http/http.dart'as http;

Future<List<DealOfDay>> getDealOfDay() async {
  final response = await http
      .get(Uri.parse('https://bppshops.com/api/deal_of_day'));

  if (response.statusCode == 200) {
    final json=jsonDecode(response.body);

    GroceryDealOfDay dealOfDayData =GroceryDealOfDay.fromJson(json);
    return dealOfDayData.dealOfDay!;

  } else {

    throw Exception('Failed to load');
  }

}