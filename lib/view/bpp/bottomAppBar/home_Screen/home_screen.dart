import 'package:bpp_shop/view/bpp/appBar/appBar2.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/profile/profile_screen.dart';
import 'package:bpp_shop/view/bpp/drawer/bpp_drawer.dart';

import 'package:bpp_shop/view/bpp/bottomAppBar/home_Screen/sub_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../view_model/bpp/app_provider.dart';

class HomeScreen extends StatefulWidget {
  String? nameFromFacebook;
  int? routeKey;
  HomeScreen({Key? key, this.nameFromFacebook, this.routeKey})
      : super(key: key);
//   HomeScreen({this.subbody});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _scafoldKey = GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    tokenPrint();
    super.initState();
  }

  void tokenPrint() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    print(_prefs.getString("token").toString() + ">>>>>>>>>>>>>>>");
  }

  @override
  Widget build(BuildContext context) {
    final appsData = Provider.of<BppApps>(context);

    final apps = appsData.items;
    return Scaffold(
      key: _scafoldKey,
      appBar:bppAppBar2(context,_scafoldKey,widget.nameFromFacebook,widget.routeKey),
      drawer: BPPMainPageDrawer(),
      body: Container(
        margin: EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: Column(
          children: [
            Container(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search here',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  contentPadding: EdgeInsets.zero,
                  filled: true,
                  fillColor: Color(0xFFF1F1F1),
                ),
              ),
            ),
            Expanded(
              //  padding: EdgeInsets.symmetric(vertical: 30,),
              // margin: EdgeInsets.only(top: 10),
              //   height: MediaQuery.of(context).size.height*.73,
              child: GridView.builder(
                  //physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 3,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 10),
                  itemCount: apps.length,
                  itemBuilder: (context, index) => ChangeNotifierProvider.value(
                        value: apps[index],
                        child: SubApps(),
                      )),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
