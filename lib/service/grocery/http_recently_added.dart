import 'dart:convert';

import 'package:bpp_shop/models/grocery/recently_added_model.dart';
import 'package:http/http.dart'as http;


Future<List<GRecentlyAdded>> getGRecentAdded() async {
  final response = await http.get(Uri.parse('https://bppshops.com/api/recently_added_2'));

  if (response.statusCode == 200) {
    final json=jsonDecode(response.body);

    Grocery_recently_added topSellingProductData =Grocery_recently_added.fromJson(json);
    return topSellingProductData.recentlyAdded!;
  } else {
    throw Exception('Failed to load');
  }

}