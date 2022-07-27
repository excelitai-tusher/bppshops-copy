
import 'package:bpp_shop/fashion/controller/app_bar_controler.dart';
import 'package:bpp_shop/fashion/controller/peimary_page_controller.dart';
import 'package:bpp_shop/fashion/controller/secondary_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonByGunjon extends StatelessWidget {
  CustomButtonByGunjon({
    Key? key,
    this.buttonHeight,
    this.buttonWidth,
    this.paddingBottom,
    this.leadingIcon,
    this.trailingIcon,
    this.title,
    this.context,
  }) : super(key: key);

  double? buttonHeight;
  double? buttonWidth;
  double? paddingBottom;
  IconData? leadingIcon;
  IconData? trailingIcon;
  String? title;
  BuildContext? context;

  @override
  Widget build(BuildContext context) {
    final appBar = Provider.of<PrimaryScreenState>(context, listen: false);
    final pageState = Provider.of<SecondaryPage>(context, listen: false);
    return Padding(
      padding: EdgeInsets.only(bottom: paddingBottom!),
      child: SizedBox(
        height: buttonHeight, //height of button
        width:
            buttonWidth, //MediaQuery.of(context).size.width, //width of button
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.white, //background color of button
              side: BorderSide(
                  width: 1, color: Colors.white), //border width and color
              elevation: 3, //elevation of button
              shape: RoundedRectangleBorder(
                  //to set border radius to button
                  borderRadius: BorderRadius.circular(15)),
              padding: EdgeInsets.all(20) //content padding inside button
              ),
          onPressed: () {
            //code to execute when this button is pressed.
            switch (title) {
              case "My Order":
                print("My Order");
                appBar.setPrimaryState(false);
                pageState.setSecondaryPage(8);
                return null;
              case "My Wishlist":
                print("My Wishlist");
                final status =
                Provider.of<PrimaryScreenState>(context, listen: false);
                status.setPrimaryState(true);
                final primaryPageState = Provider.of<PrimaryPageController>(context,listen: false);
                primaryPageState.setPrimaryPage(1);
                return null;
              //return Wishlist();//TopCategoriesPage();//ProductDetail();//Wishlist();
              case "Check Out":
              // CartList();
              case "Order Status":
                appBar.setPrimaryState(false);
                pageState.setSecondaryPage(7);
                return null;
              case "Shipping Address":
                appBar.setPrimaryState(false);
                pageState.setSecondaryPage(10);
                return null;
              case "Payment Method":
                appBar.setPrimaryState(false);
                pageState.setSecondaryPage(11);
                return null;
              case "Help":
                appBar.setPrimaryState(false);
                pageState.setSecondaryPage(12);
                return null;
              case "Edit Address":
                appBar.setPrimaryState(false);
                pageState.setSecondaryPage(9);
                return null;
              case "Log Out":
                return null;
              default:
              //return Home();
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        leadingIcon, //Icons.shopping_bag,
                        color: Color(0xffFF6000),
                        size: 20.h,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        title!, //"My Order",
                        style: TextStyle(fontSize: 15.sp, color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
              Icon(
                trailingIcon, //Icons.arrow_forward_ios_outlined,
                color: Colors.black,
                size: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
