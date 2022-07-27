import 'dart:convert';
import 'package:bpp_shop/models/islamic/special_offers.dart';
import 'package:http/http.dart'as http;

Future<List<SpecialOffers>?> getSpecialOffer() async {
  final response = await http
      .get(Uri.parse('https://bppshops.com/api/special_offers'));


  if (response.statusCode == 200) {
    final json=jsonDecode(response.body);

    SpecialOffer specialOfferData =SpecialOffer.fromJson(json);
    return specialOfferData.specialOffers;

  } else {

    throw Exception('Failed to load SpecialOffer');
  }

}
