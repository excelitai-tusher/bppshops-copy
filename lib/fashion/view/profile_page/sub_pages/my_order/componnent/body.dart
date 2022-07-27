
import 'package:bpp_shop/fashion/model/my_order_model_item.dart';
import 'package:bpp_shop/fashion/view/profile_page/sub_pages/my_order/componnent/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class Body extends StatefulWidget {

  const Body({Key? key,}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();

}

class _BodyState extends State<Body> {
  List<String> category = ["Delivered", "Processing", "Cancelled"];
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height/ 12,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) => Category(index),
            ),
          ),

          //item(),
          // Center(
          //   child: selectedIndex==0? item(): process(),
          // ),
          if(selectedIndex == 0)...[
            item()
          ]else if(selectedIndex == 1)...[
            process()
          ]else if(selectedIndex == 2)...[
            Cancelled(),
          ],
          //Order(),
          //process(),
        ],
      ),
    );
  }

  Widget Category(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Text(
                  category[index],
                  style: TextStyle(
                    color: selectedIndex == index ? kTextColor : kTextLightColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: kDefaultPaddin),
                  height: 2,
                  width: 30,
                  color: selectedIndex == index ? Colors.black : Colors.transparent,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget item(){
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: Item.list.length,
      itemBuilder: (BuildContext context, i) {
        Item product= Item.list[i];
        return Container(
          height: 120,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Card(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("Item name: ", style: TextStyle(color: Colors.black, fontFamily: 'Roboto-Regular.ttf'),
                            ),
                            Text(product.ItemName.toString(), style: TextStyle(color: Colors.black38, fontFamily: 'Roboto-Regular.ttf')),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Order No: ", style: TextStyle(color: Colors.black, fontFamily: 'Roboto-Regular.ttf'),
                            ),
                            Text(product.OrderNo.toString(), style: TextStyle(color: Colors.black38, fontFamily: 'Roboto-Regular.ttf')),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Quantity: ", style: TextStyle(color: Colors.black, fontFamily: 'Roboto-Regular.ttf'),
                            ),
                            Text(product.Quantity.toString(), style: TextStyle(color: Colors.black38, fontFamily: 'Roboto-Regular.ttf')),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(product.Date.toString()),
                        Row(
                          children: [
                            Text("Total Amount: ", style: TextStyle(color: Colors.black, fontFamily: 'Roboto-Regular.ttf'),
                            ),
                            Text(product.TotalAmount.toString(), style: TextStyle(color: Colors.black38, fontFamily: 'Roboto-Regular.ttf')),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Status: ", style: TextStyle(color: Colors.black, fontFamily: 'Roboto-Regular.ttf'),
                            ),
                            Text(product.Status.toString(), style: TextStyle(color: Colors.green, fontFamily: 'Roboto-Regular.ttf')),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(width: 3,);
      },
    );
  }

  Widget process(){
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: (){

                        },
                        child: Text("Today",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: 'Roboto-Regular.ttf'
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    SizedBox(
                      width: 120,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: BorderSide(color: Colors.deepOrange),
                          ),
                          primary: Colors.white,
                        ),
                        onPressed: (){

                        },
                        child: Text("Tomorrow",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontFamily: 'Roboto-Regular.ttf'
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    SizedBox(
                      width: 110,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: BorderSide(color: Colors.deepOrange),
                          ),
                          primary: Colors.white,
                        ),
                        onPressed: (){},
                        child: Text("Sat 17",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontFamily: 'Roboto-Regular.ttf'
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Column(
                children: [
                  Text("3.52 PM",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto-Regular.ttf'
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Container(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Order #75",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'Roboto-Regular.ttf'
                      ),
                    ),
                    SizedBox(height: 5,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Nisha Rahman",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontFamily: 'Roboto-Regular.ttf'
                          ),
                        ),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("half Silk Katan Sharee",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontFamily: 'Roboto-Regular.ttf'
                              ),
                            ),
                            //SizedBox(width: 10,),
                            Text("4X",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontFamily: 'Roboto-Regular.ttf'
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Cotton 3 pcs",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontFamily: 'Roboto-Regular.ttf'
                              ),
                            ),
                            SizedBox(width: 10,),
                            Text("2X",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontFamily: 'Roboto-Regular.ttf'
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              new Divider(
                thickness: 2.5,
                color: Colors.black12,
              ),
              SizedBox(height: 10,),
              Column(
                children: [
                  Text("3.52 PM",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto-Regular.ttf'
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Container(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Order #75",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'Roboto-Regular.ttf'
                      ),
                    ),
                    SizedBox(height: 5,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Nisha Rahman",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontFamily: 'Roboto-Regular.ttf'
                          ),
                        ),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("half Silk Katan Sharee",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontFamily: 'Roboto-Regular.ttf'
                              ),
                            ),
                            SizedBox(width: 10,),
                            Text("4X",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontFamily: 'Roboto-Regular.ttf'
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Cotton 3 pcs",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontFamily: 'Roboto-Regular.ttf'
                              ),
                            ),
                            SizedBox(width: 10,),
                            Text("2X",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontFamily: 'Roboto-Regular.ttf'
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    new Divider(
                      thickness: 2.5,
                      color: Colors.black12,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Column(
                children: [
                  Text("3.52 PM",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto-Regular.ttf'
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Container(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Order #75",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'Roboto-Regular.ttf'
                      ),
                    ),
                    SizedBox(height: 5,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Nisha Rahman",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontFamily: 'Roboto-Regular.ttf'
                          ),
                        ),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("half Silk Katan Sharee",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontFamily: 'Roboto-Regular.ttf'
                              ),
                            ),
                            SizedBox(width: 10,),
                            Text("4X",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontFamily: 'Roboto-Regular.ttf'
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Cotton 3 pcs",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontFamily: 'Roboto-Regular.ttf'
                              ),
                            ),
                            SizedBox(width: 10,),
                            Text("2X",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontFamily: 'Roboto-Regular.ttf'
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    new Divider(
                      thickness: 2.5,
                      color: Colors.black12,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget Cancelled(){
    var _itemCount = null;
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Center(child: Image(image: AssetImage("images/image 29.png"))),
            ),
            SizedBox(height: 20,),
            Container(
              child: Column(
                children: [
                  Text("This order will no longer be visible in your",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto-Regular.ttf'
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: Column(
                  children: [
                    Text("cart.",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto-Regular.ttf'
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 120,
              width: 360,
              decoration: BoxDecoration(
                border: Border.symmetric(horizontal: BorderSide.none),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white.withOpacity(0.5),
                //color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20), // Image border
                        child: SizedBox.fromSize(
                          size: Size.fromRadius(48), // Image radius
                          child: Image.asset("images/photo.png"),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Goggles",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontFamily: 'Roboto-Regular.ttf'
                              ),
                            ),
                            SizedBox(height: 20,),
                            Text("1000.0",
                              style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Roboto-Regular.ttf'
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10,),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 60),
                            child: Icon(Icons.cancel_outlined,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 20,),
                          FittedBox(
                            fit: BoxFit.cover,
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: ()=> setState(() {
                                    _itemCount;
                                  }),
                                  icon: Icon(Icons.add_box, color: Colors.grey,),
                                ),
                                Text("01",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Roboto-Regular.ttf'
                                  ),
                                ),
                                //Text(_itemCount.toString()),
                                IconButton(
                                  onPressed: ()=> setState(() {
                                    _itemCount != 01 ? _itemCount : _itemCount;
                                  }),
                                  icon: Icon(Icons.remove_circle_outline, color: Colors.grey,),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 120,
              width: 360,
              decoration: BoxDecoration(
                border: Border.symmetric(horizontal: BorderSide.none),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white.withOpacity(0.6),
                //color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20), // Image border
                        child: SizedBox.fromSize(
                          size: Size.fromRadius(48), // Image radius
                          child: Image.asset("images/photo.png"),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Goggles",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontFamily: 'Roboto-Regular.ttf'
                              ),
                            ),
                            SizedBox(height: 20,),
                            Text("1000.0",
                              style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Roboto-Regular.ttf'
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10,),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 60),
                            child: Icon(Icons.cancel_outlined,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 20,),
                          FittedBox(
                            fit: BoxFit.cover,
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: ()=> setState(() {
                                    _itemCount;
                                  }),
                                  icon: Icon(Icons.add_box, color: Colors.grey,),
                                ),
                                Text("01",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Roboto-Regular.ttf'
                                  ),
                                ),
                                //Text(_itemCount.toString()),
                                IconButton(
                                  onPressed: ()=> setState(() {
                                    _itemCount != 01 ? _itemCount : _itemCount;
                                  }),
                                  icon: Icon(Icons.remove_circle_outline, color: Colors.grey,),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 120,
              width: 360,
              decoration: BoxDecoration(
                border: Border.symmetric(horizontal: BorderSide.none),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white.withOpacity(0.5),
                //color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20), // Image border
                        child: SizedBox.fromSize(
                          size: Size.fromRadius(48), // Image radius
                          child: Image.asset("images/photo.png"),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Goggles",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontFamily: 'Roboto-Regular.ttf'
                              ),
                            ),
                            SizedBox(height: 20,),
                            Text("1000.0",
                              style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Roboto-Regular.ttf'
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10,),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 60),
                            child: Icon(Icons.cancel_outlined,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 20,),
                          FittedBox(
                            fit: BoxFit.cover,
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: ()=> setState(() {
                                    _itemCount;
                                  }),
                                  icon: Icon(Icons.add_box, color: Colors.grey,),
                                ),
                                Text("01",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Roboto-Regular.ttf'
                                  ),
                                ),
                                //Text(_itemCount.toString()),
                                IconButton(
                                  onPressed: ()=> setState(() {
                                    _itemCount != 01 ? _itemCount : _itemCount;
                                  }),
                                  icon: Icon(Icons.remove_circle_outline, color: Colors.grey,),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

