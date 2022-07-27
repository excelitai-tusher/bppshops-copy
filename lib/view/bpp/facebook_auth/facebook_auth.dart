import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class Facebook_auth extends StatefulWidget {
  const Facebook_auth({Key? key}) : super(key: key);

  @override
  _Facebook_authState createState() => _Facebook_authState();
}

class _Facebook_authState extends State<Facebook_auth> {

  bool _isLoggedIn = false;
  Map userData = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Center(child: Text("Facebook Auth")),
      ),
      body: Container(
        child: _isLoggedIn
            ? Column(
                children: [
                  Image.network(userData["picture"]["data"]["url"]),
                  Text(userData["name"]),
                  Text(userData["email"]),
                  TextButton(
                      onPressed: () {
                        //_performLogout();
                      },
                      child: Text("Logout")),
                ],
              )
            : Center(
                child: ElevatedButton(
                  onPressed: () async {
                    FacebookAuth.instance.login(
                        permissions: ["Public_profile", "email"]).then((value) {
                      FacebookAuth.instance.getUserData().then((userData) {
                        setState(() {
                          _isLoggedIn = true;
                          userData = userData;
                        });
                      });
                    });
                  },
                  child: Text("Login with Facebook"),
                ),
              ),
      ),
    );
  }
}
