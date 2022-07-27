import 'dart:convert';
import 'package:bpp_shop/models/bpp/select_address_model.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/bottom_app_bar.dart';
import 'package:bpp_shop/view/bpp/order/order_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:time_range/time_range.dart';
import 'package:intl/intl.dart';
import '../../../service/bpp/local_storage_service.dart';
import '../../../view_model/bpp/cart_provider.dart';
import '../../../view_model/bpp/order_provider.dart';
import '../bottomAppBar/home_Screen/home_screen.dart';
import 'Add_new_Address.dart';
import 'package:http/http.dart' as http;
import '../../../models/bpp/address_model.dart';


class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
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
 // bool isChangeAddress = true;
  int selectedIndex = -1;
//DelivaryAddress? selected;
  bool changeButton=false;
  //String? idAdd;
 // late Future<DelivaryAddress> selected;
  List<AddressModel> addressList = [];

  // void getSelectedAddress(){
  //   setState(() {
  //     selected=addressList.where((element) => element.status=="1").toList();
  //     print("selected list");
  //     print(selected);
  //     print("selected Address list");
  //   });
  // }

  TextEditingController nameController = TextEditingController();

  _Cash_on_Delivery(bool? value) {
    setState(() {
      Cash_on_Delivery = true;
    });
  }

  _Bank_Card(bool? value) {
    setState(() {
      Bank_Card = false;
    });
  }

  _Mobile_Banking(bool? value) {
    setState(() {
      Mobile_Banking = false;
    });
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2023, DateTime.now().day + 5),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      // setState(() {
      //   _selectDate = pickedDate;
      // });
    });
  }

  static const orange = Color(0xFFFE9A75);
  static const dark = Color(0xFF333A47);
  static const double leftPadding = 50;

  final _defaultTimeRange = TimeRangeResult(
    TimeOfDay(hour: 14, minute: 50),
    TimeOfDay(hour: 15, minute: 20),
  );
  TimeRangeResult? _timeRange;

  @override
  void initState() {
    super.initState();
    getAllAddressData();
    //getSelectedAddress();
 // selected = getSelectAddressData();
  }
  LocalStorageStore localStorageStore=LocalStorageStore();
String url ="https://bppshops.com/api/checkout/info/all";
  String deleteUrl="https://bppshops.com/api/checkout/info/delete";
  getAllAddressData() async {
    final token=await localStorageStore.getUserToken();
    List<AddressModel> _addressList = [];
    var response = await http.get(
        Uri.parse(
          "https://bppshops.com/api/checkout/info/all",
        ),
        headers: {
          'Content-type': 'application/json',
          'Authorization': "Bearer ${token}",//47|ZSoxBWu2Nar7x6B4c7xIqxr4fmKmrjGNMHtwZ1lI"
        });

    if (response.statusCode == 200) {
      List<dynamic> json = jsonDecode(response.body);
      print(response.statusCode);

      json.forEach((element) {
        AddressModel addressModel = AddressModel.fromJson(element);
        _addressList.add(addressModel);

        setState(() {
          addressList = _addressList;

        });
      });
    }
  }
 //
 // getAddress();
 Future<DelivaryAddress> getSelectAddressData(String addressId) async {
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
    final json = jsonDecode(response.body);
    print(response.body);
    SelectAddress selectAddressData =SelectAddress.fromJson(json);
    return selectAddressData.address!;
    }
    else {

      throw Exception('Failed to load address');
    }
  }

  deletAddressData(int id) async {
    final token=await localStorageStore.getUserToken();
    final response = await http.post(Uri.parse(deleteUrl),body:{
      "id":id.toString()
    },headers: {
      'Authorization': "Bearer ${token}",
    });
    if(response.statusCode ==200){
      print("delete : id");
      //return true;
    }else{
      //return false;
    }
  }
  @override
  Widget build(BuildContext context) {

    final cart = Provider.of<Cart>(context);
    print(addressList.length.toString());
   // final addressModelDemo = Provider.of<AddressModelDemo>(context);
    final size = MediaQuery.of(context).size;
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
              child: Container(
                decoration: BoxDecoration(
                  //color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                height:
                    addressList.isEmpty ? 145 : 145 + addressList.length * 60,
                width: size.width * .9,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.black,
                            size: 25,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Select a deliver Address",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Divider(
                        height: 40,
                        color: Colors.black,
                      ),
                    ),

                    addressList.isEmpty||changeButton==true?GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNewAddress()));
                      },
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width * .8,
                        decoration: BoxDecoration(

                          border: Border.all(width: 1, color: Colors.grey),

                        ),
                        child: Center(child: Text("+ Add Address")),
                      ),
                    ):Container(),
                    SizedBox(
                      height: 20,
                    ),

                    addressList.isNotEmpty &&changeButton==false?
                    Container(
                      height: addressList.length * 60,
                      width: MediaQuery.of(context).size.width * .8,
                      //color: Colors.red,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          // return  GestureDetector(
                          //   onTap: () {
                          //     setState(() {
                          //       // getSelectAddressData("${addressList[index].id}");
                          //       idAdd= "${addressList[index].id}";
                          //       print("${addressList[index].id}");
                          //       // isSelectAddress = !isSelectAddress;
                          //       // selectedIndex = index;
                          //     });
                          //   },
                          return addressList[index].status=="1"?Container(
                              margin: EdgeInsets.only(top: 5, bottom: 5),
                              padding: EdgeInsets.only(
                                top: 5,
                                left: 15,
                              ),
                              height: 50,
                              width:
                              MediaQuery.of(context).size.width * .8,
                              decoration: BoxDecoration(
                                  color: Color(0xffECF9EB),

                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.black12, width: .5)),
                              child: Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(addressList[index]
                                          .streetAddress
                                          .toString()),
                                      Row(
                                        children: [
                                          Text(
                                            addressList[index]
                                                .postCodes!.postOffice
                                                .toString() +
                                                ",",
                                            style: TextStyle(
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 12),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                              addressList[index]
                                                  .postCodes!.upazila
                                                  .toString(),
                                              style: TextStyle(
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  fontSize: 12)),
                                        ],
                                      )
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 20),
                                    child: Center(
                                      // index == selectedIndex &&
                                      //     isSelectAddress?
                                    child:  TextButton(
                                        onPressed: () {
                                          changeButton=true;
                                            // deletAddressData(addressList[index].id!);
                                            // getAllAddressData();
                                            // //Navigator.of(ctx).pop(true);

                                        },
                                        child: Text(
                                          'Change',
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 12),

                                        ),
                                      ),

                                    ),
                                  )
                                ],
                              ),
                            ):Container(
                            height: 50,
                            color: Colors.green,
                          );

                        },
                      ),
                    ):   addressList.isNotEmpty?
                    Container(
                      height: addressList.length * 60,
                      width: MediaQuery.of(context).size.width * .8,
                      //color: Colors.red,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: addressList.length ,
                        itemBuilder: (context, index) {
                          return  GestureDetector(
                            onTap: () {
                              setState(() {
                                getSelectAddressData("${addressList[index].id}");
                               // idAdd= "${addressList[index].id}";
                                print("${addressList[index].id}");
                                // isSelectAddress = !isSelectAddress;
                                // selectedIndex = index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 5, bottom: 5),
                              padding: EdgeInsets.only(
                                top: 5,
                                left: 15,
                              ),
                              height: 50,
                              width:
                              MediaQuery.of(context).size.width * .8,
                              decoration: BoxDecoration(
                                  color:
                                  addressList[index].status=="1"
                                  // index == selectedIndex &&
                                  //     isSelectAddress
                                      ? Color(0xffECF9EB)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.black12, width: .5)),
                              child: Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(addressList[index]
                                          .streetAddress
                                          .toString()),
                                      Row(
                                        children: [
                                          Text(
                                            addressList[index]
                                                .postCodes!.postOffice
                                                .toString() +
                                                ",",
                                            style: TextStyle(
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 12),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                              addressList[index]
                                                  .postCodes!.upazila
                                                  .toString(),
                                              style: TextStyle(
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  fontSize: 12)),
                                        ],
                                      )
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 20),
                                    child: Center(
                                      child:addressList[index].status=="1"?
                                      // index == selectedIndex &&
                                      //     isSelectAddress?
                                      TextButton(
                                        onPressed: () {

                                            changeButton=true;
                                            // deletAddressData(addressList[index].id!);
                                            // getAllAddressData();
                                            // //Navigator.of(ctx).pop(true);

                                        },
                                        child: Text(
                                          'Change',
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 12),

                                        ),
                                      ):TextButton(
                                        onPressed: () {
                                          setState(() {
                                            deletAddressData(addressList[index].id!);
                                            getAllAddressData();
                                          });
                                        },
                                        child: Text(
                                          'Delete',
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 12),

                                        ),
                                      ),

                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ):Container(color: Colors.amber,
                    height: 50,),
















             //    addressList.isNotEmpty && changeButton==false?
             //  FutureBuilder<DelivaryAddress>(
             //    future:selected,
             //    builder: (context, snapshot) {
             //      if (snapshot.hasData) {
             //        return
             //          Container(
             //         //   height:  160,
             //            width: MediaQuery.of(context).size.width * .8,
             //            //color: Colors.red,
             //            child:  Container(
             //                margin: EdgeInsets.only(top: 5, bottom: 5),
             //                padding: EdgeInsets.only(
             //                  top: 5,
             //                  left: 15,
             //                ),
             //                height: 50,
             //                width:
             //                MediaQuery.of(context).size.width * .8,
             //                decoration: BoxDecoration(
             //                    color: Color(0xffECF9EB),
             //
             //                    borderRadius: BorderRadius.circular(10),
             //                    border: Border.all(
             //                        color: Colors.black12, width: .5)),
             //                child: Row(
             //                    crossAxisAlignment:
             //                    CrossAxisAlignment.center,
             //                    mainAxisAlignment:
             //                    MainAxisAlignment.spaceBetween,
             //                    children: [
             //                    Column(
             //                    crossAxisAlignment:
             //                    CrossAxisAlignment.start,
             //                    children: [
             //                    Text(snapshot.data!.streetAddress
             //                    .toString()),
             //            Row(
             //              children: [
             //                Text(
             //                  snapshot.data!
             //                      .postCodes!.postOffice
             //                      .toString() +
             //                      ",",
             //                  style: TextStyle(
             //                      fontWeight:
             //                      FontWeight.bold,
             //                      fontSize: 12),
             //                ),
             //                SizedBox(
             //                  width: 5,
             //                ),
             //                Text(
             //                    snapshot.data!
             //                        .postCodes!.upazila
             //                        .toString(),
             //                    style: TextStyle(
             //                        fontWeight:
             //                        FontWeight.bold,
             //                        fontSize: 12)),
             //              ],
             //            )
             //            ],
             //          ),
             //      Container(
             //      margin: EdgeInsets.only(right: 20),
             //      child: Center(
             //      child:
             //      TextButton(
             //      onPressed: () {
             //      setState(() {
             // changeButton=true;
             //      });
             //      },
             //      child: Text(
             //      'Change',
             //      style: TextStyle(
             //      color: Colors.green,
             //      fontSize: 12),
             //
             //      ),
             //      ),
             //      ),
             //      )
             //      ],
             //      ),
             //      ),);
             //      } else if (snapshot.hasError) {
             //        return     Text('${snapshot.error}');
             //      }
             //
             //      // By default, show a loading spinner.
             //      return const CircularProgressIndicator();
             //    },
             //  ):

                // addressList.isNotEmpty  && changeButton==true ?
                // Container(
                //       height: addressList.length * 60,
                //       width: MediaQuery.of(context).size.width * .8,
                //       //color: Colors.red,
                //       child: ListView.builder(
                //         physics: NeverScrollableScrollPhysics(),
                //         itemCount: addressList.length ,
                //         itemBuilder: (context, index) {
                //           return  GestureDetector(
                //             onTap: () {
                //               setState(() {
                //            // getSelectAddressData("${addressList[index].id}");
                //             idAdd= "${addressList[index].id}";
                //                 print("${addressList[index].id}");
                //                 // isSelectAddress = !isSelectAddress;
                //                 // selectedIndex = index;
                //               });
                //             },
                //             child: Container(
                //               margin: EdgeInsets.only(top: 5, bottom: 5),
                //               padding: EdgeInsets.only(
                //                 top: 5,
                //                 left: 15,
                //               ),
                //               height: 50,
                //               width:
                //               MediaQuery.of(context).size.width * .8,
                //               decoration: BoxDecoration(
                //                   color:
                //                   addressList[index].status=="1"
                //                   // index == selectedIndex &&
                //                   //     isSelectAddress
                //                       ? Color(0xffECF9EB)
                //                       : Colors.white,
                //                   borderRadius: BorderRadius.circular(10),
                //                   border: Border.all(
                //                       color: Colors.black12, width: .5)),
                //               child: Row(
                //                 crossAxisAlignment:
                //                 CrossAxisAlignment.center,
                //                 mainAxisAlignment:
                //                 MainAxisAlignment.spaceBetween,
                //                 children: [
                //                   Column(
                //                     crossAxisAlignment:
                //                     CrossAxisAlignment.start,
                //                     children: [
                //                       Text(addressList[index]
                //                           .streetAddress
                //                           .toString()),
                //                       Row(
                //                         children: [
                //                           Text(
                //                             addressList[index]
                //                                 .postCodes!.postOffice
                //                                 .toString() +
                //                                 ",",
                //                             style: TextStyle(
                //                                 fontWeight:
                //                                 FontWeight.bold,
                //                                 fontSize: 12),
                //                           ),
                //                           SizedBox(
                //                             width: 5,
                //                           ),
                //                           Text(
                //                               addressList[index]
                //                                   .postCodes!.upazila
                //                                   .toString(),
                //                               style: TextStyle(
                //                                   fontWeight:
                //                                   FontWeight.bold,
                //                                   fontSize: 12)),
                //                         ],
                //                       )
                //                     ],
                //                   ),
                //                   Container(
                //                     margin: EdgeInsets.only(right: 20),
                //                     child: Center(
                //                       child:addressList[index].status=="1"?
                //                       // index == selectedIndex &&
                //                       //     isSelectAddress?
                //                       TextButton(
                //                         onPressed: () {
                //                           setState(() {
                //                             // deletAddressData(addressList[index].id!);
                //                             // getAllAddressData();
                //                             // //Navigator.of(ctx).pop(true);
                //                           });
                //                         },
                //                         child: Text(
                //                           'Change',
                //                           style: TextStyle(
                //                               color: Colors.green,
                //                               fontSize: 12),
                //
                //                         ),
                //                       ):TextButton(
                //                         onPressed: () {
                //                           setState(() {
                //                             deletAddressData(addressList[index].id!);
                //                             getAllAddressData();
                //                           });
                //                           },
                //                         child: Text(
                //                           'Delete',
                //                           style: TextStyle(
                //                               color: Colors.red,
                //                               fontSize: 12),
                //
                //                         ),
                //                       ),
                //
                //                     ),
                //                   )
                //                 ],
                //               ),
                //             ),
                //           );
                //         },
                //       ),
                //     ):
                //     Container(),
                // FutureBuilder<DelivaryAddress>(
                //        future: selected,
                //        builder: (context, snapshot) {
                //          if (snapshot.hasData) {
                //            return
                //              Container(
                //                //   height:  160,
                //                width: MediaQuery.of(context).size.width * .8,
                //                //color: Colors.red,
                //                child:  Container(
                //                  margin: EdgeInsets.only(top: 5, bottom: 5),
                //                  padding: EdgeInsets.only(
                //                    top: 5,
                //                    left: 15,
                //                  ),
                //                  height: 50,
                //                  width:
                //                  MediaQuery.of(context).size.width * .8,
                //                  decoration: BoxDecoration(
                //                      color: Color(0xffECF9EB),
                //
                //                      borderRadius: BorderRadius.circular(10),
                //                      border: Border.all(
                //                          color: Colors.black12, width: .5)),
                //                  child: Row(
                //                    crossAxisAlignment:
                //                    CrossAxisAlignment.center,
                //                    mainAxisAlignment:
                //                    MainAxisAlignment.spaceBetween,
                //                    children: [
                //                      Column(
                //                        crossAxisAlignment:
                //                        CrossAxisAlignment.start,
                //                        children: [
                //                          Text(snapshot.data!.streetAddress
                //                              .toString()),
                //                          Row(
                //                            children: [
                //                              Text(
                //                                snapshot.data!
                //                                    .postCodes!.postOffice
                //                                    .toString() +
                //                                    ",",
                //                                style: TextStyle(
                //                                    fontWeight:
                //                                    FontWeight.bold,
                //                                    fontSize: 12),
                //                              ),
                //                              SizedBox(
                //                                width: 5,
                //                              ),
                //                              Text(
                //                                  snapshot.data!
                //                                      .postCodes!.upazila
                //                                      .toString(),
                //                                  style: TextStyle(
                //                                      fontWeight:
                //                                      FontWeight.bold,
                //                                      fontSize: 12)),
                //                            ],
                //                          )
                //                        ],
                //                      ),
                //                      Container(
                //                        margin: EdgeInsets.only(right: 20),
                //                        child: Center(
                //                          child:
                //                          TextButton(
                //                            onPressed: () {
                //                              setState(() {
                //                                changeButton=true;
                //                              });
                //                            },
                //                            child: Text(
                //                              'Change',
                //                              style: TextStyle(
                //                                  color: Colors.green,
                //                                  fontSize: 12),
                //
                //                            ),
                //                          ),
                //                        ),
                //                      )
                //                    ],
                //                  ),
                //                ),);
                //          } else if (snapshot.hasError) {
                //            return     Text('${snapshot.error}');
                //          }
                //
                //          // By default, show a loading spinner.
                //          return const CircularProgressIndicator();
                //        },
                //      ),
                 // :   Container(
                 //
                 //    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Container(
                margin: EdgeInsets.only(right:8),
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
                                      underline: Container(color: Colors.white,),
                                      hint: Text(
                                          'Pick A Date'), // Not necessary for Option 1
                                      value: _selectDate,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectDate =
                                          newValue as String?;
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
                                        showModalBottomSheet<void>(
                                          isDismissible: true,
                                          isScrollControlled: true,
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Container(
                                             // margin: EdgeInsets.symmetric(horizontal: 10),
                                              child: Container(
                                                decoration: BoxDecoration( color: Colors.white,
                                                  borderRadius: BorderRadius.circular(6)
                                                ),

                                                padding: EdgeInsets.symmetric(
                                                    vertical: 20),
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *.3,
                                                child: TimeRange(
                                                  fromTitle: Text(
                                                    'FROM',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: dark,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                  toTitle: Text(
                                                    'TO',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: dark,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                  titlePadding: leftPadding,
                                                  textStyle: TextStyle(
                                                    fontWeight: FontWeight.normal,
                                                    color: dark,
                                                  ),
                                                  activeTextStyle: TextStyle(
                                                    fontWeight: FontWeight.bold,
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
                                                      hour: 8, minute: 00),
                                                  lastTime: TimeOfDay(
                                                      hour: 22, minute: 00),
                                                  initialRange: _timeRange,
                                                  timeStep: 10,
                                                  timeBlock: 30,
                                                  onRangeCompleted: (range) =>
                                                      setState(() =>
                                                          _timeRange = range,),
                                                ),
                                              ),
                                            );
                                          },
                                        );
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
            Container(
              height: MediaQuery.of(context).size.height * .05,
              width: MediaQuery.of(context).size.width,
              child: CheckboxListTile(
                title: Text(
                  "Cash on Delivery",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                controlAffinity: ListTileControlAffinity.leading,
                value: Cash_on_Delivery,
                onChanged: _Cash_on_Delivery,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .05,
              width: MediaQuery.of(context).size.width,
              child: CheckboxListTile(
                title: Text(
                  "Bank/Card",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                controlAffinity: ListTileControlAffinity.leading,
                value: Bank_Card,
                onChanged: _Bank_Card,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .05,
              width: MediaQuery.of(context).size.width,
              child: CheckboxListTile(
                title: Text(
                  "Mobile Banking",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                controlAffinity: ListTileControlAffinity.leading,
                value: Mobile_Banking,
                onChanged: _Mobile_Banking,
              ),
            ),
            SizedBox(
              height: 50,
            ),
           cart.items.isNotEmpty? Center(
              child: Text(
                "৳ 50 Delivery charge included",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ):Container(),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                cart.items.isNotEmpty?GestureDetector(
            onTap: _selectDate==null || addressList.length==0 ||_timeRange==null?showToast:
                      ()async{
                    Response response=await Provider.of<Order>(context, listen: false).addOrder(
                      cart.items.values.toList(),
                      cart.totalAmount,
                        _selectDate!,
                       "${_timeRange!.start.format(context)}-${_timeRange!.end.format(context)}"
                    );
                    cart.clearCart();
                    if(response.statusCode==200){
                      showModalBottomSheet<void>(
                        isDismissible: false,
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context){
                          return OrderBottomSheet(
                          );
                        },
                      );
                      //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Address()));
                     // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>BottomNavBar(currentTab: 0,currentScreen: HomeScreen(),)), (route) => false);
                    }
                    else{
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
                ):ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFE9A75)
                  ),
                  onPressed: (){ Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>BottomNavBar(currentTab: 0,currentScreen: HomeScreen(),)), (route) => false);}, child: Text(
                  "HomePage",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),),
              cart.items.isNotEmpty?  Container(
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
                ):Container(),
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
    Fluttertoast.showToast(
      msg: addressList.length==0?"Please add address":_selectDate==null?"Please set Delivery Date":_timeRange==null?'Please set Delivery Time':'',
      toastLength: Toast.LENGTH_SHORT,
      textColor: Colors.red,
      backgroundColor: Colors.grey,
    gravity:ToastGravity.BOTTOM,
    );
  }


}
