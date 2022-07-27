import 'dart:convert';
import 'package:bpp_shop/models/islamic/most_popular.dart';
import 'package:http/http.dart'as http;

Future<List<MostPopularAll>?> getPopularData() async {
  final response = await http
      .get(Uri.parse('https://bppshops.com/api/most_popular_all'));

  if (response.statusCode == 200) {
    final json=jsonDecode(response.body);
    MostPopular mostPopularData =MostPopular.fromJson(json);
    return mostPopularData.mostPopularAll;
  } else {
    throw Exception('Failed to load');
  }

}
