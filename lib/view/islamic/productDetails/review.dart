import 'package:flutter/material.dart';


class Review extends StatefulWidget {
  const Review({Key? key}) : super(key: key);

  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.white,), onPressed: (){
          Navigator.of(context).pop();
        },),
        title: FittedBox(
          child: Text(
            "Product Details",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          Icon(Icons.search, color: Colors.white),
          SizedBox(width: 5,),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.notifications_outlined, color: Colors.white),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                child: Text(
                  "Write Your Own Reviews",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Table(
                  border: TableBorder.all(
                      color: Colors.black,
                      style: BorderStyle.solid,
                      width: .5),
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
                      Column(children:[Icon(Icons.radio_button_off, size: 10, color: Colors.grey,)]),
                      Column(children:[Icon(Icons.radio_button_off,size: 10,color: Colors.grey,)]),
                      Column(children:[Icon(Icons.radio_button_off,size: 10,color: Colors.grey,)]),
                      Column(children:[Icon(Icons.radio_button_off,size: 10,color: Colors.grey,)]),
                      Column(children:[Icon(Icons.radio_button_off,size: 10,color: Colors.grey,)]),

                    ]),
                    TableRow( children: [
                      Column(children:[Text('Price', style: TextStyle(fontSize: 10.0))]),
                      Column(children:[Icon(Icons.radio_button_off,size: 10,color: Colors.grey,)]),
                      Column(children:[Icon(Icons.radio_button_off,size: 10,color: Colors.grey,)]),
                      Column(children:[Icon(Icons.radio_button_off,size: 10,color: Colors.grey,)]),
                      Column(children:[Icon(Icons.radio_button_off,size: 10,color: Colors.grey,)]),
                      Column(children:[Icon(Icons.radio_button_off,size: 10,color: Colors.grey,)]),

                    ]),
                    TableRow( children: [
                      Column(children:[Text('Value', style: TextStyle(fontSize: 10.0))]),
                      Column(children:[Icon(Icons.radio_button_off,size: 10,color: Colors.grey,)]),
                      Column(children:[Icon(Icons.radio_button_off,size: 10,color: Colors.grey,)]),
                      Column(children:[Icon(Icons.radio_button_off,size: 10,color: Colors.grey,)]),
                      Column(children:[Icon(Icons.radio_button_off,size: 10,color: Colors.grey,)]),
                      Column(children:[Icon(Icons.radio_button_off,size: 10,color: Colors.grey,)]),

                    ]),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              FittedBox(
                child: Text(
                  "Your Name",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10,),
              FittedBox(
                child: Text(
                  "Summary",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10,),
              FittedBox(
                child: Text(
                  "Review",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 10.0),
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 20,),
              Align(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    maximumSize: Size(125, 40),
                    primary: Colors.amber,
                  ),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(child: Text('Submit',style: TextStyle(fontSize: 16, color: Colors.white),)),
                    ],
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
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


