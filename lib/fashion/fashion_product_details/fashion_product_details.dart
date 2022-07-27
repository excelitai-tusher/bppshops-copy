import 'package:bpp_shop/fashion/fashion_product_details/review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../component/cart.dart';
import '../../component/size button.dart';
import '../../component/size color.dart';
import '../../view/bpp/cart/cart_item.dart';
import '../../view_model/bpp/cart_provider.dart';
import '../fashion_cart/cart_fashion.dart';
import '../provider/fashion_product_details.dart';

class Fashion_Product_Details extends StatefulWidget {
  //const Fashion_Product_Details({Key? key}) : super(key: key);
  static const routeName = '/fashion_product_details';

  @override
  State<Fashion_Product_Details> createState() =>
      _Fashion_Product_DetailsState();
}

class _Fashion_Product_DetailsState extends State<Fashion_Product_Details> {
  String? video;
  String? details;
  //const TabBarScreen({Key? key}) : super(key: key);
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: '5j2AbiovRyk', // id youtube video
    flags: YoutubePlayerFlags(
      controlsVisibleAtStart: true,
      autoPlay: false,
      mute: false,
    ),
  );

  int _count = 0;

  void _increment() {
    setState(() {
      _count++;
    });
  }

  void _decrement() {
    setState(() {
      _count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    //final cart = Provider.of<Cart>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffFF6000),
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: Center(
            child: Text(
              "Product Details",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .3,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.6),
                    color: Colors.grey.shade200,
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-SPERrJdy4jJTNn-ILR_tFx9dPliGis3iyWF0EyzOqj2sDlXY4VM47ta8yD6EjOIkRpI&usqp=CAU"),
                      fit: BoxFit.fill,
                    ),
                    // image: DecorationImage(
                    //   image: NetworkImage("${args.toString()}")
                    // ),
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: MediaQuery.of(context).size.height * .1,
                          width: MediaQuery.of(context).size.width * .28,
                          decoration: new BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 0.5),
                            color: Colors.grey.shade200,
                            image: new DecorationImage(
                              image: NetworkImage(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-SPERrJdy4jJTNn-ILR_tFx9dPliGis3iyWF0EyzOqj2sDlXY4VM47ta8yD6EjOIkRpI&usqp=CAU"),
                              fit: BoxFit.fill,
                            ),
                          )),
                      Container(
                          height: MediaQuery.of(context).size.height * .1,
                          width: MediaQuery.of(context).size.width * .28,
                          decoration: new BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 0.5),
                            color: Colors.grey.shade200,
                            image: new DecorationImage(
                              image: NetworkImage(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-SPERrJdy4jJTNn-ILR_tFx9dPliGis3iyWF0EyzOqj2sDlXY4VM47ta8yD6EjOIkRpI&usqp=CAU"),
                              fit: BoxFit.fill,
                            ),
                          )),
                      Container(
                          height: MediaQuery.of(context).size.height * .1,
                          width: MediaQuery.of(context).size.width * .28,
                          decoration: new BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 0.5),
                            color: Colors.grey.shade200,
                            image: new DecorationImage(
                              image: NetworkImage(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-SPERrJdy4jJTNn-ILR_tFx9dPliGis3iyWF0EyzOqj2sDlXY4VM47ta8yD6EjOIkRpI&usqp=CAU"),
                              fit: BoxFit.fill,
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  "Ladies Stylish Long Stitched kameez By /n Guljee",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18..sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: '৳2,000.0',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                            color: Colors.green,
                          ),
                          children: <InlineSpan>[
                            WidgetSpan(
                                // baseline: TextBaseline.alphabetic,
                                child: SizedBox(width: 10.w)),
                            TextSpan(
                              text: '৳ 2,500.0',
                              style: TextStyle(
                                  color: Theme.of(context).errorColor,
                                  fontSize: 14.sp,
                                  decoration: TextDecoration.lineThrough),
                            ),
                            WidgetSpan(
                                child: SizedBox(
                              width: 10.w,
                            )),
                            TextSpan(
                              text: '50% OFF',
                              style: TextStyle(
                                color: Color(0xffFF6000),
                                fontSize: 14.sp,
                              ),
                            )
                          ]),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.star,
                      size: 8.h,
                      color: Color(0xffFF6000),
                    ),
                    Icon(
                      Icons.star,
                      size: 8.h,
                      color: Color(0xffFF6000),
                    ),
                    Icon(
                      Icons.star,
                      size: 8.h,
                      color: Color(0xffFF6000),
                    ),
                    Icon(
                      Icons.star,
                      size: 8.h,
                      color: Color(0xffFF6000),
                    ),
                    Icon(
                      Icons.star,
                      size: 8.h,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 10.h,
                    ),
                    Text(
                      "(10 Reviews)",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18..sp,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Material:',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color: Color(0xff939B9E),
                        ),
                        children: [
                          TextSpan(
                            text: 'COTTON',
                            style: TextStyle(
                              color: Color(0xff444444),
                              fontSize: 14.sp,
                            ),
                          ),
                          WidgetSpan(
                              child: SizedBox(
                            width: 10.w,
                          )),
                          TextSpan(
                              text: 'Stock:',
                              style: TextStyle(
                                color: Color(0xff939B9E),
                                fontSize: 14.sp,
                              ),
                              children: [
                                TextSpan(
                                  text: 'READY STOCK',
                                  style: TextStyle(
                                    color: Color(0xff939B9E),
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ])
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Size",
                      style:
                          TextStyle(fontWeight: FontWeight.w600,),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    SizeButton(
                      buttonHeight: 25,
                      buttonWidth: 25,
                      title: "S",
                      size: 1,
                    ),
                    SizeButton(
                      buttonHeight: 25,
                      buttonWidth: 25,
                      title: "M",
                      size: 2,
                    ),
                    SizeButton(
                      buttonHeight: 25,
                      buttonWidth: 25,
                      title: "L",
                      size: 3,
                    ),
                    SizeButton(
                      buttonHeight: 25,
                      buttonWidth: 25,
                      title: "XL",
                      size: 4,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .2,
                    ),
                    Text(
                      "**Required",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 12.h,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Color",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizeColor(
                              buttonHeight: 25,
                              buttonWidth: 45,
                              title: "Purple",
                              size: 1,
                            ),
                            SizeColor(
                              buttonHeight: 25,
                              buttonWidth: 45,
                              title: "Blue",
                              size: 2,
                            ),
                            SizeColor(
                              buttonHeight: 25,
                              buttonWidth: 45,
                              title: "Black",
                              size: 3,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .1,
                            ),
                            Text(
                              "**Required",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 12.h,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            SizeColor(
                              buttonHeight: 25,
                              buttonWidth: 45,
                              title: "Green",
                              size: 4,
                            ),
                            SizeColor(
                              buttonHeight: 25,
                              buttonWidth: 45,
                              title: "Yellow",
                              size: 4,
                            ),
                            SizeColor(
                              buttonHeight: 25,
                              buttonWidth: 45,
                              title: "Orange",
                              size: 4,
                            ),
                            SizeColor(
                              buttonHeight: 25,
                              buttonWidth: 45,
                              title: "Red",
                              size: 4,
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Quantity',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    SizedBox(
                      width: 10.h,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .5,
                      height: 30.h,
                      //  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
// padding: EdgeInsets.symmetric(vertical: 0,horizontal: 6),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Center(
                            child: TextButton(
                              child: Icon(
                                Icons.add,
                                color: Colors.grey,
                              ),
                              onPressed: _increment,
                            ),
                          ),
                          VerticalDivider(
                            color: Colors.black,
                          ),
                          Text("${_count}"),
                          VerticalDivider(
                            color: Colors.black,
                          ),
                          Center(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                primary: Colors.grey,
                              ),
                              child: Icon(
                                Icons.remove,
                                color: Colors.grey,
                              ),
                              onPressed: _decrement,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .6,
                    height: 30,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xffFF6000),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => FashionCart()));
                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                        size: 12.sp,
                      ),
                      label: Text(
                        'Add to Bag',
                        style: TextStyle(color: Colors.white, fontSize: 13.sp),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: 'Tags: ',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                            color: Colors.grey,
                          ),
                          children: <InlineSpan>[
                            WidgetSpan(
                                // baseline: TextBaseline.alphabetic,
                                child: SizedBox(width: 10.w)),
                            TextSpan(
                              text: 'Kameez',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                              ),
                            ),
                            WidgetSpan(
                                child: SizedBox(
                              width: 10.w,
                            )),
                            TextSpan(
                              text: 'Long Kameez',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                              ),
                            )
                          ]),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                       "Share",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                    ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Image(
                      image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTu8VvYNTcAGIU_32bRpjakvSC7M4zRActSc83c5I5VB1J3Wogf6kAWbvgUfcf0RPvwgdM&usqp=CAU"),
                      //image: AssetImage("images/facebook.png"),
                      fit: BoxFit.cover,
                      height: 35.w,
                      width: 25.w,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Image(
                      image: NetworkImage("https://cdn2.downdetector.com/static/uploads/logo/fb-messenger.png"),
                      //image: AssetImage("images/massenger.png"),
                      fit: BoxFit.cover,
                      height: 25.w,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Image(
                      image: AssetImage("images/instragram.jpeg"),
                      fit: BoxFit.cover,
                      width: 25.w,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Image(
                      image: AssetImage("images/whats's up.jpeg"),
                      fit: BoxFit.cover,
                      width: 25.w,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Image(
                      image: AssetImage("images/share1.png"),
                      color: Colors.orange,
                      fit: BoxFit.cover,
                      width: 25.w,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  height: 350.h,
                  child: DefaultTabController(
                    length: 3,
                    child: new Scaffold(
                      appBar: new PreferredSize(
                        preferredSize: Size.fromHeight(kToolbarHeight),
                        child: new Container(
                          child: new TabBar(
                            labelColor: Theme.of(context).primaryColor,
                            unselectedLabelColor: Colors.grey,
                            tabs: [
                              new Text("Product Details"),
                              new Text("Size Chart"),
                              new Text("Write review"),
                            ],
                          ),
                        ),
                      ),
                      body: new TabBarView(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 5, right: 5, top: 15),
                            padding: EdgeInsets.only(left: 15, right: 15),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 1)),
                            child: ListView(children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Product Long description",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "Lorem ipsum dolor sit amet, consectetur piscing \nElit. Porttitor pharetra duis ut praesent pharetra \nnon massa turpis tellus. Quisque non augue \nurna elementum lectus.",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              Html(
                                data: "${details}",

                                //style: TextStyle(fontSize: 14, color: Colors.black45),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 200,
                                child: YoutubePlayer(
                                  controller: _controller,
                                  showVideoProgressIndicator: true,
                                  progressIndicatorColor: Colors.blueAccent,
                                ),
                              ),
                            ]),
                          ),
                          SingleChildScrollView(
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: new Column(
                                children: <Widget>[
                                  //new Text("")
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
                                        primary: Color(0xffFF6000),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    FashionReview()));
                                      },
                                      icon: Icon(
                                        Icons.shopping_cart,
                                        color: Colors.white,
                                        size: 12.sp,
                                      ),
                                      label: Text(
                                        'Mid Length Kameez',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.sp),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 20),
                                    height:
                                        MediaQuery.of(context).size.height * .6,
                                    width: MediaQuery.of(context).size.width,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          DataTable(
                                            columns: [
                                              DataColumn(
                                                  label: Text('CHEST',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight: FontWeight
                                                              .bold))),
                                              DataColumn(
                                                  label: Text('LENGTH',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight: FontWeight
                                                              .bold))),
                                            ],
                                            rows: [
                                              DataRow(cells: [
                                                DataCell(
                                                  Text('32'),
                                                ),
                                                DataCell(Text('40')),
                                              ]),
                                              DataRow(cells: [
                                                DataCell(Text('34')),
                                                DataCell(Text('40')),
                                              ]),
                                              DataRow(cells: [
                                                DataCell(Text('36')),
                                                DataCell(Text('40')),
                                              ]),
                                              DataRow(cells: [
                                                DataCell(Text('38')),
                                                DataCell(Text('40')),
                                              ]),
                                              DataRow(cells: [
                                                DataCell(Text('40')),
                                                DataCell(Text('42')),
                                              ]),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              child: new Column(
                                children: <Widget>[
                                  //new Text("")
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Customer Reviews',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.edit),
                                        onPressed: () {
                                          //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Review ()));
                                        },
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 20),
                                    height: 100,
                                    width: MediaQuery.of(context).size.width,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ListTile(
                                            isThreeLine: true,
                                            leading: CircleAvatar(
                                              backgroundColor:
                                                  Colors.greenAccent[400],
                                              radius: 30,
                                              backgroundImage: AssetImage(
                                                  "images/handsome.png"),
                                            ),
                                            title: Text(
                                              "Amar Smith",
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                            subtitle: Text("Product Review"),
                                            trailing: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .1,
                                              child: FittedBox(
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      color: Colors.orange,
                                                    ),
                                                    Icon(
                                                      Icons.star,
                                                      color: Colors.orange,
                                                    ),
                                                    Icon(
                                                      Icons.star,
                                                      color: Colors.orange,
                                                    ),
                                                    Icon(
                                                      Icons.star,
                                                    ),
                                                    Icon(
                                                      Icons.star,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * .2,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width * .3,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            //borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://pbs.twimg.com/profile_images/1024613191081324544/o-OxL6eH_400x400.jpg"),
                            ),
                            // image: DecorationImage(
                            //   image: get.productThambnail !=
                            //       null
                            //       ? NetworkImage(
                            //       "https://bppshops.com/${get.productThambnail}")
                            //       : NetworkImage(
                            //       'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg'),
                            //   // AssetImage(item.productImageUrl.toString()),
                            //   fit: BoxFit.contain,
                            // ),
                          ),
                        ),
                        SizedBox(width: 20.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                "Red Shopping Bag Bag \nbag bag",
                                //    item.productName.toString(),
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Container(
                              width: MediaQuery.of(context).size.width * .1,
                              child: FittedBox(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                    ),
                                    Icon(
                                      Icons.star,
                                    ),
                                    Icon(
                                      Icons.star,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              '৳ 2,000.0',
                              style: TextStyle(color: Colors.green),
                            ),
                            Text(
                              '৳ 2,500.0',
                              style: TextStyle(
                                  color: Colors.red,
                                  decoration: TextDecoration.lineThrough),
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xffFF6000),
                                ),
                                onPressed: () {
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => FashionDetailsController()));
                                },
                                // icon: Icon(
                                //   Icons.shopping_cart,
                                //   color: Colors.white,
                                //   size: 12.sp,
                                // ),
                                child: Text(
                                  'Shop Now',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15.sp),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * .2,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width * .3,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            //borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://pbs.twimg.com/profile_images/1024613191081324544/o-OxL6eH_400x400.jpg"),
                            ),
                            // image: DecorationImage(
                            //   image: get.productThambnail !=
                            //       null
                            //       ? NetworkImage(
                            //       "https://bppshops.com/${get.productThambnail}")
                            //       : NetworkImage(
                            //       'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg'),
                            //   // AssetImage(item.productImageUrl.toString()),
                            //   fit: BoxFit.contain,
                            // ),
                          ),
                        ),
                        SizedBox(width: 20.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                "Red Shopping Bag Bag \nbag bag",
                                //    item.productName.toString(),
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Container(
                              width: MediaQuery.of(context).size.width * .1,
                              child: FittedBox(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                    ),
                                    Icon(
                                      Icons.star,
                                    ),
                                    Icon(
                                      Icons.star,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              '৳ 2,000.0',
                              style: TextStyle(color: Colors.green),
                            ),
                            Text(
                              '৳ 2,500.0',
                              style: TextStyle(
                                  color: Colors.red,
                                  decoration: TextDecoration.lineThrough),
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xffFF6000),
                                ),
                                onPressed: () {
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => FashionDetailsController()));
                                },
                                // icon: Icon(
                                //   Icons.shopping_cart,
                                //   color: Colors.white,
                                //   size: 12.sp,
                                // ),
                                child: Text(
                                  'Shop Now',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15.sp),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * .2,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width * .3,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            //borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://pbs.twimg.com/profile_images/1024613191081324544/o-OxL6eH_400x400.jpg"),
                            ),
                            // image: DecorationImage(
                            //   image: get.productThambnail !=
                            //       null
                            //       ? NetworkImage(
                            //       "https://bppshops.com/${get.productThambnail}")
                            //       : NetworkImage(
                            //       'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg'),
                            //   // AssetImage(item.productImageUrl.toString()),
                            //   fit: BoxFit.contain,
                            // ),
                          ),
                        ),
                        SizedBox(width: 20.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                "Red Shopping Bag Bag \nbag bag",
                                //    item.productName.toString(),
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Container(
                              width: MediaQuery.of(context).size.width * .1,
                              child: FittedBox(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                    ),
                                    Icon(
                                      Icons.star,
                                    ),
                                    Icon(
                                      Icons.star,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              '৳ 2,000.0',
                              style: TextStyle(color: Colors.green),
                            ),
                            Text(
                              '৳ 2,500.0',
                              style: TextStyle(
                                  color: Colors.red,
                                  decoration: TextDecoration.lineThrough),
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xffFF6000),
                                ),
                                onPressed: () {
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => FashionDetailsController()));
                                },
                                // icon: Icon(
                                //   Icons.shopping_cart,
                                //   color: Colors.white,
                                //   size: 12.sp,
                                // ),
                                child: Text(
                                  'Shop Now',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15.sp),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
