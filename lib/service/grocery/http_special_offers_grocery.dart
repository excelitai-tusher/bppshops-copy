import 'dart:convert';
import 'package:bpp_shop/models/grocery/grocery_special_offers.dart';

import 'package:http/http.dart'as http;

Future<List<GSpecialOffers>?> getGSpecialOffer() async {
  final response = await http
      .get(Uri.parse('https://bppshops.com/api/special_offers_2'));


  if (response.statusCode == 200) {
    final json=jsonDecode(response.body);

    GrocerySpecialOffers specialOfferData =GrocerySpecialOffers.fromJson(json);
    return specialOfferData.specialOffers;

  } else {

    throw Exception('Failed to load SpecialOffer');
  }

}
