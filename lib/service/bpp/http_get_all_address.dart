import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bpp_shop/models/bpp/address_model.dart';
import 'package:bpp_shop/service/bpp/local_storage_service.dart';

Future<List<AddressModel>> getAllAddressData() async {
  final token = await LocalStorageStore().getUserToken();
  List<AddressModel> _addressList = [];
  var response = await http.get(
    Uri.parse(
      "https://bppshops.com/api/checkout/info/all",
    ),
    headers: {
      'Content-type': 'application/json',
      'Authorization':
          "Bearer ${token}", //47|ZSoxBWu2Nar7x6B4c7xIqxr4fmKmrjGNMHtwZ1lI"
    },
  );

  if (response.statusCode == 200) {
    List<dynamic> json = jsonDecode(response.body);
    print(response.statusCode);

    json.forEach((element) {
      AddressModel addressModel = AddressModel.fromJson(element);
      _addressList.add(addressModel);
    });
    return _addressList;
  } else {
    throw "Error : Status code ${response.statusCode}";
  }
}
