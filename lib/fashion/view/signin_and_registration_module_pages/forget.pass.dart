//import 'package:classy_ui_e_commerce/signin_and_registration_module_pages/otp.screen.dart';

import 'package:bpp_shop/fashion/view/signin_and_registration_module_pages/otp.screen.dart';
import 'package:flutter/material.dart';
class ForgetPassScreen extends StatelessWidget {
  const ForgetPassScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0), // here the desired height
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.black,
              onPressed: () {  },

            ),
            title: Image.asset(
                'assets/classy new.png',
                width: 80,
                height: 50,
                fit:BoxFit.fill

            ),



          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 50),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60,),
            Center(
              child: Text("Forget Password?",style:  TextStyle(
                  color: Colors.black,
                  fontSize: 30
              ),
              ),
            ),
         SizedBox(height: 30,),
            Center(
              child: Text("Enter the phone number associated",style:  TextStyle(
                  color: Colors.grey,
                  fontSize: 15
              ),),
            ),
            Center(
              child: Text("with your account",style:  TextStyle(
                  color: Colors.grey,
                  fontSize: 15
              ),),
            ),



            SizedBox(height: 60,),

            Container(
              width: MediaQuery.of(context).size.width/1.2,
              height: 45.0,
              padding: EdgeInsets.only(
                top: 0.0,
                bottom: 0.0,
                left: 16.0,
              ),
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(10.0),
                color: Colors.grey[400],
              ),
              child: TextField(
                cursorColor: Colors.grey,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.local_phone_outlined, color: Colors.grey[600]),
                  border: InputBorder.none,
                  hintText: "Phone Number",
                  hintStyle: TextStyle(

                  ),

                ),
              ),
            ),



            SizedBox(height: 60),


            SizedBox(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (Context) => OTPScreen()));

                  // Respond to button press
                },
                style: ElevatedButton.styleFrom(primary: Color(0xffFF6000),
                  shape: new
                  RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),


                ),

                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: Center(
                        child: Text("CONTINUE",
                          style: TextStyle(color: Colors.white,fontSize: 20),

                        ),
                      ),)

                    ],
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
