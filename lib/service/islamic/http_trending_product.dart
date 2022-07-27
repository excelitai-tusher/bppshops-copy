import 'dart:convert';
import 'package:bpp_shop/models/islamic/trending_product_model.dart';
import 'package:http/http.dart'as http;

Future<List<TrendingProducts>?> getTrendingProduct() async {
  final response = await http
      .get(Uri.parse('https://bppshops.com/api/trendingProducts'));

  if (response.statusCode == 200) {
    final json=jsonDecode(response.body);
    TrendingProduct trendingProductData =TrendingProduct.fromJson(json);
    return trendingProductData.trendingProducts;

  } else {

    throw Exception('Failed to load');
  }

}