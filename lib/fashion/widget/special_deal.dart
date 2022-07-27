import 'package:flutter/material.dart';

class SpecialDeals extends StatefulWidget {
  const SpecialDeals({ Key? key }) : super(key: key);

  @override
  State<SpecialDeals> createState() => _SpecialDealsState();
}

class _SpecialDealsState extends State<SpecialDeals> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: const[Text('SPECIAL DEALS', style: TextStyle(
              shadows: [
                Shadow(
                    color: Colors.red,
                    offset: Offset(0, -5))
              ],
              color: Colors.transparent,
              decoration:
              TextDecoration.underline,
              decorationColor: Colors.red,
              decorationThickness: 2,
              decorationStyle:
              TextDecorationStyle.solid,
            ),)],
      ));
  }
}