import 'dart:convert';
import 'package:bpp_shop/models/grocery/subsub_categories.dart';
import 'package:bpp_shop/view/bpp/appBar/appBar2.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/BottomAppBar2.dart';
import 'package:bpp_shop/view/bpp/drawer/bpp_drawer.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/floatingButton.dart';
import 'package:bpp_shop/view/grocery/ui/constant/app_colors.dart';
import 'package:bpp_shop/view/grocery/ui/constant/clip.dart';
import 'package:bpp_shop/view/grocery/ui/view/category%20page/product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:math' as math;


class GrocerySubSubCategories extends StatefulWidget {
  GrocerySubSubCategories({Key? key,required this.categoryId, required this.subCategoryId,required this.name}) : super(key: key);
  String categoryId;
String subCategoryId;
  String name;
  String? nameFromFacebook;
  int? routeKey;
  @override
  _GrocerySubSubCategoriesState createState() => _GrocerySubSubCategoriesState();
}

class _GrocerySubSubCategoriesState extends State<GrocerySubSubCategories> {
  GlobalKey<ScaffoldState> _scafoldKey = GlobalKey();
 List<GSubSubCategory>? subSubCategoryList;

 Future<List<GSubSubCategory>> getGSubSubCategories() async {

    http.Response response = await http.post(
      Uri.parse("https://bppshops.com/api/gs/products"),
      body: {
        'category_id': widget.categoryId.toString(),
        'subcategory_id': widget.subCategoryId.toString(),
      },
      headers:{
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
      },
    );
    if (response.statusCode == 200){
      final jsonBody = jsonDecode(response.body);
      GSubSubCategories subSubCategory =GSubSubCategories.fromJson(jsonBody);
      subSubCategoryList=subSubCategory.subSubCategory!;
      return subSubCategory.subSubCategory!;
    } else {
      throw "ERROR : ${response.statusCode}";
    }
  }
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    print(widget.categoryId.toString());
    print(widget.subCategoryId.toString());
    getGSubSubCategories();
  }
  @override
  Widget build(BuildContext context) {
    bool visibleButton=MediaQuery.of(context).viewInsets.bottom!=0;
    return Scaffold(
      key: _scafoldKey,
      appBar: bppAppBar2(context,_scafoldKey,widget.nameFromFacebook,widget.routeKey),
      drawer: BPPMainPageDrawer(),
     body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: GestureDetector(
              onTap: (){
                Navigator.pop(context);
                },
              child: Icon(
                Icons.arrow_back_ios_outlined,
                size: 25,
                color: Colors.black,
              ),
            ),
            title: Center(
              child: Text(
                "${widget.name}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Icon(Icons.filter_list_alt, size: 30, color: Colors.green),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  child: Container(
                    height: 35,
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color: Color(0xffF7FFEF),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xffF7FFEF),
                            blurRadius: 10.0,
                            offset: Offset(10.0, 10.0),
                          )
                        ]),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                        hintText: 'Search Product',
                        fillColor: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child:subSubCategoryList!=null?GridView.builder(
                      //padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5 ),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: false,
                      itemCount:subSubCategoryList!.length, //NewArrivalModel.list.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        childAspectRatio: 3 / 2,
                        mainAxisSpacing: 10,
                        mainAxisExtent: 220,
                        //MediaQuery.of(context).size.height,
                      ),
                      itemBuilder: (BuildContext context, i) {

                        return Padding(
                          padding: const EdgeInsets.only( bottom: 8.0),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>  ProductView(categoryId: widget.categoryId,subCategoryId:widget.subCategoryId,subSubCategoryId:subSubCategoryList![i].id!,name: subSubCategoryList![i].subsubcategoryName!,)));
                            },
                            // onTap: () {
                            //   Navigator.push(context, MaterialPageRoute(builder: (context) =>  GrocerySubSubCategories(categoryId: widget.categoryId,subCategoryId:gsubCategoryList![i].id,)));
                            //   // ///way:1
                            //   // showDialog(
                            //   //   context: context,
                            //   //   builder: (context) => ProductDetails(),
                            //   // );
                            //   // ///way:1
                            //   //
                            // },
                            child: Container(
                              height: 160,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(0, 1), // changes position of shadow
                                  ),
                                ],
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        height: MediaQuery.of(context).size.height,
                                        width: MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: tertiaryColor1,
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Stack(
                                          children: [

                                            Stack(
                                              children: [
                                                ClipPath(
                                                  clipper: SimpleClipper(),
                                                  child: Container(
                                                    width: 70,
                                                    height: 45,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(16)),
                                                      color:Color(0xFF9FF348),
                                                    ),

                                                  ),
                                                ),
                                                Positioned(
                                                  top: 2,
                                                  child: Transform.rotate(
                                                      angle: -math.pi /4,
                                                      child: Text('20%',style: TextStyle(fontSize: 16,color: Colors.white))),)

                                              ],

                                            ),
                                            Align(
                                              alignment: Alignment.center,
                                              child: SizedBox(
                                                height: MediaQuery.of(context).size.height * .12,
                                                // width: MediaQuery.of(context).size.width * .4,
                                                child: Image.network(
                                                  "https://bppshops.com/${subSubCategoryList![i].subsubcategoryImage}",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Center(
                                        child: Text(
                                          "${subSubCategoryList![i].subsubcategoryName}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: titleFontColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ):  SpinKitSpinningLines(
                      color:  Color(0xFF9FF348),
                      size: 80.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: Visibility(
              visible: !visibleButton,
              child: floatingButton(context,Color(0xFF3DC73C))),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: Visibility(
              visible: !visibleButton,
              child: bottomAppBar(context,Color(0xFF3DC73C))),
        ),
      ),
    );
  }
}
