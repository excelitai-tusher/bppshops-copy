
import 'package:bpp_shop/fashion/view/signin_and_registration_module_pages/verification.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
class OTPScreen extends StatelessWidget {
  const OTPScreen ({Key? key}) : super(key: key);

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
      body: Container(
        child: Column(
          children: [


             Padding(
              padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 50),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60,),
                  Center(
                    child: Text("Login with OTP",style:  TextStyle(
                        color: Colors.black,
                        fontSize: 30
                    ),
                    ),
                  ),
                  SizedBox(height: 30,),

                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        height: 50,
                        width: 500,
                        decoration: BoxDecoration(border: Border.all(),
                        borderRadius: BorderRadius.circular(8.0)),
                        child: Row(
                          children: [
                            CountryCodePicker(
                              //  onChanged: print,
                              // hideMainText: true,
                              showFlagMain: true,
                              showFlag: false,
                              initialSelection: 'IT',
                              // hideSearch: true,
                              showCountryOnly: true,
                              //  showOnlyCountryWhenClosed: true,
                              //alignLeft: true,
                              // padding: EdgeInsets.all(8.0),
                            ),
                           Row(
                             children: [
                               Text('+880 XXXXXXXX'),


                             SizedBox(width: 10,),
                             Icon(
                               Icons.mail_outlined,
                               color: Colors.grey,
                             ),
                             ],
                           ),



                          ],
                        ),

                      ),
                    ),
                  ),


                  SizedBox(height: 30,),



                  SizedBox(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (Context) => VerificationScreen()));// Respond to button press
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.deepOrange,
                          padding: EdgeInsets.symmetric(vertical: 20)

                        // backgroundColor: MaterialStateProperty.all(Colors.white70),
                        // padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 20,horizontal: 80)),
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
                            ),
                            ),

                          ],
                        ),
                      ),
                    ),
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
