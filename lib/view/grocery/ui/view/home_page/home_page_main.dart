import 'package:bpp_shop/view/bpp/appBar/appbar.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/BottomAppBar2.dart';
import 'package:bpp_shop/view/bpp/drawer/bpp_drawer.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/floatingButton.dart';
import 'package:bpp_shop/view/grocery/ui/view/drawer/grocery_drawer.dart';
import 'package:bpp_shop/view/grocery/ui/view/home_page/component/home_body.dart';
import 'package:bpp_shop/view_model/bpp/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../constant/app_colors.dart';

class GroceryHomePage extends StatefulWidget {
  const GroceryHomePage({Key? key}) : super(key: key);

  @override
  State<GroceryHomePage> createState() => _GroceryHomePageState();
}

class _GroceryHomePageState extends State<GroceryHomePage> {
  GlobalKey<ScaffoldState> _bppscafoldKey = GlobalKey();
  GlobalKey<ScaffoldState> _ScafoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final appsData = Provider.of<BppApps>(context);
    final apps = appsData.items;
    return Scaffold(
      key: _bppscafoldKey,
      appBar: bppAppBar(context, apps, _bppscafoldKey),
      drawer: BPPMainPageDrawer(),
      body: Scaffold(
        key: _ScafoldKey,
        backgroundColor: backGroundColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFF3DC73C), // Colors.green,
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              _ScafoldKey.currentState!.openDrawer();
            },
          ),
          title: Text(
            'Grocery',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        drawer: GroceryDrawer(),
        body: HomeBody(),
        floatingActionButton: floatingButton(context, Color(0xFF3DC73C)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: bottomAppBar(context, Color(0xFF3DC73C)),
      ),
    );
  }
}
