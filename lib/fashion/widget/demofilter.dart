import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Filtter extends StatefulWidget {
//   Filtter({ required this.datalist}) ;
// List? datalist=[];

  @override
  State<Filtter> createState() => _FiltterState();
}

class _FiltterState extends State<Filtter> {
  

  @override
  Widget build(BuildContext context) {
  var data = ModalRoute.of(context)!.settings;
    return Scaffold(
      body: Center(child: Text(data.toString())),
    );
  }
}