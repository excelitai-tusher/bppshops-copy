import 'package:bpp_shop/service/bpp/local_storage_service.dart';
import 'package:http/http.dart' as http;

Future<int> deleteAddressData(String id) async {
  final token = await LocalStorageStore().getUserToken();
  final response = await http.post(
    Uri.parse("https://bppshops.com/api/checkout/info/delete"),
    body: {
      "id": id,
    },
    headers: {
      'Accept': 'application/json',
      'Authorization':
      "Bearer ${token}", //47|ZSoxBWu2Nar7x6B4c7xIqxr4fmKmrjGNMHtwZ1lI"
    },
  );
  if (response.statusCode == 200) {
    print("delete : ${id} <<<<<<<<<<OK>>>>>>>>>>");
    return response.statusCode;
    print("delete : id");
    //return true;
  } else {
    throw "Error : Status code:${response.statusCode}";
    //return false;
  }
}
