import 'dart:convert';

import 'package:bpp_shop/models/bpp/coupon.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/bottom_app_bar.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/home_Screen/home_screen.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/profile/profile_screen.dart';
import 'package:bpp_shop/view/bpp/drawer/bpp_drawer.dart';
import 'package:bpp_shop/view/bpp/login/fb&mail_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';



class MyCoupons extends StatefulWidget {
  const MyCoupons({Key? key}) : super(key: key);

  @override
  _MyCouponsState createState() => _MyCouponsState();
}

class _MyCouponsState extends State<MyCoupons> {
   List<CouponData> ?coupons;
     @override
  void initState() {
    // TODO: implement initState
    getCouponData();
    super.initState();
  }
   GlobalKey<ScaffoldState> _scafoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scafoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFE37D4E),
        leading: IconButton(
          onPressed: () {
            _scafoldKey.currentState!.openDrawer();

          },
          icon: Icon(Icons.menu,color: Colors.white,),
        ),
        centerTitle: true,
        title: TextButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BottomNavBar(currentTab: 0,currentScreen: HomeScreen(),),));
          },
          child: Text(
            "BPP Shop",
            style: TextStyle(color: Colors.white,fontSize: 18),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfileScreen()));
            },
            icon: Icon(
              Icons.person,color: Colors.white,
            ),
          ),
          TextButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EmailLogin()));
          }, child: Text('LogIn'))
        ],
      ),
      drawer: BPPMainPageDrawer(),
      body: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('My Coupons'),
          centerTitle: true,
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          },icon: Icon(Icons.arrow_back_ios),),
          actions: [IconButton(onPressed: (){}, icon: Icon(Icons.shopping_bag_outlined))],
        ),
        body:coupons==null?Center(child: CircularProgressIndicator(),) :ListView.builder(
            itemCount: coupons!.length,
            itemBuilder: (context, index) {
      return   Container(
        child:        Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 20,vertical: 6),
          child: Card(
            elevation: 5,
            child: Container(
              height: MediaQuery.of(context).size.height* .15,
              width: 360,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${coupons![index].couponDiscount}% off",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        Container(
                          height: 15,
                          width: 55,
                          decoration: BoxDecoration(
                            color: Colors.green,
                          ),
                          child: Text(
                            "${coupons![index].couponName}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Applies to first purchase",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "Valid Until ${DateFormat.MMMEd().format(coupons![index].couponValidity!)}",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 20,
                          width: 200,
                          child: StepProgressIndicator(
                            totalSteps: 50,
                            currentStep: 22,
                            size: 5,
                            padding: 0,
                            selectedColor: Colors.green,
                            //unselectedColor: Colors.cyan,
                            roundedEdges: Radius.circular(10),
                            selectedGradientColor: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.green, Colors.green],
                            ),
                            unselectedGradientColor: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.grey, Colors.grey],
                              //colors: [Colors.black, Colors.blue],
                            ),
                          ),
                        ),
                        Text(
                          "\$ 300.0 / \$ 500.0",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ) ;
        }),

      ),
    );
  }

  Future<void> getCouponData() async {
    var url = Uri.parse('https://bppshops.com/api/cupons/view');
    http.Response response = await http.get(url);
    print(response.body);
    List<dynamic> body = jsonDecode(response.body);
    coupons = body.map((dynamic item) => CouponData.fromJson(item)).toList();
    setState(() {});
  }
}
