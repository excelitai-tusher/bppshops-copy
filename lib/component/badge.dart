import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  const Badge({
    Key? key,
    @required this.child,
    @required this.value,
    this.color,
  }) : super(key: key);

  final Widget? child;
  final String? value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child!,
        Positioned(
          right:4,
          top:6,
          child:
          CircleAvatar(
            radius: 10,
            backgroundColor: Colors.white,
            child:
            Text(
              value!,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15,

                  color:color,
                  //Color(0xFFE37D4E),
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),

      ],
    );
  }
}