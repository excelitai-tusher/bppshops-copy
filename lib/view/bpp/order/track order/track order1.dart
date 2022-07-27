import 'dart:convert';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import '../../../../service/bpp/local_storage_service.dart';

class TrackOrder1 extends StatefulWidget {
  TrackOrder1({Key? key, required this.invoiceNumber}) : super(key: key);

  String invoiceNumber;
  @override
  _TrackOrder1State createState() => _TrackOrder1State();
}

class _TrackOrder1State extends State<TrackOrder1> {
  String? orderDate;
  String? shippingBy;
  String? contactNumber;
  String? paymentMethod;
  String? totalAmount;
  String? status;
  String orderStatusUrl = "https://bppshops.com/api/user/order/tracking";
  //LocalStorageStore
  getOrderStatus() async {
    String token = await LocalStorageStore().getUserToken();
    http.Response response = await http.post(
      Uri.parse(orderStatusUrl),
      body: {
        'invoice_no': widget.invoiceNumber.toString(),
      },
      headers:{
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
        'Authorization': "Bearer ${token}",
      },
    );
    if (response.statusCode == 200){
      final jsonBody = jsonDecode(response.body);
      print(jsonBody["status"]);
      setState((){
        orderDate=jsonBody["order_date"];
        shippingBy="Pranto Choudhuri";
        contactNumber="01700000000";
        paymentMethod=jsonBody["payment_method"];
        totalAmount=jsonBody["amount"];
      });
    } else {
      throw "ERROR : ${response.statusCode}";
    }
  }
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    print(widget.invoiceNumber.toString());
    getOrderStatus();
  }
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(45.521563, -122.677433);
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    Path customPath = Path()
      ..moveTo(0, 0)
      ..lineTo(0, 20);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, size: 25, color: Colors.black)),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            "Track Your Order",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              height: MediaQuery.of(context).size.height * .72,
              width: MediaQuery.of(context).size.height * .5,
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 7, left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Invoice Number",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                widget.invoiceNumber,
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Order Date",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    orderDate.toString(),
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  // SizedBox(width: 15),
                                  // Text(
                                  //   "12:51:16",
                                  //   style: TextStyle(
                                  //     color: Colors.grey,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      //margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                      child: Divider(
                        color: Colors.black,
                        height: 40,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 7, left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Shipping By ${shippingBy}",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "/",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Customer Mobile",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Number",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "015*********",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      //margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                      child: Divider(
                        color: Colors.black,
                        height: 40,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 7, left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Payment Method",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    paymentMethod.toString(),
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Total Amount",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    totalAmount.toString(),
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * .5,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  const Icon(
                                    Icons.check_circle_sharp,
                                    color: Colors.green,
                                    size: 30,
                                  ),
                                  DottedBorder(
                                    color: Colors.grey,
                                    customPath: (size) => customPath,
                                    strokeWidth: 1,
                                    strokeCap: StrokeCap.round,
                                    borderType: BorderType.Rect,
                                    dashPattern: const [2, 2],
                                    child: const SizedBox(
                                      width: 0,
                                      height: 20,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.check_circle_sharp,
                                    color: Colors.green,
                                    size: 30,
                                  ),
                                  DottedBorder(
                                    color: Colors.grey,
                                    customPath: (size) => customPath,
                                    strokeWidth: 1,
                                    strokeCap: StrokeCap.round,
                                    borderType: BorderType.Rect,
                                    dashPattern: const [2, 2],
                                    child: const SizedBox(
                                      width: 0,
                                      height: 20,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.check_circle_sharp,
                                    color: Colors.green,
                                    size: 30,
                                  ),
                                  DottedBorder(
                                    color: Colors.grey,
                                    customPath: (size) => customPath,
                                    strokeWidth: 1,
                                    strokeCap: StrokeCap.round,
                                    borderType: BorderType.Rect,
                                    dashPattern: const [2, 2],
                                    child: const SizedBox(
                                      width: 0,
                                      height: 20,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.check_circle_sharp,
                                    color: Colors.green,
                                    size: 30,
                                  ),
                                  DottedBorder(
                                    color: Colors.grey,
                                    customPath: (size) => customPath,
                                    strokeWidth: 1,
                                    strokeCap: StrokeCap.round,
                                    borderType: BorderType.Rect,
                                    dashPattern: const [2, 2],
                                    child: const SizedBox(
                                      width: 0,
                                      height: 20,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.check_circle_sharp,
                                    color: Colors.green,
                                    size: 30,
                                  ),
                                  DottedBorder(
                                    color: Colors.grey,
                                    customPath: (size) => customPath,
                                    strokeWidth: 1,
                                    strokeCap: StrokeCap.round,
                                    borderType: BorderType.Rect,
                                    dashPattern: const [2, 2],
                                    child: const SizedBox(
                                      width: 0,
                                      height: 20,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.check_circle_sharp,
                                    color: Colors.green,
                                    size: 30,
                                  ),
                                  DottedBorder(
                                    color: Colors.grey,
                                    customPath: (size) => customPath,
                                    strokeWidth: 1,
                                    strokeCap: StrokeCap.round,
                                    borderType: BorderType.Rect,
                                    dashPattern: const [2, 2],
                                    child: const SizedBox(
                                      width: 0,
                                      height: 20,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 5),
                                  InkWell(
                                    onTap: () {
                                      //Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderHistory()));
                                    },
                                    child: Text(
                                      "Order Pending",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 38),
                                  Text(
                                    "Order Confirmed",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 35),
                                  Text(
                                    "Order Processing",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 38),
                                  Text(
                                    "Order Picked",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 35),
                                  Text(
                                    "Order Shipped",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 38),
                                  Text(
                                    "Delivered",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
