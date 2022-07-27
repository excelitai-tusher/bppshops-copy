import 'dart:convert';
import 'package:bpp_shop/view_model/bpp/cart_provider.dart';
import 'package:bpp_shop/view_model/bpp/order_provider.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/bottom_app_bar.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/home_Screen/home_screen.dart';
import 'package:bpp_shop/view/bpp/order/order_details.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:time_range/time_range.dart';
import 'package:intl/intl.dart';
import '../../../view_model/bpp/order_proceed_view_model.dart';
import '../../../models/bpp/address_model.dart';
import 'manage_delivery_address.dart';

class OrderProceedScreen extends StatefulWidget {
  const OrderProceedScreen({Key? key}) : super(key: key);
  @override
  State<OrderProceedScreen> createState() => _OrderProceedScreenState();
}

class _OrderProceedScreenState extends State<OrderProceedScreen> {
  var date = DateFormat.MMMEd().format(DateTime.now());
  List<String> dateList = [
    DateFormat.MMMEd().format(DateTime.now()),
    DateFormat.MMMEd().format(DateTime.now().add(Duration(days: 1))),
    DateFormat.MMMEd().format(DateTime.now().add(Duration(days: 2))),
    DateFormat.MMMEd().format(DateTime.now().add(Duration(days: 3))),
    DateFormat.MMMEd().format(DateTime.now().add(Duration(days: 4))),
  ];
  String? _selectDate;
  bool? Cash_on_Delivery = true;
  bool? Bank_Card = false;
  bool? Mobile_Banking = false;
  bool isSelectAddress = false;
  int selectedIndex = -1;

  List<AddressModel> addressList = [];

  TextEditingController nameController = TextEditingController();
  final now = DateTime.now();
  static const dark = Color(0xFF333A47);
  static const double leftPadding = 50;
  TimeRangeResult? _timeRange;

  @override
  Widget build(BuildContext context) {
    final orderProceedViewModel =
        Provider.of<OrderProceedViewModel>(context, listen: false);

    final cart = Provider.of<Cart>(context);
    print(addressList.length.toString());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text("Manage Address"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: ManageDeliveryAddress(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Container(
                margin: EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey)),
                height: 200,
                width: 350,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 7, left: 10, right: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.watch_later),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "Preferred Delivery Time",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blueGrey,
                              ),
                            ),
                          )
                          //  When Would You Like Your Regular Delivery ?
                        ],
                      ),
                    ),
                    Container(
                      height: 40,
                      child: Divider(
                        height: 40,
                        color: Colors.grey,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.hourglass_bottom_sharp),
                        Text(
                          "When Would You Like Your Regular Delivery ?",
                          style: TextStyle(fontSize: 14),
                        )
                        //  When Would You Like Your Regular Delivery ?
                      ],
                    ),
                    Row(
                      children: [
                        Card(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              children: [
                                Text(
                                  'Date',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Row(
                                  children: [
                                    DropdownButton(
                                      dropdownColor: Colors.white,
                                      underline: Container(
                                        color: Colors.white,
                                      ),
                                      hint: Text(
                                          'Pick A Date'), // Not necessary for Option 1
                                      value: _selectDate,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectDate = newValue as String?;
                                        });
                                      },
                                      items: dateList.map((location) {
                                        return DropdownMenuItem(
                                          child: new Text(location),
                                          value: location,
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Column(
                              children: [
                                Text(
                                  'Time',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Row(
                                  children: [
                                    Text(_timeRange == null
                                        ? 'Choose Time'
                                        : ' ${_timeRange!.start.format(context)} - ${_timeRange!.end.format(context)}'),
                                    IconButton(
                                      onPressed: () {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          // Add Your Code here.
                                          showModalBottomSheet<void>(
                                            isDismissible: true,
                                            isScrollControlled: true,
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Container(
                                                // margin: EdgeInsets.symmetric(horizontal: 10),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6)),
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 20),
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      .3,
                                                  child: TimeRange(
                                                    fromTitle: Text(
                                                      'FROM',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: dark,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    toTitle: Text(
                                                      'TO',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: dark,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    titlePadding: leftPadding,
                                                    textStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: dark,
                                                    ),
                                                    activeTextStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                    borderColor: dark,
                                                    activeBorderColor: dark,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    activeBackgroundColor:
                                                        Theme.of(context)
                                                            .colorScheme
                                                            .primary,
                                                    firstTime: TimeOfDay(
                                                        hour: now.hour,
                                                        minute: now.minute),
                                                    // firstTime:now.compareTo(dt)<=0? TimeOfDay(
                                                    //     hour: 8, minute: 30):TimeOfDay(
                                                    //     hour: 9, minute: 30),
                                                    lastTime: TimeOfDay(
                                                        hour: 22, minute: 00),
                                                    initialRange: _timeRange,
                                                    timeStep: 10,
                                                    timeBlock: 30,
                                                    onRangeCompleted: (range) =>
                                                        setState(
                                                      () => _timeRange = range,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        });
                                      },
                                      icon: Icon(Icons.arrow_drop_down),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Payment Method",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            cart.items.isNotEmpty
                ? Center(
                    child: Text(
                      "৳ 50 Delivery charge included",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  )
                : Container(),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (cart.items.isNotEmpty)
                  GestureDetector(
                    onTap: _selectDate == null ||
                            orderProceedViewModel.addressList.length == 0 ||
                            _timeRange == null
                        ? showToast
                        : () async {
                            Response response = await Provider.of<Order>(
                                    context,
                                    listen: false)
                                .addOrder(
                                    cart.items.values.toList(),
                                    cart.totalAmount,
                                    _selectDate!,
                                    "${_timeRange!.start.format(context)}-${_timeRange!.end.format(context)}");
                            cart.clearCart();
                            if (response.statusCode == 200) {
                              final json = jsonDecode(response.body);
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BPPOrderDetails(
                                            orderId: json["order"]["order_id"],
                                            deliveryTime: json["order"]
                                                ["delivery_time"],
                                            paymentMethod: json["order"]
                                                ["payment_method"],
                                            invoiceNumber: json["order"]
                                                ["invoice_no"],
                                            amount: json["order"]["amount"],
                                            deliveryCharge: json["order"]
                                                ["delivery_charge"],
                                            streetAddress: json["order"]
                                                ["street_address"],
                                          )),
                                  (route) => false);
                            } else {
                              throw "Error : ${response.statusCode} ??????????????";
                            }
                          },
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * .5,
                      color: Color(0xFFFE9A75),
                      child: Center(
                        child: Text(
                          "Proceed",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  )
                else
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Color(0xFFFE9A75)),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BottomNavBar(
                                    currentTab: 0,
                                    currentScreen: HomeScreen(),
                                  )),
                          (route) => false);
                    },
                    child: Text(
                      "HomePage",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                cart.items.isNotEmpty
                    ? Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width * .2,
                        decoration: BoxDecoration(
                          color: Colors.red,
                        ),
                        child: Center(
                          child: Text(
                            "৳ ${cart.totalAmount}",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }

  void showToast() {
    final orderProceedViewModel =
        Provider.of<OrderProceedViewModel>(context, listen: false);
    Fluttertoast.showToast(
      msg: orderProceedViewModel.addressList.length == 0
          ? "Please add address"
          : _selectDate == null
              ? "Please set Delivery Date"
              : _timeRange == null
                  ? 'Please set Delivery Time'
                  : 'somossha',
      toastLength: Toast.LENGTH_SHORT,
      textColor: Colors.red,
      backgroundColor: Colors.grey,
      gravity: ToastGravity.BOTTOM,
    );
  }
}
