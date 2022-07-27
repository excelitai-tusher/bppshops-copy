import 'dart:convert';

import 'package:bpp_shop/view/bpp/bottomAppBar/history_screen/OrderModel.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/history_screen/order_details_model.dart';
import 'package:http/http.dart' as http;

class HttpServices{
  Future<List<OrderModel>> getMyOrderServices(String token) async{
    List<OrderModel> orderList =[];

    final url = Uri.parse("https://bppshops.com/api/user/my/orders",);
    var response = await http.get(url,
        headers: {
          'Authorization': "Bearer ${token}",//47|ZSoxBWu2Nar7x6B4c7xIqxr4fmKmrjGNMHtwZ1lI"
        });

    if(response.statusCode==200){
      List<dynamic> data = jsonDecode(response.body);

      data.forEach((element) {
        OrderModel orderModel = OrderModel.fromJson(element);
        orderList.add(orderModel);
      });

      return orderList;
    }
    else{
      return [];
    }
  }

   Future<String> canceledOrderServices(int orderId,String token) async{
    
    final url = Uri.parse("https://bppshops.com/api/cancelorder/$orderId");

    var response = await http.get(url,
        headers: {
          'Authorization': "Bearer ${token}",//47|ZSoxBWu2Nar7x6B4c7xIqxr4fmKmrjGNMHtwZ1lI"
        });
    if(response.statusCode==200){
      return "Order canceled successfully";
    }

    else{
      return "Failed to canceled";
    }
    
  }
  Future<OrderDetailsModel> getOrderDetails(int orderId,String token) async {
    final url = Uri.parse("https://bppshops.com/api/user/order_details/$orderId");
    var response = await http.get(url,
        headers: {
          'Authorization': "Bearer ${token}",//47|ZSoxBWu2Nar7x6B4c7xIqxr4fmKmrjGNMHtwZ1lI"
        });

    if(response.statusCode==200){
      return OrderDetailsModel.fromJson(jsonDecode(response.body));
    }
    else{
      throw {response.statusCode};
    }
  }
}