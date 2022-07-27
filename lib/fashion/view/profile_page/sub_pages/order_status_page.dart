import 'package:bpp_shop/fashion/Screen/home_page%20copy.dart';
import 'package:bpp_shop/fashion/controller/app_bar_controler.dart';
import 'package:bpp_shop/fashion/controller/peimary_page_controller.dart';
import 'package:bpp_shop/fashion/view/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:provider/provider.dart';
import '../../../Screen/fashion_home_page.dart';

class OrderStatus extends StatelessWidget {
  const OrderStatus({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Path customPath = Path()
      ..moveTo(0, 2)
      ..lineTo(0, 70)
    ;

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            //Navigator.pop(context);
            final status =
            Provider.of<PrimaryScreenState>(context, listen: false);
            status.setPrimaryState(true);
            final primaryPageState = Provider.of<PrimaryPageController>(context,listen: false);
            primaryPageState.setPrimaryPage(3);
          },
          child: const Icon(Icons.arrow_back_ios,color: Colors.black,),
        ),


        title: const Text('Order Status',
          style: TextStyle(
              color: Colors.black,
              fontSize: 17
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),




      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(height: 20,),


            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          'Estimated time'
                        ),
                      ),
                      Center(
                        child: Text(
                          '40 minutes',
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                            'Order number'
                        ),
                      ),
                      Center(
                        child: Text(
                          '#4563127',
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),


            const SizedBox(height: 20,),
            Divider(thickness: 2,),

            const SizedBox(height: 10,),

            Container(
              height: 500,
              width: MediaQuery.of(context).size.width*.95,
              // decoration: BoxDecoration(
              //     border: Border.all(
              //         color: Colors.black,
              //         width: .5
              //     )
              // ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          const Icon(Icons.circle, color: Colors.green, size: 13,),
                          DottedBorder(
                              color: Colors.black,
                              customPath: (size)=> customPath,
                              strokeWidth: 1,
                              strokeCap: StrokeCap.round,
                              borderType: BorderType.Rect,
                              dashPattern: const [2,2],
                              child: const SizedBox(
                                width: 0,
                                height: 60,
                              )
                          ),
                          const Icon(Icons.circle, color: Colors.green, size: 13,),
                          DottedBorder(
                              color: Colors.black,
                              customPath: (size)=> customPath,
                              strokeWidth: 1,
                              strokeCap: StrokeCap.round,
                              borderType: BorderType.Rect,
                              dashPattern: const [2,2],
                              child: const SizedBox(
                                width: 0,
                                height: 60,
                              )
                          ),
                          const Icon(Icons.circle, color: Color(0xFFFF6000), size: 13,),
                          DottedBorder(
                              color: Colors.black,
                              customPath: (size)=> customPath,
                              strokeWidth: 1,
                              strokeCap: StrokeCap.round,
                              borderType: BorderType.Rect,
                              dashPattern: const [2,2],
                              child: const SizedBox(
                                width: 0,
                                height: 60,
                              )
                          ),
                          const Icon(Icons.circle, color: Color(0xFFFF6000), size: 13,),
                          DottedBorder(
                              color: Colors.black,
                              customPath: (size)=> customPath,
                              strokeWidth: 1,
                              strokeCap: StrokeCap.round,
                              borderType: BorderType.Rect,
                              dashPattern: const [2,2],
                              child: const SizedBox(
                                width: 0,
                                height: 60,
                              )
                          ),
                          const Icon(Icons.circle, color: Color(0xFFFF6000), size: 13,),
                          DottedBorder(
                              color: Colors.black,
                              customPath: (size)=> customPath,
                              strokeWidth: 1,
                              strokeCap: StrokeCap.round,
                              borderType: BorderType.Rect,
                              dashPattern: const [2,2],
                              child: const SizedBox(
                                width: 0,
                                height: 60,
                              )
                          ),
                          const Icon(Icons.circle, color: Color(0xFFFF6000), size: 13,)
                        ],
                      )
                  ),
                  Expanded(
                      flex: 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [


                          Row(
                            children: [
                              Expanded(child: Icon(Icons.file_copy_outlined)),
                              Expanded(
                                flex: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Order Placed'),
                                    const Text('We have received your order', style: TextStyle(color: Colors.grey),),
                                  ],
                                ),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Text('2.30 PM')
                              ),
                            ],
                          ),

                          const SizedBox(height: 40,),
                          Row(
                            children: [
                              Expanded(child: Icon(Icons.check)),
                              Expanded(
                                flex: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Order Confirmed'),
                                    const Text('Your order has been confirmed', style: TextStyle(color: Colors.grey),),
                                  ],
                                ),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Text('2.30 PM')
                              ),
                            ],
                          ),
                          // SizedBox(
                          //   height: 20,
                          //   width: 110,
                          //   child: ElevatedButton(
                          //     onPressed: (){
                          //       //OrderTrackPage
                          //       Navigator.push(context, MaterialPageRoute(builder: (context) => OrderTrackPage()));
                          //     },
                          //     child: Row(
                          //       children: const [
                          //         Text('Tracking', style: TextStyle(color: Colors.white70),),
                          //         Padding(
                          //           padding: EdgeInsets.only(left: 5),
                          //           child: Icon(
                          //             Icons.circle,
                          //             size: 10,
                          //             color: Colors.white,
                          //           ),
                          //         )
                          //       ],
                          //     ),
                          //     style: ElevatedButton.styleFrom(
                          //         primary: const Color(0xFFFF6000),
                          //         onPrimary: Colors.white,
                          //         shape: RoundedRectangleBorder(
                          //           borderRadius: BorderRadius.circular(5),
                          //         ),
                          //         side: const BorderSide(width: 1, color: Color(0xFFFF6000))
                          //     ),
                          //   ),
                          // ),
                          const SizedBox(height: 40,),
                          Row(
                            children: [
                              Expanded(child: Icon(Icons.settings_backup_restore)),
                              Expanded(
                                flex: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Order processed'),
                                    const Text('We are preparing your order', style: TextStyle(color: Colors.grey),),
                                  ],
                                ),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Text('2.30 PM')
                              ),
                            ],
                          ),
                          const SizedBox(height: 40,),
                          Row(
                            children: [
                              Expanded(child: Icon(Icons.car_rental)),
                              Expanded(
                                flex: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Ready to pickup'),
                                    const Text('Your order is ready to pickup', style: TextStyle(color: Colors.grey),),
                                  ],
                                ),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Text('2.30 PM')
                              ),
                            ],
                          ),
                          const SizedBox(height: 40,),
                          Row(
                            children: [
                              Expanded(child: Icon(Icons.attach_money)),
                              Expanded(
                                flex: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Payment confirmed'),
                                    const Text('Awaiting confirmation', style: TextStyle(color: Colors.grey),),
                                  ],
                                ),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Text('2.30 PM')
                              ),
                            ],
                          ),
                          const SizedBox(height: 40,),
                          Row(
                            children: [
                              Expanded(child: Icon(Icons.check_box)),
                              Expanded(
                                flex: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Delivered'),
                                    const Text('Successfully delivered', style: TextStyle(color: Colors.grey),),
                                  ],
                                ),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Text('2.30 PM')
                              ),
                            ],
                          ),
                        ],
                      )
                  ),

                ],
              ),
            ),

            SizedBox(
              height: 35,
              width: 170,
              child: ElevatedButton(
                onPressed: (){
                  // final primaryPageState = Provider.of<PrimaryPageController>(context,listen: false);
                  // final productAppBar = Provider.of<PrimaryScreenState>(context,listen: false);
                  // primaryPageState.setPrimaryPage(0);
                  // productAppBar.setPrimaryState(true);
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                      FashionHomePage()), (route) => false);
                },
                child: const Text('Back to Shopping', style: TextStyle(color: Colors.white70),),
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xFFFF6000),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: const BorderSide(width: 1, color: Color(0xFFFF6000))
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
