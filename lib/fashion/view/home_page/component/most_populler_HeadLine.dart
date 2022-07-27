import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MostPopullerHeadLine extends StatelessWidget {
  const MostPopullerHeadLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 18.h),
        child: Text(
          "Most Popular",
          style: TextStyle(
            fontSize: 20.sp,
            //fontWeight: FontWeight.bold,
            //color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
