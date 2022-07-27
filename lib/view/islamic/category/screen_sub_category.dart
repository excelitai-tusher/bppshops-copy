import 'package:bpp_shop/view/bpp/appBar/appBar2.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/BottomAppBar2.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/floatingButton.dart';
import 'package:bpp_shop/view/islamic/category/screen_sub_category_products_view.dart';
import 'package:bpp_shop/models/islamic/SubCategory.dart';
import 'package:bpp_shop/view/bpp/drawer/bpp_drawer.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import '../../../models/islamic/SubSubCategory.dart';
import '../../../service/islamic/http_home_page_category.dart';

class ScreenSubCategory extends StatefulWidget {
  String categoryId;
  String categorySlugName;
  String? nameFromFacebook;
  int? routeKey;
  ScreenSubCategory(
      {Key? key, required this.categoryId, required this.categorySlugName,this.nameFromFacebook, this.routeKey})
      : super(key: key);

  @override
  _ScreenSubCategoryState createState() => _ScreenSubCategoryState();
}

class _ScreenSubCategoryState extends State<ScreenSubCategory> {
  GlobalKey<ScaffoldState> _scafoldKey = GlobalKey();
  // String baseUrl = "https://bppshops.com/api/bs/";
  List<Getsubcategory>? subCategoryList;
  List<ProductUnderSubCategory>? productUnderSubCategoryList;
  List<Getsubsubcategory>? getsubsubcategoryList;
  SubSubCategory? subSubCategory;

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    final list = await getSubCategory(widget.categoryId);
    setState(() {
      subCategoryList = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scafoldKey,
      appBar: bppAppBar2(context,_scafoldKey,widget.nameFromFacebook,widget.routeKey),
      drawer: BPPMainPageDrawer(),
      body: Scaffold(
          // backgroundColor: Colors.white70,
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
            title: Text(
              widget.categorySlugName.toString(),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
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
          body: subCategoryList != null
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 8,
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    childAspectRatio: 2 / 3,
                  ),
                  itemCount: subCategoryList!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async{
                        //await getList(widget.categoryId,subCategoryList![index].id.toString());
                        print(widget.categoryId.toString()+subCategoryList![index].id.toString());
                        //await getSubSubCategory(widget.categoryId,subCategoryList![index].id.toString(),context,subCategoryList![index].subCategoryName.toString());
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SubCategoryWiseProductView(
                              //productUnderSubCategoryList: subCategory.productUnderSubCategory!,
                              categoryId: widget.categoryId,
                              subCategoryId: subCategoryList![index].id.toString(),
                              title: subCategoryList![index].subCategoryName.toString(), productUnderSubCategoryList: [],
                              //subCategoryID: subCateGoryId,
                            ),
                          ),
                        );

                      },
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                border:
                                Border.all(color: Colors.grey, width: 1),
                                image: DecorationImage(
                              image: NetworkImage(
                                "https://bppshops.com/" +
                                    subCategoryList![index]
                                        .subcategoryImage
                                        .toString(),
                              ),
                            )),
                            //child: ,
                          ),
                          Text("${subCategoryList![index].subCategoryName}"),
                        ],
                      ),
                    );
                  },
                )
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 8,
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    childAspectRatio: 2 / 3,
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Shimmer(
                      duration: Duration(seconds: 2), //Default value
                      interval: Duration(seconds: 1), //Default value: Duration(seconds: 0)
                      color: Colors.black,//Colors.grey.shade700, //Default value
                      colorOpacity: 0, //Default value
                      enabled: true, //Default value
                      direction: ShimmerDirection.fromLTRB(),
                      child: Container(
                        // margin: EdgeInsets.symmetric(
                        //     horizontal: 10, vertical: 10),
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    );
                  }),
        floatingActionButton: floatingButton(context,Colors.amber),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: bottomAppBar(context,Colors.amber),
      ),
    );
  }


  }

