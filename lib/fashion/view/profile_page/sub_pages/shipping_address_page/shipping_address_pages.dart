//import 'package:classy_ui_design/address/payment.dart';

import 'package:bpp_shop/fashion/controller/app_bar_controler.dart';
import 'package:bpp_shop/fashion/controller/peimary_page_controller.dart';
import 'package:bpp_shop/fashion/view/profile_page/sub_pages/edit_address/edit_address_page.dart';
import 'package:bpp_shop/fashion/view/profile_page/sub_pages/payment_method_page/payment_methods_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//import '../main.dart';

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({Key? key}) : super(key: key);

  @override
  _ShippingAddressState createState() => _ShippingAddressState();

}
class _ShippingAddressState extends State<ShippingAddress> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: (){
            //Navigator.pop(context);
            final status =
            Provider.of<PrimaryScreenState>(context, listen: false);
            status.setPrimaryState(true);
            final primaryPageState = Provider.of<PrimaryPageController>(context,listen: false);
            primaryPageState.setPrimaryPage(3);
          },
          child: Icon(Icons.arrow_back_ios,
            size: 18,
            color: Colors.black,
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 35.w),
          child: Text("Shipping Address",
            style: TextStyle(
                color: Colors.black,
                fontSize: 17.sp,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          //physics: NeverScrollableScrollPhysics(),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Choose Location",
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.h,),
                Row(
                  children: [
                    Icon(Icons.radio_button_checked, color: Colors.orange,),
                    SizedBox(width: 5.w,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*.8,
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: (){
                          //Navigator.push(context, MaterialPageRoute(builder: (context) =>PaymentMethod()));
                        },
                        child: Text("17/A, Ranking street, Wari, Dahaka-1203",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Icon(Icons.radio_button_checked, color: Colors.orange,),
                    SizedBox(width: 5.w,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*.8,
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: (){
                          //Navigator.push(context, MaterialPageRoute(builder: (context) =>PaymentMethod()));
                        },
                        child: Text("17/A, Ranking street, Wari, Dahaka-1203",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>EditAddress()));
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 20,),
                          Icon(Icons.radio_button_checked, color: Colors.orange,),
                        ],
                      ),
                      Container(
                        height: 130,
                        width: 280,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: "Custom location"
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width*.8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: "Order No: ",
                              style: TextStyle(color: Colors.black, fontSize: 15.sp)
                          ),
                          TextSpan(
                            text: "7597",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp
                            ),
                          ),
                        ],
                        ),
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: "Price: ",
                              style: TextStyle(color: Colors.black,fontSize: 15.sp)),
                          TextSpan(
                            text: "TK2103",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,fontSize: 14.sp
                            ),
                          ),
                        ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(
                      height: 80,
                      width: MediaQuery.of(context).size.width*.85,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        onPressed: (){},
                        child: Row(
                          children: [
                            Icon(Icons.access_time_rounded, color: Colors.orange, size: 35,),
                            SizedBox(width: 10,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                RichText(
                                  textAlign: TextAlign.start,
                                  text: TextSpan(children: <TextSpan>[
                                    TextSpan(
                                        text: "Your delivery time \n",
                                        style: TextStyle(color: Colors.grey,fontSize: 16.sp)),
                                    TextSpan(
                                        text: "30 Minutes ",
                                        style: TextStyle(color: Colors.black,fontSize: 14.sp)),
                                  ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(
                      height: 80,
                      width: MediaQuery.of(context).size.width*.85,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        onPressed: (){

                        },
                        child: Row(
                          children: [
                            Icon(Icons.location_on_sharp, color: Colors.orange, size: 35,),
                            SizedBox(width: 10,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                RichText(
                                  textAlign: TextAlign.start,
                                  text: TextSpan(children: <TextSpan>[
                                    TextSpan(
                                        text: "Your delivery Address \n",
                                        style: TextStyle(color: Colors.grey,fontSize: 16.sp)),
                                    TextSpan(
                                        text: "30 Minutes ",
                                        style: TextStyle(color: Colors.black,fontSize: 14.sp)),
                                  ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                Center(
                  child: SizedBox(
                    height: 45,
                    width: 250.w,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      onPressed: (){
                        //Navigator.push(context, MaterialPageRoute(builder: (context) =>Payment()));
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>PaymentMethod()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Complete Order",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check_box,
                      color: Colors.orange,
                      size: 18,
                    ),
                    SizedBox(width: 5,),
                    Text("Please pay your bill at cash on delivery",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20,),
              ]
          ),
        ),
      ),
    );
  }
}




