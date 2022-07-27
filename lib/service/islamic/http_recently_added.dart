import 'dart:convert';
import 'package:bpp_shop/models/islamic/recently_added_model.dart';
import 'package:http/http.dart'as http;

Future<List<RecentlyAdded>?> getRecentlyAdded() async {
  final response = await http
      .get(Uri.parse('https://bppshops.com/api/recently_added'));

  if (response.statusCode == 200) {
    final json=jsonDecode(response.body);
    RecentlyAddedProduct recentlyAddedData =RecentlyAddedProduct.fromJson(json);
    return recentlyAddedData.recentlyAdded;

  } else {

    throw Exception('Failed to load');
  }

}