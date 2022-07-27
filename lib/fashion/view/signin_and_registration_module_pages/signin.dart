
import 'package:bpp_shop/fashion/view/signin_and_registration_module_pages/signin2.dart';
import 'package:flutter/material.dart';

class SigInScreen extends StatelessWidget {
  const SigInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/SignIn.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 160,
            ),
            TextButton(
              child:
                  Text("SIGN IN".toUpperCase(), style: TextStyle(fontSize: 14)),
              style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 90, vertical: 10)),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(color: Colors.white)))),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (Context) => SignInScreen2()));
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                child: Text("SIGN UP".toUpperCase(),
                    style: TextStyle(fontSize: 14)),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 90, vertical: 10)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: BorderSide(color: Colors.white)))),
                onPressed: () => null),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 70),
              onPressed: () {},
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (Context) => SignInScreen2()));
                },
                child: Text(
                  'AS A GUEST',
                  style: TextStyle(color: Colors.lightBlueAccent, fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
