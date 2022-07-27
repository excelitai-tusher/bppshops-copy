import 'package:flutter/material.dart';

import 'bkash payment.dart';

class BkashLogin extends StatefulWidget {
  const BkashLogin({Key? key}) : super(key: key);

  @override
  _BkashLoginState createState() => _BkashLoginState();
}

class _BkashLoginState extends State<BkashLogin> {
  bool isObsecure=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
        ),
        title: Row(
          children: [
            Image(image: AssetImage("images/bKash.png")),
            Text(
              "Bkash",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.people,
                    color: Colors.black45,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelStyle: new TextStyle(color: Colors.white),
                  hintText: 'Enter Your Number',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextFormField(
                obscureText: isObsecure?true:false,
                decoration: InputDecoration(
                  prefixIcon: Transform.rotate(
                      angle: 5.8, child: Icon(Icons.key, color: Colors.black45)),
                  hintText: 'Your Pin',
                  labelStyle: new TextStyle(color: Colors.white),
                  suffixIcon:IconButton(
                      onPressed: (){
                        setState(() {
                          isObsecure=!isObsecure;
                        });
                      },

                      icon:  Icon(isObsecure?Icons.visibility_off: Icons.visibility)),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextButton(

                  child: Text(
                    "Forget Pin?",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                      fontSize: 12,
                    ),
                  ),
                  onPressed: () {
                    //Navigator.push(context, MaterialPageRoute(builder: (context) =>  CardPayment()));
                    print('Pressed');
                  }
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(350, 40)
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  bKashPayment()));
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
