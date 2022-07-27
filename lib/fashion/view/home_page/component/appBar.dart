import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xffFFA800),
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.menu_open),
      ),
      title: Text("Classy E-com"),
      actions: [
        IconButton(
          onPressed: () {

          },
          icon: Icon(
            Icons.search,
          ),
        ),

      ],
    );
  }
}
