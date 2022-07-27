
import 'package:bpp_shop/fashion/view/profile_page/sub_pages/shipping_address_page/shipping_address_pages.dart';
import 'package:bpp_shop/fashion/view/signin_and_registration_module_pages/registation.dart';
import 'package:bpp_shop/fashion/view/signin_and_registration_module_pages/reset.pass.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInScreen2 extends StatelessWidget {
  const SignInScreen2({Key? key}) : super(key: key);

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
              onPressed: () {},
            ),
            title: Image.asset('assets/classy new.png',
                width: 80, height: 50, fit: BoxFit.fill),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello !",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "WELCOME BACK",
                style: TextStyle(color: Colors.black87, fontSize: 25),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
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
                    prefixIcon: Icon(Icons.email, color: Colors.grey[600]),
                    border: InputBorder.none,
                    hintText: "Email",
                    hintStyle: TextStyle(

                        //local_phone_outlined
                        ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
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
                    prefixIcon: Icon(Icons.lock, color: Colors.grey[600]),
                    border: InputBorder.none,
                    hintText: "Password",
                    hintStyle: TextStyle(),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  Container(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (Context) => ResetScreen()));
                      },
                      child: Text(
                        "Forgat Password ?",
                        style: TextStyle(color: Colors.red, fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              SizedBox(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (Context) => ShippingAddress()));

                    // Respond to button press
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffFF6000),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              "SIGIN IN",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: Text(
                  "OR LOGIN WITH",
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ),
              SizedBox(
                width: 20,
                height: 10,
              ),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * .4,
                  height: 70,
                  child: Row(
                    children: [
                      Expanded(
                        child: RawMaterialButton(
                          onPressed: () {},
                          elevation: 1.5,
                          fillColor: Colors.blue,
                          child: Icon(
                            (FontAwesomeIcons.facebook),
                            size: 15.0,
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(15.0),
                          shape: CircleBorder(),
                        ),
                      ),
                      Expanded(
                        child: RawMaterialButton(
                          onPressed: () {},
                          elevation: 1.5,
                          fillColor: Colors.brown,
                          child: Icon(
                            (FontAwesomeIcons.google),
                            color: Colors.white,
                            size: 15.0,
                          ),
                          padding: EdgeInsets.all(15.0),
                          shape: CircleBorder(),
                        ),
                      ),
                      Expanded(
                        child: RawMaterialButton(
                          onPressed: () {},
                          elevation: 1.5,
                          fillColor: Colors.lightBlueAccent,
                          child: Icon(
                            (FontAwesomeIcons.twitter),
                            size: 15.0,
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(15.0),
                          shape: CircleBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Text(
                      "Already have an account ?",
                      style: TextStyle(
                        color: Colors.grey,
                        //fontSize: 15,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (Context) => RegistationScreen()));
                      },
                      child: Text(
                        "SIGN UP",
                        style: TextStyle(
                          color: Colors.red,
                          //fontSize: 15,
                        ),
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
