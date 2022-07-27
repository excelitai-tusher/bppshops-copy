import 'dart:convert';
import 'package:bpp_shop/models/grocery/grocery_banner.dart';
import 'package:http/http.dart'as http;

Future<Banner12> getGroceryBanner() async {
  final response = await http
      .get(Uri.parse('https://bppshops.com/api/banner1_2'));
  if (response.statusCode == 200) {
    final json=jsonDecode(response.body);

    GroceryBanner bannerData =GroceryBanner.fromJson(json);
    return bannerData.banner12!;

  } else {

    throw Exception('Failed to load ${response.statusCode}///////');
  }

}