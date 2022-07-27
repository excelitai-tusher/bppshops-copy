
import 'package:bpp_shop/component/badge.dart';
import 'package:bpp_shop/view/bpp/appBar/appBar2.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/BottomAppBar2.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/floatingButton.dart';
import 'package:bpp_shop/view_model/bpp/cart_provider.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/bottom_app_bar.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/history_screen/history_screen.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/home_Screen/home_screen.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/profile/profile_screen.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/wish_list/wishlist_screen.dart';
import 'package:bpp_shop/models/islamic/SubSubCategory.dart';
import 'package:bpp_shop/view/bpp/cart/cart_screen.dart';
import 'package:bpp_shop/view/bpp/drawer/bpp_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ScreenSubSubCategory extends StatefulWidget {
  String? nameFromFacebook;
  int? routeKey;
  List<Getsubsubcategory>? getsubsubcategoryList;
  String? subCategorySlugName;
  ScreenSubSubCategory({Key? key,this.subCategorySlugName,this.getsubsubcategoryList}) : super(key: key);

  @override
  _ScreenSubSubCategoryState createState() => _ScreenSubSubCategoryState();
}

class _ScreenSubSubCategoryState extends State<ScreenSubSubCategory> {
  GlobalKey<ScaffoldState> _scafoldKey = GlobalKey();

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    //getList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scafoldKey,

      appBar: bppAppBar2(context,_scafoldKey,widget.nameFromFacebook,widget.routeKey),
      drawer: BPPMainPageDrawer(),
      body: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(widget.subCategorySlugName.toString(),style: TextStyle(color: Colors.white),),
          actions: [
            // Text("All Category"),
            // Text(widget.categorySlugName.toString()),
            Icon(Icons.search, color: Colors.white),
            SizedBox(
              width: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(Icons.notifications_outlined, color: Colors.white),
            ),
          ],
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 2,
            crossAxisCount: 2,
            mainAxisSpacing: 2,
            childAspectRatio: 2 / 3,
          ),
          itemCount: widget.getsubsubcategoryList!.length,//subSubCategoryList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){

          // Navigator.push(context,MaterialPageRoute(builder: (context)=>ScreenSubSubCategoryProductView(title: subSubCategoryList[index]["subsubcategory_name"],)));
              },
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage("https://bppshops.com/"+widget.getsubsubcategoryList![index].subsubcategoryImage.toString(),
                          ),
                        )
                    ),
                    //child: ,
                  ),
                  Text(widget.getsubsubcategoryList![index].subsubcategoryName.toString()),
                ],
              ),
            );
          },
        ),

        floatingActionButton: floatingButton(context,Colors.amber),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: bottomAppBar(context,Colors.amber),
      ),
    );
  }
}
