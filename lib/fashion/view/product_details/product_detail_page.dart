
import 'package:bpp_shop/fashion/controller/app_bar_controler.dart';
import 'package:bpp_shop/fashion/controller/product_detail_controller.dart';
import 'package:bpp_shop/fashion/model/best_selling_product.dart';
import 'package:bpp_shop/fashion/view/product_details/component/add_to_card_button.dart';
import 'package:bpp_shop/fashion/view/product_details/component/comments_box.dart';
import 'package:bpp_shop/fashion/view/product_details/component/size_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail({
    Key? key,
    this.productImageUrl,
    this.productName,
    this.productPrice,
  }) : super(key: key);

  String? productImageUrl;
  String? productName;
  String? productPrice;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail>
    with SingleTickerProviderStateMixin {
  TabController? _controllerTab;
  var item = 1;
  ProductDetailController productDetailController = ProductDetailController();

  @override
  void initState() {
    // TODO: implement initState
    //final selected = Provider.of<ProductDetailController>(context,listen: false);
    productDetailController.colorSelected(0);
    ProductDetailController;
    _controllerTab = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controllerTab!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selected = Provider.of<ProductDetailController>(context);
    //selected.colorSelected(0);
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  //fit: StackFit.loose,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width * .7,
                        decoration: BoxDecoration(
                            //color: Colors.green,
                            image: DecorationImage(
                                image: AssetImage(
                                    selected.productImageUrl.toString()),
                                fit: BoxFit.contain),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            )),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 120,
                        width: 45,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                selected.colorSelected(1);
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green,
                                  border: Border.all(
                                    color: selected.colorSelection == 1
                                        ? Colors.amber
                                        : Colors.white,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                selected.colorSelected(2);
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.deepPurpleAccent,
                                  border: Border.all(
                                    color: selected.colorSelection == 2
                                        ? Colors.amber
                                        : Colors.white,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                selected.colorSelected(3);
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.brown,
                                  border: Border.all(
                                    color: selected.colorSelection == 3
                                        ? Colors.amber
                                        : Colors.white,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 20,
                      child: GestureDetector(
                        onTap: () {
                          final appBar = Provider.of<PrimaryScreenState>(
                              context,
                              listen: false);
                          appBar.setPrimaryState(true);
                          final selection =
                              Provider.of<ProductDetailController>(context,
                                  listen: false);
                          selection.sizeSelected(0);
                          selection.colorSelected(0);

                          //Navigator.pop(context);
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.white, //Color(0xffFF6000),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.arrow_back_ios_outlined,
                            color: Colors.black,
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        selected.productName.toString(),
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        "\$ " + selected.productPrice.toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                    width: 100,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              item = item + 1;
                            });
                          },
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: Offset(
                                      0, 1), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Center(child: Text("+")),
                          ),
                        ),
                        Text(item.toString()),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (item > 1) {
                                item = item - 1;
                              }
                            });
                          },
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: Offset(
                                      0, 1), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Center(child: Text("-")),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Sizes"),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
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
                          ],
                        ),
                      ],
                    ),
                    // Column(
                    //   children: [
                    //     Row(
                    //       children: [
                    //         Text("Color "),
                    //         ColorButton(
                    //           buttonHeight: 25,
                    //           buttonWidth: 25,
                    //           icon: Icons.check,
                    //           color: Colors.deepPurpleAccent,
                    //         ),
                    //         ColorButton(
                    //           buttonHeight: 25,
                    //           buttonWidth: 25,
                    //           icon: Icons.check,
                    //           color: Colors.green,
                    //         ),
                    //         ColorButton(
                    //           buttonHeight: 25,
                    //           buttonWidth: 25,
                    //           icon: Icons.check,
                    //           color: Colors.greenAccent,
                    //         ),
                    //         ColorButton(
                    //           buttonHeight: 25,
                    //           buttonWidth: 25,
                    //           icon: Icons.check,
                    //           color: Colors.greenAccent,
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Color(0xffFF6000),
                  ),
                  Icon(
                    Icons.star,
                    color: Color(0xffFF6000),
                  ),
                  Icon(
                    Icons.star,
                    color: Color(0xffFF6000),
                  ),
                  Icon(
                    Icons.star,
                    color: Color(0xffFF6000),
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.grey,
                  ),
                  Text("(10 Reviews)")
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Description",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text('Watch'),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.play_arrow)
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.deepOrange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          side: BorderSide(width: 1, color: Colors.orange)),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  "When your app is opened, there is a brief time while the native app loads Flutter."
                  " By default, during this time, the native app displays a white splash screen. "
                  "This package automatically generates iOS, Android, and Web-native code for customizing "
                  "this native splash screen background color and splash image. Supports dark mode, full "
                  "screen, and platform-specific options",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                  child: Text(
                'Size Chart',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )),
              Container(
                margin: EdgeInsets.all(20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Container(
                          height: 34,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              border: Border.all(
                                width: .5,
                                color: Colors.grey,
                              )),
                          child: Center(
                            child: Text(
                              'Mid length Kameez',
                              style: TextStyle(
                                  fontSize: 11, color: Colors.white60),
                            ),
                          ),
                        ),
                        Container(
                          height: 34,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(
                            width: 1,
                            color: Colors.grey,
                          )),
                          child: Center(
                            child: Text(
                              'Chest',
                              style: TextStyle(
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 34,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(
                            width: 1,
                            color: Colors.grey,
                          )),
                          child: Center(
                            child: Text(
                              'Length',
                              style: TextStyle(
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 34,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(
                            width: 1,
                            color: Colors.grey,
                          )),
                          child: Center(
                            child: Text(
                              '(In Inch)',
                              style: TextStyle(
                                fontSize: 11,
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
                    Expanded(
                      flex: 2,
                      child: Table(
                        //defaultColumnWidth: FixedColumnWidth(120.0),
                        border: TableBorder.all(
                            color: Colors.grey,
                            style: BorderStyle.solid,
                            width: 1),
                        children: [
                          TableRow(children: [
                            Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('34'),
                            )),
                            Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('36'),
                            )),
                            Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('38'),
                            )),
                            Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('40'),
                            )),
                            Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('42'),
                            )),
                            Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('44'),
                            )),
                          ]),
                          TableRow(children: [
                            Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('34'),
                            )),
                            Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('36'),
                            )),
                            Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('38'),
                            )),
                            Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('40'),
                            )),
                            Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('42'),
                            )),
                            Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('44'),
                            )),
                          ]),
                          TableRow(children: [
                            Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('34'),
                            )),
                            Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('36'),
                            )),
                            Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('38'),
                            )),
                            Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('40'),
                            )),
                            Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('42'),
                            )),
                            Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('44'),
                            )),
                          ]),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: AddToCardButton(),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  bottom: TabBar(
                      labelColor: Colors.red,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Colors.red,
                      controller: _controllerTab,
                      indicatorWeight: 5,
                      indicatorPadding: EdgeInsets.symmetric(horizontal: 70),
                      tabs: [
                        Tab(
                          //icon: Icon(Icons.directions_bike),
                          child: Text(
                            "Write review",
                            style: TextStyle(fontSize: 15.sp),
                          ),
                        ),
                        Tab(
                          // icon: Icon(
                          //   Icons.directions_car,
                          // ),
                          child: Text(
                            "See all review",
                            style: TextStyle(fontSize: 15.sp),
                          ),
                        ),
                      ]),
                ),
              ),
              Container(
                height: 650,
                width: MediaQuery.of(context).size.width,
                child: TabBarView(controller: _controllerTab, children:[
                  Container(
                    //height: 400,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text('Rate your Experience'),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Color(0xffFF6000),
                            ),
                            Icon(
                              Icons.star,
                              color: Color(0xffFF6000),
                            ),
                            Icon(
                              Icons.star,
                              color: Color(0xffFF6000),
                            ),
                            Icon(
                              Icons.star,
                              color: Color(0xffFF6000),
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Review Title",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            focusColor: Colors.grey,
                            fillColor: Colors.grey,
                            hoverColor: Colors.grey,
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1),
                            ),
                            hintText: 'Type here..',
                            hintStyle:
                                TextStyle(fontSize: 12.0, color: Colors.grey),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Name",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            focusColor: Colors.grey,
                            fillColor: Colors.grey,
                            hoverColor: Colors.grey,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            hintText: 'Type here..',
                            hintStyle:TextStyle(fontSize: 12.0, color: Colors.grey),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Email",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            focusColor: Colors.grey,
                            fillColor: Colors.grey,
                            hoverColor: Colors.grey,
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1),
                            ),
                            hintText: 'Type here..',
                            hintStyle:
                                TextStyle(fontSize: 12.0, color: Colors.grey),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Your Review",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: TextField(
                            decoration: InputDecoration(
                              focusColor: Colors.grey,
                              fillColor: Colors.grey,
                              hoverColor: Colors.grey,
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1),
                              ),
                              hintText: 'Type here..',
                              hintStyle:
                                  TextStyle(fontSize: 12.0, color: Colors.grey),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 160.w,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text('Submit'),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.deepOrange,
                                onPrimary: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                side:
                                    BorderSide(width: 1, color: Colors.orange)),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    //height: 400,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        CommentsBox(
                          userImageUrl: "images/profile111.jpg",
                          userName: "User 1",
                          comments:
                              "As usual, there might be better examples on how to"
                              " achieve this result. Here's a fast attempt to recreate it."
                              " achieve this result. Here's a fast attempt to recreate it."
                              " achieve this result. Here's a fast attempt to recreate it.",
                        ),
                        CommentsBox(
                          userImageUrl: "images/profile111.jpg",
                          userName: "User 1",
                          comments:
                              "As usual, there might be better examples on how to"
                              " achieve this result. Here's a fast attempt to recreate it."
                              " achieve this result. Here's a fast attempt to recreate it."
                              " achieve this result. Here's a fast attempt to recreate it.",
                        ),
                        CommentsBox(
                          userImageUrl: "images/profile111.jpg",
                          userName: "User 1",
                          comments:
                              "As usual, there might be better examples on how to"
                              " achieve this result. Here's a fast attempt to recreate it."
                              " achieve this result. Here's a fast attempt to recreate it."
                              " achieve this result. Here's a fast attempt to recreate it.",
                        ),
                        CommentsBox(
                          userImageUrl: "images/profile111.jpg",
                          userName: "User 1",
                          comments:
                              "As usual, there might be better examples on how to"
                              " achieve this result. Here's a fast attempt to recreate it."
                              " achieve this result. Here's a fast attempt to recreate it."
                              " achieve this result. Here's a fast attempt to recreate it.",
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 460,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recommended for you',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      Container(
                        height: 400,
                        width: MediaQuery.of(context).size.width,
                        child: GridView.count(
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 20,
                          children: List.generate(
                              BestSellingProductModel.list.length, (index) {
                            BestSellingProductModel recProduct =
                                BestSellingProductModel.list[index];

                            return Container(
                              child: Card(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Image.asset(recProduct.imageUrl!),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(recProduct.productName!),
                                            Text(recProduct.productPrice!),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Color(0xffFF6000),
                                                  size: 10,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Color(0xffFF6000),
                                                  size: 10,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Color(0xffFF6000),
                                                  size: 10,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Color(0xffFF6000),
                                                  size: 10,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.grey,
                                                  size: 10,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
