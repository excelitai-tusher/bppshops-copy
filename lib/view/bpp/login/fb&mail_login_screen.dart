import 'dart:async';
import 'package:bpp_shop/service/bpp/local_storage_service.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/bottom_app_bar.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/home_Screen/home_screen.dart';
import 'package:bpp_shop/view/bpp/login/gmail_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'otp_code.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
  'email',
]);

class EmailLogin extends StatefulWidget {
  EmailLogin({Key? key, this.from, this.start = 30}) : super(key: key);
  int start;
  String? from;

  @override
  _EmailLoginState createState() => _EmailLoginState();
}

class _EmailLoginState extends State<EmailLogin> {
  TextEditingController numberController = TextEditingController();
  final String _countryCode = "+88";
  final String postsUrl = "https://bppshops.com/api/sendOtp";

  Future<int> getPost() async {
    var appSignatureID = await SmsAutoFill().getAppSignature;
    var res = await post(Uri.parse(postsUrl),
        body: {'mobile': numberController.text,
        'app_signature_id':appSignatureID}
        );
    print(">>>>>>>>>>>>>>>>>>");
    print(res.body);
    print(">>>>>>>>>>>>>>>>>>");
    return res.statusCode;
  }

  bool _isLoggedIn = false;
  Map _userObj = {};
  AccessToken? _accessToken;

  Future<void> signIn() async {
    final LoginResult result = await FacebookAuth.i.login();
    if (result.status == LoginStatus.success) {
      _accessToken = result.accessToken;

      await FacebookAuth.i.getUserData();
    }
  }
  LocalStorageStore localStorageStore=LocalStorageStore();

  //int start =30;
  bool wait = false;
  String buttonName ="Send";
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Login",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
              child: Container(

                child: _isLoggedIn
                    ? Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                _userObj["picture"]["data"]["url"]),
                            // child: Image.network(
                            //     _userObj["picture"]["data"]["url"]
                            // ),
                          ),
                          Text(_userObj["name"]),
                          Text(_userObj["email"]),
                          TextButton(
                              onPressed: () {
                                FacebookAuth.instance.logOut().then((value) {
                                  setState(() {
                                    _isLoggedIn = false;
                                    _userObj = {};
                                  });
                                });
                              },
                              child: Text("Logout"))
                        ],
                      )
                    : Center(
                        child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xff49639F),
                              onPrimary: Color(0xff49639F),
                              elevation: 3,
                              minimumSize: Size(100, 40),
                            ),
                            onPressed: () async {
                              FacebookAuth.instance.login(permissions: [
                                "public_profile",
                                "email"
                              ]).then((value) async {
                                await FacebookAuth.instance
                                    .getUserData()
                                    .then((userData) {
                                  setState(() {
                                    _isLoggedIn = true;
                                    _userObj = userData;
                                  });
                                });
                              }).then((value) => Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BottomNavBar(
                                          currentTab: 0,
                                          currentScreen: HomeScreen(
                                            nameFromFacebook:
                                                _userObj["picture"]["data"]
                                                    ["url"],
                                            routeKey: 1,
                                          ))),
                                  (route) => false));
                            },
                            icon: Padding(
                              padding:
                                  const EdgeInsets.only(left: 30, right: 15),
                              child: Icon(
                                FontAwesomeIcons.facebookF,
                                size: 20, //Icon Size
                                color: Colors.white, //Color Of Icon
                              ),
                            ),
                            label: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Text(
                                "Sign Up or Login with Facebook",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )),
                      ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.white,
                  elevation: 3,
                  minimumSize: Size(100, 40),
                ),
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.googleLogin();
                },
                icon: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 15),
                  child: Icon(
                    FontAwesomeIcons.google,
                    size: 20, //Icon Size
                    color: Colors.black, //Color Of Icon
                  ),
                ),
                label: Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Text(
                    "Sign Up or Login with Google",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Expanded(
                  child: Divider(
                    indent: 20.0,
                    endIndent: 10.0,
                    thickness: 1,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "or",
                  style: TextStyle(color: Colors.grey),
                ),
                Expanded(
                  child: Divider(
                    indent: 10.0,
                    endIndent: 20.0,
                    thickness: 1,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "PLEASE ENTER YOUR MOBILE PHONE NUMBER",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: [
                  Image(image: AssetImage("assets/icons/bd flag.webp")),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    // width: 300,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: numberController,
                      onChanged: (value) {
                        if (value == _countryCode) {
                          numberController.text = "";
                          return;
                        }
                        value.startsWith(_countryCode)
                            //  value.endsWith(_countryCode)
                            ? numberController.text = value
                            : numberController.text = _countryCode + value;
                        numberController.selection = TextSelection.fromPosition(
                            TextPosition(
                                offset:numberController.text.length));
                      },
                      decoration: InputDecoration(
                        labelText: '+88',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffE37D4E),
                  onPrimary: Color(0xffE37D4E),
                  elevation: 3,
                  minimumSize: Size(100, 40),
                ),
                onPressed: wait
                    ? null
                    : () async {
                        if (numberController.text.isNotEmpty &&
                            _isLoggedIn == false) {
                          int responseStatus = await getPost();

                          if (responseStatus == 200) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Otp_screen(
                                      mobile: numberController.text.toString(),
                                      token: '',
                                      from: widget.from,
                                    )));
                          }
                        } else {
                          if (_isLoggedIn) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BottomNavBar(
                                        currentTab: 0,
                                        currentScreen: HomeScreen())),
                                (route) => false);
                          }
                        }
                      },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      buttonName,
                      style: TextStyle(
                        color: wait ? Colors.grey : Colors.white,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "This site is protected by reCAPTCHA and the Google",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  "Privacy",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Policy",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  "and",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  "Terms of Service",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  "apply",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


}
