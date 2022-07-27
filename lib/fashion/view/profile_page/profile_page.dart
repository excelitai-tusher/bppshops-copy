
import 'package:bpp_shop/fashion/view/profile_page/component/profile_custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              height: 150,
              //margin: EdgeInsets.,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("images/excel.jpeg"),
                        )),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 5.w,),
                          Text("Excel IT AI",
                            style: TextStyle(fontSize: 16.sp),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.h,),
                      Row(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.phone_android_outlined,
                          ),
                          SizedBox(width: 3.w,),
                          Text("+88018234521323",
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 3.w,),
                          Icon(Icons.email),
                          SizedBox(width: 3.w,),
                          Text("info@excelitai.com",
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        ],
                      )
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(FontAwesomeIcons.edit),
                  ),
                ],
              ),
            ),
            CustomButtonByGunjon(
              buttonHeight: 70,
              buttonWidth: MediaQuery.of(context).size.width,
              leadingIcon: Icons.shopping_bag_outlined,
              trailingIcon: Icons.arrow_forward_ios_outlined,
              title: "My Order",
              context: context,
              paddingBottom: 10,
            ),
            CustomButtonByGunjon(
              buttonHeight: 70,
              buttonWidth: MediaQuery.of(context).size.width,
              leadingIcon: Icons.favorite_border_outlined,
              trailingIcon: Icons.arrow_forward_ios_outlined,
              title: "My Wishlist",
              context: context,
              paddingBottom: 10,
            ),
            CustomButtonByGunjon(
              buttonHeight: 70,
              buttonWidth: MediaQuery.of(context).size.width,
              leadingIcon: Icons.check_box_outlined,
              trailingIcon: Icons.arrow_forward_ios_outlined,
              title: "Check Out",
              context: context,
              paddingBottom: 10,
            ),
            CustomButtonByGunjon(
              buttonHeight: 70,
              buttonWidth: MediaQuery.of(context).size.width,
              leadingIcon: FontAwesomeIcons.fileInvoice,
              trailingIcon: Icons.arrow_forward_ios_outlined,
              title: "Order Status",
              context: context,
              paddingBottom: 10,
            ),
            CustomButtonByGunjon(
              buttonHeight: 70,
              buttonWidth: MediaQuery.of(context).size.width,
              leadingIcon: Icons.local_shipping_outlined,
              trailingIcon: Icons.arrow_forward_ios_outlined,
              title: "Shipping Address",
              context: context,
              paddingBottom: 10,
            ),
            CustomButtonByGunjon(
              buttonHeight: 70,
              buttonWidth: MediaQuery.of(context).size.width,
              leadingIcon: Icons.payments_outlined,
              trailingIcon: Icons.arrow_forward_ios_outlined,
              title: "Payment Method",
              context: context,
              paddingBottom: 10,
            ),
            CustomButtonByGunjon(
              buttonHeight: 70,
              buttonWidth: MediaQuery.of(context).size.width,
              leadingIcon: Icons.live_help_outlined,
              trailingIcon: Icons.arrow_forward_ios_outlined,
              title: "Help",
              context: context,
              paddingBottom: 10,
            ),
            CustomButtonByGunjon(
              buttonHeight: 70,
              buttonWidth: MediaQuery.of(context).size.width,
              leadingIcon: FontAwesomeIcons.addressCard,
              trailingIcon: Icons.arrow_forward_ios_outlined,
              title: "Edit Address",
              context: context,
              paddingBottom: 10,
            ),
            CustomButtonByGunjon(
              buttonHeight: 70,
              buttonWidth: MediaQuery.of(context).size.width,
              leadingIcon: Icons.account_circle_outlined,
              trailingIcon: Icons.logout,
              title: "Log Out",
              context: context,
              paddingBottom: 10,
            ),

          ],
        ),
      ),
    );
  }
}
