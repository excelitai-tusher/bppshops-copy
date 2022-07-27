import 'package:bpp_shop/view/bpp/bottomAppBar/bottom_app_bar.dart';
import 'package:flutter/material.dart';
import '../bottomAppBar/home_Screen/home_screen.dart';
import 'track order/track order1.dart';

class BPPOrderDetails extends StatefulWidget {
  BPPOrderDetails({
    Key? key,
    required this.orderId,
    required this.deliveryTime,
    required this.paymentMethod,
    required this.invoiceNumber,
    required this.amount,
    required this.deliveryCharge,
    required this.streetAddress,
  }) : super(key: key);
  String? orderId;
  String? deliveryTime;
  String? paymentMethod;
  String? invoiceNumber;
  String? amount;
  String? deliveryCharge;
  String? streetAddress;
  @override
  State<BPPOrderDetails> createState() => _BPPOrderDetailsState();
}

class _BPPOrderDetailsState extends State<BPPOrderDetails> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.2,
        centerTitle: true,
        backgroundColor: Color(0xffE37D4E),
        elevation: 0,
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.of(context).pop();
        //   },
        //   icon: Icon(
        //     Icons.arrow_back_ios,
        //     color: Colors.white,
        //   ),
        // ),
        title: Text(
          'Order Details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: widget.deliveryTime != null
          ? SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(15, 30, 15, 30),
                      // height: MediaQuery.of(context).size.height * .6,
                      // width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Color(0XFFF8EBD0),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          children: [
                            Text(
                              'Your Order is on its way',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            Image.asset('assets/Rectangle 237.webp'),
                            SizedBox(
                              height: 10,
                            ),

                            Text(
                              'Select Delivery Slot',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Text(widget.deliveryTime!),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  elevation: 3,
                                  //minimumSize: Size(100, 40),
                                ),
                                onPressed: () async {
                                  // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>()));
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Pay with",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.money,
                                          color: Colors.green,
                                        ),
                                        Text(
                                          "${widget.paymentMethod!}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          ": ৳ 300.0",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),

                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 60, right: 60),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(20), // <-- Radius
                                  ),
                                  primary: Colors.amber,
                                  minimumSize: Size(100, 40),
                                ),
                                onPressed: () async {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TrackOrder1(invoiceNumber: widget.invoiceNumber!,)));
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Track Order",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            // ElevatedButton(
                            //   // style: ElevatedButton.styleFrom(minimumSize: Size(80, 40)),
                            //     onPressed: (){
                            //     //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TrackOrder()));
                            //     },
                            //     child:
                            //     Text('TRACK ORDER',
                            //       style: TextStyle(color: Colors.white),)),
                            GestureDetector(
                              onTap: (){
                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>BottomNavBar(currentTab: 0,currentScreen: HomeScreen(),)), (route) => false);
                              },
                              child: Text(
                                'Go to Homepage',
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xffE37D4E)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Order Number"),
                            Text(widget.orderId!)
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Invoice Number"),
                            Text(widget.invoiceNumber!)
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("Order total (Incl.VAT"), Text("")],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Delivery Change"),
                            Text(widget.deliveryCharge!)
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Grand Total"),
                            Text(
                                "${double.tryParse(widget.amount!)! + double.tryParse(widget.deliveryCharge!)!}")
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                flex: 2,
                                child: Text(
                                  "Address",
                                  overflow: TextOverflow.ellipsis,
                                )),
                            Expanded(
                              flex: 5,
                              child: Text(
                                "'${widget.streetAddress!}",
                                textAlign: TextAlign.end,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
