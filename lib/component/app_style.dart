import 'package:flutter/material.dart';
import 'size_configs.dart';

Color kGray = Color(0xFF909090);
Color kBlack = Color(0xFF000000);

final kTitleTextBlack  = TextStyle(
  color: kBlack,
  fontSize: SizeConfigure.blockSizeH! * 4.5,
  fontWeight: FontWeight.bold
);

final kTitleTextAmber = TextStyle(
    color: Colors.amber,
    fontSize: SizeConfigure.blockSizeH! * 4.5,
    fontWeight: FontWeight.bold
);

final kSubTitleTextAmber = TextStyle(
    color: Colors.amber,
    fontSize: SizeConfigure.blockSizeH! * 3,
    fontWeight: FontWeight.bold
);

final kSubTitleTextBlack = TextStyle(
    color: Colors.black,
    fontSize: SizeConfigure.blockSizeH! * 3,
    fontWeight: FontWeight.bold
);

final kSubTitleTextGrey = TextStyle(
    color: Colors.grey,
    fontSize: SizeConfigure.blockSizeH! * 3,
    fontWeight: FontWeight.bold
);



final kBodyText1  = TextStyle(
  color: kGray,
  fontSize: SizeConfigure.blockSizeH! * 3.5,
);