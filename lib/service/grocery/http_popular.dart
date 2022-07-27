import 'dart:convert';
import 'package:bpp_shop/models/grocery/most_popular.dart';
import 'package:http/http.dart'as http;

Future<List<GroceryMostPopularAll>> getGroceryPopularData() async {
  final response = await http
      .get(Uri.parse('https://bppshops.com/api/most_popular_all_2'));

  if (response.statusCode == 200) {
    final json=jsonDecode(response.body);

    GroceryPopular popularData =GroceryPopular.fromJson(json);
    return popularData.mostPopularAll!;

  } else {

    throw Exception('Failed to load');
  }

}
