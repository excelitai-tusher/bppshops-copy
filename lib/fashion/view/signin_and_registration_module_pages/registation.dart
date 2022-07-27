import 'dart:ui';

//import 'package:classy_ui_e_commerce/signin_and_registration_module_pages/signin2.dart';

import 'package:bpp_shop/fashion/view/signin_and_registration_module_pages/signin2.dart';
import 'package:flutter/material.dart';
class RegistationScreen extends StatelessWidget {
  bool isChecked = false;
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
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Text("WELCOME",style:  TextStyle(
                  color: Colors.black,
                  fontSize: 20
              ),),
              SizedBox(height: 10,),

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
                    prefixIcon: Icon(Icons.person,color: Colors.grey[600]),
                    border: InputBorder.none,
                    hintText: "Name",
                    hintStyle: TextStyle(

                    ),
                  ),
                ),
              ),



              SizedBox(height: 20,),

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
                    prefixIcon: Icon(Icons.email,color: Colors.grey[600]),
                    border: InputBorder.none,
                    hintText: "Email",
                    hintStyle: TextStyle(

                    ),
                  ),
                ),
              ),


              SizedBox(height: 20),


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
                    prefixIcon: Icon(Icons.local_phone_outlined,color: Colors.grey[600]),
                    border: InputBorder.none,
                    hintText: "Phone",
                    hintStyle: TextStyle(

                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),

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
                    prefixIcon: Icon(Icons.lock,color: Colors.grey[600]),
                    border: InputBorder.none,
                    hintText: "Password",
                   suffixIcon: Icon(Icons.visibility_outlined,color: Colors.grey[600],),

                  ),
                ),
              ),



              SizedBox(height: 20),


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
                    prefixIcon: Icon(Icons.lock,color: Colors.grey[600]),
                    border: InputBorder.none,
                    hintText: "Confirm Password",
                    suffixIcon: Icon(Icons.visibility_outlined,color: Colors.grey[600],),

                  ),
                ),
              ),
              SizedBox(height: 10),


                    Row(
                      children: [
                         Checkbox(
                           value:isChecked,
                             onChanged: (bool? newValue) {
                             isChecked =newValue!;
                             }),
                        Text("I agree to the Term of User")
                      ],
                    ), //Row


              SizedBox(height: 60),

              SizedBox(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (Context) => SignInScreen2()));

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
                          child: Text("CREATE ACCOUNT",
                            style: TextStyle(color: Colors.white,fontSize: 20),

                          ),
                        ),)

                      ],
                    ),
                  ),
                ),
              ),


              SizedBox(height: 70),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.bottomRight,
                      child: Text("Already have an account ?",
                        style: TextStyle(color: Colors.grey,fontSize: 15),

                      ),

                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: Text("SIGN UP",
                        style: TextStyle(color: Colors.red,fontSize: 15),

                      ),

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
}
