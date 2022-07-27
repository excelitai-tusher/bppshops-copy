import 'dart:math';

import 'package:bpp_shop/view/bpp/bottomAppBar/history_screen/myOrder_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final provider = Provider.of<MyOrderProvider>(context, listen: false);
    provider.getOrderList();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyOrderProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My order'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: provider.isLoading == false
            ? ListView.builder(
                itemBuilder: (context, index) {
                  bool isPending = true;

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 4.5,
                      decoration: BoxDecoration(
                          color: const Color(0xffF9F6F6),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black12)),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.all(8),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .035,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .1,
                                            decoration: BoxDecoration(
                                                color: provider.orderList[index]
                                                            .status ==
                                                        "Completed"
                                                    ? Colors.green
                                                    : provider.orderList[index]
                                                                    .status ==
                                                                "Pending" &&
                                                            isPending == true
                                                        ? Colors.amber
                                                        : Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Center(
                                                child: Text(
                                              provider.orderList[index].status
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w800,
                                                  color: Colors.white70),
                                            )),
                                          ),
                                          Text(
                                            "Order Id: " +
                                                provider.orderList[index].id
                                                    .toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w800),
                                          ),
                                          Text(
                                            "Invoice: # " +
                                                provider
                                                    .orderList[index].invoiceNo
                                                    .toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            "Amount: ৳ " +
                                                provider.orderList[index].totalAmount
                                                    .toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ),
                                    flex: 2,
                                  ),
                                  Expanded(
                                    child: provider.orderList[index].status ==
                                            "Completed"
                                        ? Container(
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                RatingBar(
                                                    itemSize: 25,
                                                    ignoreGestures: true,
                                                    initialRating: Random()
                                                        .nextInt(5)
                                                        .toDouble(),
                                                    direction: Axis.horizontal,
                                                    //allowHalfRating: true,
                                                    itemCount: 5,
                                                    ratingWidget: RatingWidget(
                                                        full: const Icon(
                                                            Icons.star,
                                                            color:
                                                                Colors.orange),
                                                        half: const Icon(
                                                          Icons.star_half,
                                                          color: Colors.orange,
                                                        ),
                                                        empty: const Icon(
                                                          Icons.star_outline,
                                                          color: Colors.orange,
                                                        )),
                                                    onRatingUpdate: (value) {
                                                      setState(() {
                                                        //_ratingValue = value;
                                                      });
                                                    }),
                                                const Text(
                                                  "789562",
                                                  style: TextStyle(
                                                      color: Colors.black54),
                                                ),
                                                const Text(
                                                  "04/05/2022",
                                                  style: TextStyle(
                                                      color: Colors.black54),
                                                ),
                                                const Text(
                                                  "4.00PM-5.00PM",
                                                  style: TextStyle(
                                                      color: Colors.black54),
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 5),
                                                  height: 22,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Colors.black12),
                                                  child: const Center(
                                                    child: Text(
                                                      "Report Issue",
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        : provider.orderList[index].status ==
                                                "Pending"
                                            ? Container(
                                                child: Row(
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            showDialog(
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return Scaffold(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  body: Center(
                                                                    child: Container(
                                                                        decoration: BoxDecoration(
                                                                          color:
                                                                              Colors.white,
                                                                          borderRadius:
                                                                              BorderRadius.circular(20),
                                                                        ),
                                                                        height: 140,
                                                                        width: MediaQuery.of(context).size.width * .8,
                                                                        child: Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            const Text(
                                                                              "Are You Sure want to Cancel this order",
                                                                              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                                                                            ),
                                                                            const SizedBox(
                                                                              height: 20,
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                              children: [
                                                                                SizedBox(
                                                                                  height: 30,
                                                                                  width: 70,
                                                                                  child: ElevatedButton(
                                                                                    child: const Text(
                                                                                      "No",
                                                                                      style: TextStyle(fontSize: 15),
                                                                                    ),
                                                                                    onPressed: () {
                                                                                      Navigator.pop(context);
                                                                                    },
                                                                                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey)),
                                                                                  ),
                                                                                ),
                                                                                const SizedBox(
                                                                                  width: 20,
                                                                                ),
                                                                                Container(
                                                                                  height: 30,
                                                                                  width: 70,
                                                                                  child: ElevatedButton(
                                                                                    child: const Text(
                                                                                      "Yes",
                                                                                      style: TextStyle(color: Colors.white, fontSize: 15),
                                                                                    ),
                                                                                    onPressed: () {
                                                                                      setState(() async {
                                                                                        await provider.canceledOrder(int.parse(provider.orderList[index].id.toString()));
                                                                                        //provider.getOrderList();
                                                                                        Navigator.of(context).pop();
                                                                                      });
                                                                                    },
                                                                                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.orange)),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        )),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                          child: Container(
                                                            height: 25,
                                                            width: 25,
                                                            decoration:
                                                                const BoxDecoration(
                                                                    color: Colors
                                                                        .black54,
                                                                    shape: BoxShape
                                                                        .circle),
                                                            child: const Center(
                                                                child: Icon(
                                                              Icons.close,
                                                              size: 20,
                                                              color:
                                                                  Colors.white,
                                                            )),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        const Text(
                                                            "Cancel Order")
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          height: 25,
                                                          width: 25,
                                                          decoration:
                                                              const BoxDecoration(
                                                                  color: Colors
                                                                      .black54,
                                                                  shape: BoxShape
                                                                      .circle),
                                                          child: const Center(
                                                              child: Icon(
                                                            Icons.payment_sharp,
                                                            size: 18,
                                                            color: Colors.white,
                                                          )),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        const Text(
                                                          "Change \nPayment",
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              )
                                            : provider.orderList[index]
                                                        .status ==
                                                    "cancel"
                                                ? Container(
                                                    color: Colors.white12,
                                                  )
                                                : Container(),
                                    flex: 3,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              await provider.getOrderDetails(int.parse(
                                  provider.orderList[index].id.toString()));
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return SafeArea(
                                    top: false,
                                    child: Scaffold(
                                      appBar: AppBar(
                                        elevation: 0,
                                        backgroundColor:
                                            Colors.deepOrangeAccent,
                                        title: const Text('Details'),
                                      ),
                                      backgroundColor: Colors.white,
                                      body: Container(
                                        padding: const EdgeInsets.all(10),
                                        height: double.infinity,
                                        width: double.infinity,
                                        color: Colors.white,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    5,
                                                decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xffF9F6F6),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: Colors.black12)),
                                                child: Column(
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                              flex:2,
                                                              child: Container(

                                                                // margin:
                                                                //     const EdgeInsets
                                                                //         .only(left: 3),
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Expanded(
                                                                      flex:2,
                                                                      child: Container(
                                                                        margin:EdgeInsets.only(top: 4,left: 4),
                                                                        height: MediaQuery.of(context)
                                                                                .size
                                                                                .height *
                                                                            .035,
                                                                        width: MediaQuery.of(context)
                                                                                .size
                                                                                .height *
                                                                            .1,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color: provider.orderList[index].status ==
                                                                                  "Completed"
                                                                              ? Colors.green
                                                                              : provider.orderList[index].status == "Pending" && isPending == true
                                                                                  ? Colors.amber
                                                                                  : Colors.grey,
                                                                          borderRadius:
                                                                              BorderRadius.circular(5),
                                                                        ),
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              Text(
                                                                            provider
                                                                                .orderList[index]
                                                                                .status
                                                                                .toString(),
                                                                            style: const TextStyle(
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.w800,
                                                                                color: Colors.white70),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child: Text(
                                                                        
                                                                        "Order Id: " +
                                                                            provider
                                                                                .orderList[index]
                                                                                .id
                                                                                .toString(),
                                                                        style: const TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.w800),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 2,

                                                                      child: Text(
                                                                        
                                                                        "Invoice: # " +
                                                                            provider
                                                                                .orderList[index]
                                                                                .invoiceNo
                                                                                .toString(),
                                                                        style: const TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.w400),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child: Text(
                                                                        "Amount: ৳ " +
                                                                            provider
                                                                                .orderList[index]
                                                                                .totalAmount
                                                                                .toString(),
                                                                        style: const TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.w400),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),

                                                            ),
                                                            Expanded(
                                                              child: provider
                                                                          .orderList[
                                                                              index]
                                                                          .status ==
                                                                      "Completed"
                                                                  ? Container(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          right:
                                                                              10,
                                                                          top:
                                                                              5,
                                                                          bottom:
                                                                              5),
                                                                      child:
                                                                          Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.end,
                                                                        children: [
                                                                          RatingBar(
                                                                              itemSize: 25,
                                                                              ignoreGestures: true,
                                                                              initialRating: Random().nextInt(5).toDouble(),
                                                                              direction: Axis.horizontal,
//allowHalfRating: true,
                                                                              itemCount: 5,
                                                                              ratingWidget: RatingWidget(
                                                                                full: const Icon(Icons.star, color: Colors.orange),
                                                                                half: const Icon(
                                                                                  Icons.star_half,
                                                                                  color: Colors.orange,
                                                                                ),
                                                                                empty: const Icon(
                                                                                  Icons.star_outline,
                                                                                  color: Colors.orange,
                                                                                ),
                                                                              ),
                                                                              onRatingUpdate: (value) {
                                                                                setState(() {
//_ratingValue = value;
                                                                                });
                                                                              }),
                                                                          const Text(
                                                                            "789562",
                                                                            style:
                                                                                TextStyle(color: Colors.black54),
                                                                          ),
                                                                          const Text(
                                                                            "04/05/2022",
                                                                            style:
                                                                                TextStyle(color: Colors.black54),
                                                                          ),
                                                                          const Text(
                                                                            "4.00PM-5.00PM",
                                                                            style:
                                                                                TextStyle(color: Colors.black54),
                                                                          ),
                                                                          Container(
                                                                            margin:
                                                                                const EdgeInsets.only(top: 5),
                                                                            height:
                                                                                25,
                                                                            width:
                                                                                100,
                                                                            decoration:
                                                                                BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.black12),
                                                                            child:
                                                                                const Center(
                                                                              child: Text(
                                                                                "Report Issue",
                                                                                style: TextStyle(fontSize: 12),
                                                                              ),
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    )
                                                                  : provider.orderList[index]
                                                                              .status ==
                                                                          "Pending"
                                                                      ? Expanded(
                                                                flex: 4,
                                                                        child: Container(
                                                                            child:
                                                                                Row(
                                                                              children: [
                                                                                Expanded(
                                                                                  flex: 3,
                                                                                  child: Column(
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Container(
                                                                                        height: 25,
                                                                                        width: 25,
                                                                                        decoration: const BoxDecoration(color: Colors.black54, shape: BoxShape.circle),
                                                                                        child: const Center(
                                                                                            child: Icon(
                                                                                          Icons.close,
                                                                                          size: 20,
                                                                                          color: Colors.white,
                                                                                        )),
                                                                                      ),
                                                                                      const SizedBox(
                                                                                        height: 10,
                                                                                      ),
                                                                                      const Text("Cancel Order")
                                                                                    ],
                                                                                  ),
                                                                                ),

                                                                                Expanded(
                                                                                  flex: 4,
                                                                                  child: Column(
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Container(
                                                                                        height: 25,
                                                                                        width: 25,
                                                                                        decoration: const BoxDecoration(color: Colors.black54, shape: BoxShape.circle),
                                                                                        child: const Center(
                                                                                          child: Icon(
                                                                                            Icons.payment_sharp,
                                                                                            size: 18,
                                                                                            color: Colors.white,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      const SizedBox(
                                                                                        height: 10,
                                                                                      ),
                                                                                      const Text("Change Payment")
                                                                                    ],
                                                                                  ),
                                                                                )
                                                                              ],
                                                                            ),
                                                                          ),
                                                                      )
                                                                      : Container(
//color: Colors.grey,
                                                                          ),
                                                              flex: 3,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Container(
                                                        height: 35,
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: Colors.black12,
                                                          borderRadius:
                                                              BorderRadius.vertical(
                                                                  bottom: Radius
                                                                      .circular(
                                                                          10)),
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: const [
                                                            Icon(
                                                              Icons
                                                                  .keyboard_arrow_up,
                                                              size: 25,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            SizedBox(
                                                              width: 15,
                                                            ),
                                                            Text('Hide details')
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
// color: Colors.grey,

                                                child: Column(
                                                  children: [
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    const Text(
                                                      "Order Details",
                                                      style: TextStyle(
                                                          fontSize: 25),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Container(
                                                      height: provider
                                                              .orderDetailsModel!
                                                              .orderItems!
                                                              .length *
                                                          78,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          border: Border.all(
                                                              width: 1,
                                                              color: Colors
                                                                  .black12)
//color: Colors.black12
                                                          ),
                                                      child: provider
                                                              .orderDetailsModel!
                                                              .orderItems!
                                                              .isNotEmpty
                                                          ? ListView.builder(
                                                              itemBuilder:
                                                                  (context,
                                                                      index) {
                                                                return Container(
                                                                  width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                                  margin: const EdgeInsets
                                                                          .only(
                                                                      top: 10),
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          width:
                                                                              .5,
                                                                          color:
                                                                              Colors.black12)),
                                                                  child: Row(
                                                                    children: [
                                                                      Container(
                                                                        width: MediaQuery.of(context).size.width *
                                                                            .3,
                                                                        height:
                                                                            60,
                                                                        child: provider.orderDetailsModel!.orderItems![index].product!.productThambnail !=
                                                                                null
                                                                            ? Image.network(
                                                                                "https://bppshops.com/" + provider.orderDetailsModel!.orderItems![index].product!.productThambnail.toString(),
                                                                                fit: BoxFit.fitHeight,
                                                                              )
                                                                            : Image.network('https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg'),
                                                                      ),

                                                                      Container(
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(provider.orderDetailsModel!.orderItems![index].product!.productName.toString(),
                                                                                style: const TextStyle(fontSize: 13)),
                                                                            const SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Row(
                                                                              children: [
                                                                                Text(
                                                                                  provider.orderDetailsModel!.orderItems![index].product!.unitPrice.toString(),
                                                                                  style: const TextStyle(fontSize: 13),
                                                                                ),
                                                                                const SizedBox(
                                                                                  width: 20,
                                                                                ),
                                                                                Text(
                                                                                  provider.orderDetailsModel!.orderItems![index].product!.productQty.toString(),
                                                                                  style: const TextStyle(fontSize: 13),
                                                                                )
                                                                              ],
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ),
// Container(
//   width: 100,
//   color: Colors.grey,
// )
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                              itemCount: provider
                                                                  .orderDetailsModel!
                                                                  .orderItems!
                                                                  .length,
                                                            )
                                                          : Container(
                                                              child: Center(
                                                                child: Text(
                                                                    "No Product Found"),
                                                              ),
                                                            ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Container(
                              height: 35,
                              width: MediaQuery.of(context).size.width,
                              decoration: const BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(10)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 25,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text('View details')
                                ],
                              ),
                            ),
                          ),
                          // GestureDetector(
                          //   onTap: () {
                          //     FocusScope.of(context).unfocus();
                          //     showDialog(
                          //       context: context,
                          //       builder: (BuildContext context) {
                          //         return SafeArea(
                          //           top: false,
                          //           child: Scaffold(
                          //             appBar: AppBar(
                          //               elevation: 0,
                          //               backgroundColor:
                          //                   Colors.deepOrangeAccent,
                          //               title: const Text('Details'),
                          //             ),
                          //             backgroundColor: Colors.white,
                          //             body: Container(
                          //               padding: const EdgeInsets.all(10),
                          //               height: double.infinity,
                          //               width: double.infinity,
                          //               color: Colors.white,
                          //               child: Stack(
                          //                 clipBehavior: Clip.none,
                          //                 //overflow: Overflow.visible,
                          //                 children: <Widget>[
                          //                   Column(
                          //                     mainAxisSize: MainAxisSize.min,
                          //                     children: <Widget>[
                          //                       Container(
                          //                         height: MediaQuery.of(context)
                          //                                 .size
                          //                                 .height /
                          //                             5,
                          //                         decoration: BoxDecoration(
                          //                             color: const Color(
                          //                                 0xffF9F6F6),
                          //                             borderRadius:
                          //                                 BorderRadius.circular(
                          //                                     10),
                          //                             border: Border.all(
                          //                                 color:
                          //                                     Colors.black12)),
                          //                         child: Column(
                          //                           children: [
                          //                             Expanded(
                          //                               child: Container(
                          //                                 child: Row(
                          //                                   children: [
                          //                                     Expanded(
                          //                                       child:
                          //                                           Container(
                          //                                         margin:
                          //                                             const EdgeInsets
                          //                                                 .all(8),
                          //                                         child: Column(
                          //                                           mainAxisAlignment:
                          //                                               MainAxisAlignment
                          //                                                   .spaceAround,
                          //                                           crossAxisAlignment:
                          //                                               CrossAxisAlignment
                          //                                                   .start,
                          //                                           children: [
                          //                                             Container(
                          //                                               height: MediaQuery.of(context).size.height *
                          //                                                   .035,
                          //                                               width: MediaQuery.of(context).size.height *
                          //                                                   .1,
                          //                                               decoration: BoxDecoration(
                          //                                                   color: orderList.orderType == "Completed"
                          //                                                       ? Colors.green
                          //                                                       : orderList.orderType == "Pending" && isPending == true
                          //                                                           ? Colors.amber
                          //                                                           : Colors.grey,
                          //                                                   borderRadius: BorderRadius.circular(5)),
                          //                                               child: Center(
                          //                                                   child: Text(
                          //                                                 orderList
                          //                                                     .orderType
                          //                                                     .toString(),
                          //                                                 style: const TextStyle(
                          //                                                     fontSize: 12,
                          //                                                     fontWeight: FontWeight.w800,
                          //                                                     color: Colors.white70),
                          //                                               )),
                          //                                             ),
                          //                                             Text(
                          //                                               "OrderId: #" +
                          //                                                   orderList.orderId.toString(),
                          //                                               style: const TextStyle(
                          //                                                   fontWeight:
                          //                                                       FontWeight.w800),
                          //                                             ),
                          //                                             Text(
                          //                                               "\$   " +
                          //                                                   orderList.orderAmount.toString(),
                          //                                               style: const TextStyle(
                          //                                                   fontWeight:
                          //                                                       FontWeight.w600),
                          //                                             ),
                          //                                           ],
                          //                                         ),
                          //                                       ),
                          //                                       flex: 2,
                          //                                     ),
                          //                                     Expanded(
                          //                                       child: orderList
                          //                                                   .orderType ==
                          //                                               "Completed"
                          //                                           ? Container(
                          //                                               padding: const EdgeInsets.only(
                          //                                                   right:
                          //                                                       10,
                          //                                                   top:
                          //                                                       5,
                          //                                                   bottom:
                          //                                                       5),
                          //                                               child:
                          //                                                   Column(
                          //                                                 mainAxisAlignment:
                          //                                                     MainAxisAlignment.spaceEvenly,
                          //                                                 crossAxisAlignment:
                          //                                                     CrossAxisAlignment.end,
                          //                                                 children: [
                          //                                                   RatingBar(
                          //                                                       itemSize: 25,
                          //                                                       ignoreGestures: true,
                          //                                                       initialRating: Random().nextInt(5).toDouble(),
                          //                                                       direction: Axis.horizontal,
                          //                                                       //allowHalfRating: true,
                          //                                                       itemCount: 5,
                          //                                                       ratingWidget: RatingWidget(
                          //                                                           full: const Icon(Icons.star, color: Colors.orange),
                          //                                                           half: const Icon(
                          //                                                             Icons.star_half,
                          //                                                             color: Colors.orange,
                          //                                                           ),
                          //                                                           empty: const Icon(
                          //                                                             Icons.star_outline,
                          //                                                             color: Colors.orange,
                          //                                                           )),
                          //                                                       onRatingUpdate: (value) {
                          //                                                         setState(() {
                          //                                                           //_ratingValue = value;
                          //                                                         });
                          //                                                       }),
                          //                                                   const Text(
                          //                                                     "789562",
                          //                                                     style: TextStyle(color: Colors.black54),
                          //                                                   ),
                          //                                                   const Text(
                          //                                                     "04/05/2022",
                          //                                                     style: TextStyle(color: Colors.black54),
                          //                                                   ),
                          //                                                   const Text(
                          //                                                     "4.00PM-5.00PM",
                          //                                                     style: TextStyle(color: Colors.black54),
                          //                                                   ),
                          //                                                   Container(
                          //                                                     margin: const EdgeInsets.only(top: 5),
                          //                                                     height: 25,
                          //                                                     width: 100,
                          //                                                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.black12),
                          //                                                     child: const Center(
                          //                                                       child: Text(
                          //                                                         "Report Issue",
                          //                                                         style: TextStyle(fontSize: 12),
                          //                                                       ),
                          //                                                     ),
                          //                                                   )
                          //                                                 ],
                          //                                               ),
                          //                                             )
                          //                                           : orderList.orderType ==
                          //                                                   "Pending"
                          //                                               ? Container(
                          //                                                   child:
                          //                                                       Row(
                          //                                                     children: [
                          //                                                       Column(
                          //                                                         mainAxisAlignment: MainAxisAlignment.center,
                          //                                                         children: [
                          //                                                           Container(
                          //                                                             height: 25,
                          //                                                             width: 25,
                          //                                                             decoration: const BoxDecoration(color: Colors.black54, shape: BoxShape.circle),
                          //                                                             child: const Center(
                          //                                                                 child: Icon(
                          //                                                               Icons.close,
                          //                                                               size: 20,
                          //                                                               color: Colors.white,
                          //                                                             )),
                          //                                                           ),
                          //                                                           const SizedBox(
                          //                                                             height: 10,
                          //                                                           ),
                          //                                                           const Text("Cancel Order")
                          //                                                         ],
                          //                                                       ),
                          //                                                       const SizedBox(
                          //                                                         width: 20,
                          //                                                       ),
                          //                                                       Column(
                          //                                                         mainAxisAlignment: MainAxisAlignment.center,
                          //                                                         children: [
                          //                                                           Container(
                          //                                                             height: 25,
                          //                                                             width: 25,
                          //                                                             decoration: const BoxDecoration(color: Colors.black54, shape: BoxShape.circle),
                          //                                                             child: const Center(
                          //                                                                 child: Icon(
                          //                                                               Icons.payment_sharp,
                          //                                                               size: 18,
                          //                                                               color: Colors.white,
                          //                                                             )),
                          //                                                           ),
                          //                                                           const SizedBox(
                          //                                                             height: 10,
                          //                                                           ),
                          //                                                           const Text("Change Payment")
                          //                                                         ],
                          //                                                       )
                          //                                                     ],
                          //                                                   ),
                          //                                                 )
                          //                                               : Container(
                          //                                                   //color: Colors.grey,
                          //                                                   ),
                          //                                       flex: 3,
                          //                                     ),
                          //                                   ],
                          //                                 ),
                          //                               ),
                          //                             ),
                          //                             GestureDetector(
                          //                               onTap: () {
                          //                                 Navigator.of(context)
                          //                                     .pop();
                          //                               },
                          //                               child: Container(
                          //                                 height: 35,
                          //                                 width: MediaQuery.of(
                          //                                         context)
                          //                                     .size
                          //                                     .width,
                          //                                 decoration:
                          //                                     const BoxDecoration(
                          //                                   color:
                          //                                       Colors.black12,
                          //                                   borderRadius:
                          //                                       BorderRadius.vertical(
                          //                                           bottom: Radius
                          //                                               .circular(
                          //                                                   10)),
                          //                                 ),
                          //                                 child: Row(
                          //                                   mainAxisAlignment:
                          //                                       MainAxisAlignment
                          //                                           .center,
                          //                                   children: const [
                          //                                     Icon(
                          //                                       Icons
                          //                                           .keyboard_arrow_up,
                          //                                       size: 25,
                          //                                       color: Colors
                          //                                           .white,
                          //                                     ),
                          //                                     SizedBox(
                          //                                       width: 15,
                          //                                     ),
                          //                                     Text(
                          //                                         'Hide details')
                          //                                   ],
                          //                                 ),
                          //                               ),
                          //                             ),
                          //                           ],
                          //                         ),
                          //                       ),
                          //                       Container(
                          //                         // color: Colors.grey,
                          //
                          //                         child: Column(
                          //                           children: [
                          //                             const SizedBox(
                          //                               height: 10,
                          //                             ),
                          //                             const Text(
                          //                               "Order Details",
                          //                               style: TextStyle(
                          //                                   fontSize: 25),
                          //                             ),
                          //                             const SizedBox(
                          //                               height: 10,
                          //                             ),
                          //                             Container(
                          //                               height: MediaQuery.of(
                          //                                           context)
                          //                                       .size
                          //                                       .height *
                          //                                   .6,
                          //                               width: MediaQuery.of(
                          //                                       context)
                          //                                   .size
                          //                                   .width,
                          //                               decoration: BoxDecoration(
                          //                                   borderRadius:
                          //                                       BorderRadius
                          //                                           .circular(
                          //                                               10),
                          //                                   border: Border.all(
                          //                                       width: 1,
                          //                                       color: Colors
                          //                                           .black12)
                          //                                   //color: Colors.black12
                          //                                   ),
                          //                               child: ListView.builder(
                          //                                 itemBuilder:
                          //                                     (context, index) {
                          //                                   final singleProduct =
                          //                                       productItemList![
                          //                                           index];
                          //
                          //                                   return Container(
                          //                                     width:
                          //                                         MediaQuery.of(
                          //                                                 context)
                          //                                             .size
                          //                                             .width,
                          //                                     margin:
                          //                                         const EdgeInsets
                          //                                                 .only(
                          //                                             top: 10),
                          //                                     decoration: BoxDecoration(
                          //                                         border: Border.all(
                          //                                             width: .5,
                          //                                             color: Colors
                          //                                                 .black12)),
                          //                                     child: Row(
                          //                                       children: [
                          //                                         Container(
                          //                                           width: MediaQuery.of(context)
                          //                                                   .size
                          //                                                   .width *
                          //                                               .3,
                          //                                           height: 60,
                          //                                           child: Image.asset(
                          //                                               singleProduct
                          //                                                   .image!),
                          //                                         ),
                          //
                          //                                         Container(
                          //                                           child:
                          //                                               Column(
                          //                                             crossAxisAlignment:
                          //                                                 CrossAxisAlignment
                          //                                                     .start,
                          //                                             children: [
                          //                                               Text(
                          //                                                 singleProduct
                          //                                                     .name!,
                          //                                                 style:
                          //                                                     const TextStyle(fontSize: 20),
                          //                                               ),
                          //                                               const SizedBox(
                          //                                                 height:
                          //                                                     10,
                          //                                               ),
                          //                                               Row(
                          //                                                 children: [
                          //                                                   Text(
                          //                                                     "Price:  " + Random().nextInt(1000).toString(),
                          //                                                     style: const TextStyle(fontSize: 15),
                          //                                                   ),
                          //                                                   const SizedBox(
                          //                                                     width: 20,
                          //                                                   ),
                          //                                                   Text(
                          //                                                     "Quantity:  " + Random().nextInt(10).toString(),
                          //                                                     style: const TextStyle(fontSize: 15),
                          //                                                   )
                          //                                                 ],
                          //                                               )
                          //                                             ],
                          //                                           ),
                          //                                         ),
                          //                                         // Container(
                          //                                         //   width: 100,
                          //                                         //   color: Colors.grey,
                          //                                         // )
                          //                                       ],
                          //                                     ),
                          //                                   );
                          //                                 },
                          //                                 itemCount:
                          //                                     productItemList
                          //                                         ?.length,
                          //                               ),
                          //                             )
                          //                           ],
                          //                         ),
                          //                       ),
                          //                     ],
                          //                   ),
                          //                 ],
                          //               ),
                          //             ),
                          //           ),
                          //         );
                          //       },
                          //     );
                          //   },
                          //   child: Container(
                          //     height: 35,
                          //     width: MediaQuery.of(context).size.width,
                          //     decoration: const BoxDecoration(
                          //       color: Colors.black12,
                          //       borderRadius: BorderRadius.vertical(
                          //           bottom: Radius.circular(10)),
                          //     ),
                          //     child: Row(
                          //       mainAxisAlignment: MainAxisAlignment.center,
                          //       children: const [
                          //         Icon(
                          //           Icons.keyboard_arrow_down,
                          //           size: 25,
                          //           color: Colors.white,
                          //         ),
                          //         SizedBox(
                          //           width: 15,
                          //         ),
                          //         Text('View details')
                          //       ],
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: provider.orderList.length,
              )
            : provider.orderList.isEmpty
                ? Expanded(
                    child: Container(
                      child: Center(
                        child: Text(
                          "No order history found",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height / 5,
                            decoration: BoxDecoration(
                                color: const Color(0xffF9F6F6),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black12)),
                          ),
                        );
                      },
                      itemCount: 5,
                    ),
                  ),
      ),
    );
  }
}
