import 'dart:convert';
import 'package:bpp_shop/models/grocery/top_selling_model.dart';
import 'package:http/http.dart'as http;


Future<List<GroceryTopSelling>> getSellingProduct() async {
  final response = await http
      .get(Uri.parse('https://bppshops.com/api/top_selling_2'));

  if (response.statusCode == 200) {
    final json=jsonDecode(response.body);

    GroceryTopSellingProduct topSellingProductData =GroceryTopSellingProduct.fromJson(json);
    return topSellingProductData.popularProduct!;

  } else {
    throw Exception('Failed to load');
  }

}