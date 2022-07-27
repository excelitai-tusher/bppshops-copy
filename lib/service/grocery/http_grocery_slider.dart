import 'dart:convert';
import 'package:bpp_shop/models/grocery/slider.dart';

import 'package:http/http.dart'as http;

Future<List<GSliders>> getGrocerySlider() async {
  final response = await http
      .get(Uri.parse('https://bppshops.com/api/slider_2'));

  if (response.statusCode == 200) {
    final json=jsonDecode(response.body);

    GrocerySlider gSlider =GrocerySlider.fromJson(json);
    return gSlider.slider!;

  } else {

    throw Exception('Failed to load');
  }

}