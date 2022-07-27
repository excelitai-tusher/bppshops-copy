import 'dart:convert';
import 'package:bpp_shop/models/islamic/bannar.dart';
import 'package:http/http.dart'as http;

Future<List<Banner1>?> getBanner() async {
  final response = await http.get(Uri.parse('https://bppshops.com/api/banner1'));

  if (response.statusCode == 200){
    final json=jsonDecode(response.body);
    Banner bannerData =Banner.fromJson(json);
    return bannerData.banner1;
  }else {
    throw Exception('Failed to load ... statuscode:${response.statusCode}');
  }
}