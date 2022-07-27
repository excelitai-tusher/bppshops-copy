
import 'package:bpp_shop/fashion/controller/app_bar_controler.dart';
import 'package:bpp_shop/fashion/controller/secondary_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewArrivalsHeadLineButton extends StatelessWidget {
  const NewArrivalsHeadLineButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "New Arrivals",
            style: TextStyle(
              fontSize: 20.sp,
              //fontWeight: FontWeight.bold,
              //color: Colors.black87,
            ),
          ),
          SizedBox(
            height: 30,
            width: 70.w,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xffFFA800),//Color(0xffFF6000),
              ),
              onPressed: () {

                final appBar =
                Provider.of<PrimaryScreenState>(context, listen: false);
                appBar.setPrimaryState(false);
                final view = Provider.of<SecondaryPage>(context,
                    listen: false);
                view.setSecondaryPage(1);

              },
              child: Text("More",
                style: TextStyle(fontSize: 14.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
