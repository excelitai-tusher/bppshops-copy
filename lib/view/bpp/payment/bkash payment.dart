
import 'package:bpp_shop/component/customShape.dart';
import 'package:flutter/material.dart';



class bKashPayment extends StatefulWidget {
  const bKashPayment({Key? key}) : super(key: key);

  @override

  _bKashPaymentState createState() => _bKashPaymentState();
}

class _bKashPaymentState extends State<bKashPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.pinkAccent,
        elevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        title: Text(
          "Bkash",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
              child: Image(image: AssetImage("images/circle photo.png")),
              radius: 20,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: CustomShape(),
                child: Container(
                  height: 218,
                  color: Colors.pinkAccent,
                ),
              ),
              Positioned(
                top: 30,
                right: 0,
                left: 0,
                // bottom: 0,
                child: Card(
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  elevation: 5,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .16,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FittedBox(
                          child: Text(
                            'CURRENT BALANCE',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ),
                        SizedBox(height: 10),
                        FittedBox(
                          child: Text(
                            'TK. 45566.05',
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 24, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView(
                  shrinkWrap: true,
                  children: [
                    GridView.count(
                      primary: true,
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      crossAxisSpacing: 30.0,
                      mainAxisSpacing: 30.0,
                      padding: const EdgeInsets.all(20.0),
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Color(int.parse('0xff6AD77B')),
                              radius: 25,
                              child: Transform.rotate(angle: 12,
                              child: Icon(Icons.send, size: 22,color: Colors.white,)),
                            ),
                            SizedBox(height: 10,),
                            FittedBox(
                              child: Text(
                                "Send Money",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),

                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Color(int.parse('0xff66A7F3')),
                              radius: 25,
                              child: Transform.rotate(angle: 0,
                                  child: Icon(Icons.smartphone, size: 22,color: Colors.white,)),
                            ),
                            SizedBox(height: 10,),
                            FittedBox(
                              child: Text(
                                "Buy Airtime",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Color(int.parse('0xffE1BB58')),
                              radius: 25,
                              child: Transform.rotate(angle: 0,
                                  child: Icon(Icons.credit_card_rounded, size: 22,color: Colors.white,)),
                            ),
                            SizedBox(height: 10,),
                            FittedBox(
                              child: Text(
                                "Payment",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Color(int.parse('0xffC398F3')),
                              radius: 25,
                              child: Transform.rotate(angle: 0,
                                  child: Icon(Icons.card_travel_sharp, size: 22,color: Colors.white,)),
                            ),
                            SizedBox(height: 10,),
                            FittedBox(
                              child: Text(
                                "Cashout",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Color(int.parse('0xff8EAACA')),
                              radius: 25,
                              child: Transform.rotate(angle: 0,
                                  child: Icon(Icons.downloading_rounded, size: 22,color: Colors.white,)),
                            ),
                            SizedBox(height: 10,),
                            FittedBox(
                              child: Text(
                                "Remittance",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Color(int.parse('0xffF3B1CD')),
                              radius: 25,
                              child: Transform.rotate(angle: 0,
                                  child: Icon(Icons.access_time_rounded, size: 22,color: Colors.white,)),
                            ),
                            SizedBox(height: 10,),
                            FittedBox(
                              child: Text(
                                "Transactions",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Color(int.parse('0xff6AD77B')),
                              radius: 25,
                              child: Transform.rotate(angle: 0,
                                  child: Icon(Icons.other_houses_sharp, size: 22,color: Colors.white,)),
                            ),
                            SizedBox(height: 10,),
                            FittedBox(
                              child: Text(
                                "Other",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Color(int.parse('0xff66A7F3')),
                              radius: 25,
                              child: Transform.rotate(angle: 0,
                                  child: Icon(Icons.search, size: 22,color: Colors.white,)),
                            ),
                            SizedBox(height: 10,),
                            FittedBox(
                              child: Text(
                                "Search",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Color(int.parse('0xffE1BB58')),
                              radius: 25,
                              child: Transform.rotate(angle: 0,
                                  child: Icon(Icons.settings, size: 22,color: Colors.white,)),
                            ),
                            SizedBox(height: 10,),
                            FittedBox(
                              child: Text(
                                "Setting",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
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
    );
  }
}
