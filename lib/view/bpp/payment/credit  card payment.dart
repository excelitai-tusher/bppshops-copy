import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class CardPayment extends StatefulWidget {
  const CardPayment({Key? key}) : super(key: key);

  @override
  _CardPaymentState createState() => _CardPaymentState();
}

class _CardPaymentState extends State<CardPayment> {
  bool check=false;
  bool status1 = false;

  void _check(){
    setState(() {
      check =!check;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back, color: Colors.white,)),
        title: Text(
          "Payment Method",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Column(
                children: [
                  ListTile(
                    onTap:_check,
                    leading: Icon(Icons.credit_card_rounded, color: Colors.blueAccent, size: 40,),
                    title: Text('Credit or Debit Card'),
                    trailing:check? Icon(Icons.check_circle, color: Colors.blueAccent,):null,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            FittedBox(
              child: Text(
                "Card Details",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 40,
              width: MediaQuery.of(context).size.width * .9,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Name on card',
                  hintStyle: TextStyle(fontSize: 12.0, color: Colors.grey),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 40,
              width: MediaQuery.of(context).size.width * .9,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefix: FittedBox(child: Text("VISA", style: TextStyle(color: Colors.blue, fontSize: 18),)),
                  hintText: '  **** **** **** 1234',
                  hintStyle: TextStyle(fontSize: 12.0, color: Colors.grey),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        height: 35,
                        width: MediaQuery.of(context).size.width * .3,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'MM/YY',
                            hintStyle: TextStyle(fontSize: 12.0, color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        height: 35,
                        width: MediaQuery.of(context).size.width * .3,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'CVV',
                            hintStyle: TextStyle(fontSize: 12.0, color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FittedBox(
                  child: Text(
                    "Save credit card information for next time",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                FlutterSwitch(
                  showOnOff: true,
                  activeTextColor: Colors.black,
                  inactiveTextColor: Colors.red,
                  value: status1,
                  onToggle: (val) {
                    setState(() {
                      status1 = val;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                ),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FittedBox(child: Text('Save changes',style: TextStyle(fontSize: 16, color: Colors.white),)),
                  ],
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
