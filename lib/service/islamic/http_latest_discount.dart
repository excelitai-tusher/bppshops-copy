import 'dart:convert';
import 'package:bpp_shop/models/islamic/latest_discount_model.dart';
import 'package:http/http.dart'as http;

Future<List<Latestdiscountproduct>?> getlatestDiscountData() async {
  final response = await http
      .get(Uri.parse('https://bppshops.com/api/latestdiscountproduct'));

  if (response.statusCode == 200) {
    final json=jsonDecode(response.body);
    LatestDiscountProduct latestDiscountData =LatestDiscountProduct.fromJson(json);
    return latestDiscountData.latestdiscountproduct;

  } else {

    throw Exception('Failed to load');
  }

}