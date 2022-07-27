
import 'package:bpp_shop/fashion/view/signin_and_registration_module_pages/signin.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/Splash.png'),
          fit: BoxFit.cover,
        ),


      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 150),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            RaisedButton(
              color: Colors.redAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              onPressed: () {  },
              child: InkWell(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(
                      builder: (Context)=>SigInScreen()));
                },
                child: Text('Get Started',
                  style: TextStyle(color: Colors.white,
                      fontSize: 20),),
              ),
            ),

          ],
        ),
      ),




    );
  }
}

