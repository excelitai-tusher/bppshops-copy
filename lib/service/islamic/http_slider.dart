import 'dart:convert';
import 'package:bpp_shop/models/islamic/slider.dart';
import 'package:http/http.dart'as http;

Future<List<Sliders>?> getSlider() async {
  final response = await http
      .get(Uri.parse('https://bppshops.com/api/slider'));

  if (response.statusCode == 200) {
    final json=jsonDecode(response.body);
    MainSlider sliderData =MainSlider.fromJson(json);
    return sliderData.slider;

  } else {

    throw Exception('Failed to load');
  }

}