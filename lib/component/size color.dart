import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../fashion/provider/fashion_color.dart';

class SizeColor extends StatelessWidget {
  SizeColor({
    Key? key,
    this.buttonHeight,
    this.buttonWidth,
    this.title,
    this.size
  }): super(key: key);

  double? buttonWidth;
  double? buttonHeight;
  String? title;
  int? size;

  @override
  Widget build(BuildContext context) {
    final SizeSelection = Provider.of<FashionColor>(context);
    return GestureDetector(
      onTap: (){
        SizeSelection.SizeSelected(size!);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4),
        height: buttonHeight,
        width: buttonWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: SizeSelection.SizeSelection == size ? Colors.grey : Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ]
        ),
        child: Center(child: Text(title!, style: TextStyle(color: SizeSelection.SizeSelection == size ? Colors.black : Colors.grey))),
      ),
    );
  }
}
