import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'track order1.dart';


class TrackOrder extends StatefulWidget {
  const TrackOrder({Key? key}) : super(key: key);

  @override
  _TrackOrderState createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  TextEditingController _invoiceNumber = TextEditingController();
  // var _itemCount = null;
  @override
  Widget build(BuildContext context) {
    //final trackOrder = Provider.of<OrderTracking>(context);
    //final track = trackOrder.item;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon:Icon(Icons.arrow_back,
              color: Colors.white,),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            "Track Your Order",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Invoice Code",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    // height: MediaQuery.of(context).size.height * .2,
                    // width: MediaQuery.of(context).size.width * .9,
                    child: TextField(
                      controller: _invoiceNumber,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'Your Order Invoice Number',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Center(
                      child: ElevatedButton(
                        child: const Text(
                          'Track',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  TrackOrder1(invoiceNumber: _invoiceNumber.text,)));

                        },
                        style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(3),
                          ),
                          maximumSize: Size(150, 80),
                          minimumSize: Size(120, 50),
                          primary: Colors.blue,

                        ),
                      ),
                    ),
                  ),


                ]),
          ),
        ),

    );
  }
}
