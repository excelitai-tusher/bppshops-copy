import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'fashion_product_details.dart';

class FashionReview extends StatefulWidget {
  const FashionReview({Key? key}) : super(key: key);

  @override
  _FashionReviewState createState() => _FashionReviewState();
}

class _FashionReviewState extends State<FashionReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFF6000),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.white,), onPressed: (){
          Navigator.of(context).pop();
        },),
        title: FittedBox(
          child: Text(
            "Review",
            style: TextStyle(
              fontSize: 20.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                child: Text(
                  "     Write Your Own Reviews",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20.sp),
                child: Table(
                  border: TableBorder.all(
                      color: Colors.black,
                      style: BorderStyle.solid,
                      width: .5,
                  ),
                  children: [
                    TableRow( children: [
                      Column(children:[Text(' ', style: TextStyle(fontSize: 10.0))]),
                      Column(children:[Text('1 Star', style: TextStyle(fontSize: 10.0))]),
                      Column(children:[Text('2 Star', style: TextStyle(fontSize: 10.0))]),
                      Column(children:[Text('3 Star', style: TextStyle(fontSize: 10.0))]),
                      Column(children:[Text('4 Star', style: TextStyle(fontSize: 10.0))]),
                      Column(children:[Text('5 Star', style: TextStyle(fontSize: 10.0))]),
                    ]),
                    TableRow( children: [
                      Column(children:[Text('Quality', style: TextStyle(fontSize: 10.0))]),
                      Column(children:[Icon(Icons.radio_button_off, size: 10.sp, color: Colors.grey,)]),
                      Column(children:[Icon(Icons.radio_button_off,size: 10.sp,color: Colors.grey,)]),
                      Column(children:[Icon(Icons.radio_button_off,size: 10.sp,color: Colors.grey,)]),
                      Column(children:[Icon(Icons.radio_button_off,size: 10.sp,color: Colors.grey,)]),
                      Column(children:[Icon(Icons.radio_button_off,size: 10.sp,color: Colors.grey,)]),

                    ]),
                    TableRow( children: [
                      Column(children:[Text('Price', style: TextStyle(fontSize: 10.0))]),
                      Column(children:[Icon(Icons.radio_button_off,size: 10.sp,color: Colors.grey,)]),
                      Column(children:[Icon(Icons.radio_button_off,size: 10.sp,color: Colors.grey,)]),
                      Column(children:[Icon(Icons.radio_button_off,size: 10.sp,color: Colors.grey,)]),
                      Column(children:[Icon(Icons.radio_button_off,size: 10.sp,color: Colors.grey,)]),
                      Column(children:[Icon(Icons.radio_button_off,size: 10.sp,color: Colors.grey,)]),

                    ]),
                    TableRow( children: [
                      Column(children:[Text('Value', style: TextStyle(fontSize: 10.0))]),
                      Column(children:[Icon(Icons.radio_button_off,size: 10.sp,color: Colors.grey,)]),
                      Column(children:[Icon(Icons.radio_button_off,size: 10.sp,color: Colors.grey,)]),
                      Column(children:[Icon(Icons.radio_button_off,size: 10.sp,color: Colors.grey,)]),
                      Column(children:[Icon(Icons.radio_button_off,size: 10.sp,color: Colors.grey,)]),
                      Column(children:[Icon(Icons.radio_button_off,size: 10.sp,color: Colors.grey,)]),

                    ]),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              FittedBox(
                child: Text(
                  "Review",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 10.0),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    maximumSize: Size(125.w, 40.h),
                    primary: Color(0xffFF6000),
                  ),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(child: Text('Submit',style: TextStyle(fontSize: 16, color: Colors.white),)),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Fashion_Product_Details()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}


