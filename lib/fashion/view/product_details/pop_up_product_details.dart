import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'component/add_to_card_button.dart';
import 'component/size_buttons.dart';

class PopUpProductDetail extends StatefulWidget {
  PopUpProductDetail({Key? key,this.currentImage}) : super(key: key);

  String? currentImage;

  @override
  State<PopUpProductDetail> createState() => _PopUpProductDetailState(currentImage: currentImage);
}

class _PopUpProductDetailState extends State<PopUpProductDetail> {
  _PopUpProductDetailState({this.currentImage});
  int count=1;
  String? currentImage;

  @override
  Widget build(BuildContext context){
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            height: MediaQuery.of(context).size.height*.8,
            width: MediaQuery.of(context).size.width*.85,
            //color: Colors.lime,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      // final appBar = Provider.of<AppBarController>(context,
                      //     listen: false);
                      // appBar.setAppBar(true);
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: Colors.white, //Color(0xffFF6000),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: Offset(0, 3), // changes position of shadow
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
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 350,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(currentImage!),
                                        //"images/ecom/men/shoe/shoe1.jpg"),
                                    fit: BoxFit.fill)),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      currentImage="images/ecom/men/shoe/shoe2.jpg";
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    height: 90,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "images/ecom/men/shoe/shoe2.jpg"),
                                            fit: BoxFit.fill)),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      currentImage="images/ecom/men/shoe/shoe3.jpg";
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    height: 90,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "images/ecom/men/shoe/shoe3.jpg"),
                                            fit: BoxFit.fill)),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      currentImage="images/ecom/men/shoe/shoe4.jpg";
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    height: 90,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "images/ecom/men/shoe/shoe4.jpg"),
                                            fit: BoxFit.fill)),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      currentImage="images/ecom/men/shoe/shoe5.jpg";
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    height: 90,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "images/ecom/men/shoe/shoe5.jpg"),
                                            fit: BoxFit.fill)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "T-Shirt",
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text("\$ 2,0000.0"),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "USD \$" + "255446756.0",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.black,
                                            decoration:
                                                TextDecoration.lineThrough
                                            //fontWeight: FontWeight.bold
                                            ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "50% OFF",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color(0xffFF6000),
                                            decoration:
                                                TextDecoration.lineThrough
                                            //fontWeight: FontWeight.bold
                                            ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 15,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 15,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 15,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 15,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.grey,
                                        size: 15,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text("(10 Reviews)"),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 5),
                                          child: SizedBox(
                                            height: 40,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                primary: Color(
                                                    0xffE3E3E3), //background color of button
                                                // side: BorderSide(
                                                //   width: 1,
                                                //   color: Colors.white,
                                                // ), //border width and color
                                                elevation:
                                                    3, //elevation of button
                                                shape: RoundedRectangleBorder(
                                                  //to set border radius to button
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                //padding: EdgeInsets.all(20) //content padding inside button
                                              ),
                                              onPressed: () {},
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                      "images/Vector.png"),
                                                  Text(
                                                    "5 Best Seller",
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: SizedBox(
                                            height: 40,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                primary: Color(
                                                    0xffE3E3E3), //background color of button
                                                // side: BorderSide(
                                                //   width: 1,
                                                //   color: Colors.white,
                                                // ), //border width and color
                                                elevation:
                                                    3, //elevation of button
                                                shape: RoundedRectangleBorder(
                                                    //to set border radius to button
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                //padding: EdgeInsets.all(20) //content padding inside button
                                              ),
                                              onPressed: () {},
                                              child: Row(
                                                children: [
                                                  Icon(Icons.supervisor_account,
                                                      color: Color(0xffFF6000)),
                                                  FittedBox(
                                                    fit: BoxFit.scaleDown,
                                                    child: Text(
                                                      "50 Active View This",
                                                      style: TextStyle(
                                                        //fontSize: 12,
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "After setting a global key for navigator (navigatorKey parameter of MaterialApp class),"
                                  " its current state becomes accessible from any part of the code. We can pass its context "
                                  "to the showDialog function. Make sure not to use it before the first frame is built,"
                                  " otherwise the state will be null.",
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Material: ",
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      "COTTON |",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      " Stock:",
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      "READY STOCK",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Size",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    SizeButton(
                                      buttonHeight: 30,
                                      buttonWidth: 30,
                                      title: "S",
                                      //color: Colors.orange,
                                    ),
                                    SizeButton(
                                      buttonHeight: 30,
                                      buttonWidth: 30,
                                      title: "M",
                                      //color: Colors.orange,
                                    ),
                                    SizeButton(
                                      buttonHeight: 30,
                                      buttonWidth: 30,
                                      title: "L",
                                      //color: Colors.orange,
                                    ),
                                    SizeButton(
                                      buttonHeight: 30,
                                      buttonWidth: 30,
                                      title: "X",
                                      //color: Colors.orange,
                                    ),
                                    SizeButton(
                                      buttonHeight: 30,
                                      buttonWidth: 30,
                                      title: "XL",
                                      //color: Colors.orange,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Color",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 2),
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          color: Colors.deepPurple,
                                          shape: BoxShape.circle),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 2),
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          color: Colors.amber,
                                          shape: BoxShape.circle),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 2),
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          color: Colors.brown,
                                          shape: BoxShape.circle),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 2),
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          color: Colors.deepOrange,
                                          shape: BoxShape.circle),
                                      child: Icon(
                                        Icons.check,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 2),
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          color: Colors.cyanAccent,
                                          shape: BoxShape.circle),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 2),
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          color: Colors.black54,
                                          shape: BoxShape.circle),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 2),
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          color: Colors.deepPurple,
                                          shape: BoxShape.circle),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Quantity",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 45,
                                  width: MediaQuery.of(context).size.width * .6,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              ++count;
                                            });
                                          },
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            width:
                                                MediaQuery.of(context).size.width,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 1,
                                                color: Colors.black,
                                              ),
                                            ),
                                            child: Center(
                                                child: Icon(
                                              FontAwesomeIcons.plus,
                                              size: 15,
                                            )),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 1,
                                              color: Colors.black,
                                            ),
                                          ),
                                          child: Center(
                                              child: Text(
                                            count.toString(),
                                            style: TextStyle(fontSize: 20),
                                          )),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              if(count>0){
                                                --count;
                                              }
                                            });
                                          },
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            width:
                                                MediaQuery.of(context).size.width,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 1,
                                                color: Colors.black,
                                              ),
                                            ),
                                            child: Center(
                                                child: Icon(
                                              FontAwesomeIcons.minus,
                                              size: 15,
                                            )),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: AddToCardButton(),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                              ],
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
      ),
    );
  }
}
