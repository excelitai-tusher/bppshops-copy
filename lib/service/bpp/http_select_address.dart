import 'dart:convert';
import 'package:bpp_shop/service/bpp/local_storage_service.dart';
import 'package:http/http.dart' as http;
import 'package:bpp_shop/models/bpp/select_address_model.dart';
LocalStorageStore localStorageStore=LocalStorageStore();
Future<int> selectAddress(String addressId) async {
  final token=await localStorageStore.getUserToken();
  var response = await http.get(
      Uri.parse(
        "https://bppshops.com/api/checkout/info/select/check/${addressId}",
      ),
      headers: {
        'Content-type': 'application/json',
        'Authorization': "Bearer ${token}",
      });
  if (response.statusCode == 200){
    return response.statusCode;
  }
  else {
    throw Exception('Failed to load address');
  }
}