
import 'package:bpp_shop/service/islamic/http_home_page_category.dart';
import 'package:bpp_shop/view/bpp/appBar/appBar2.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/BottomAppBar2.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/floatingButton.dart';
import 'package:bpp_shop/view/bpp/drawer/bpp_drawer.dart';

import 'package:bpp_shop/component/filter.dart';
import 'package:bpp_shop/component/dropdown.dart';
import 'package:bpp_shop/models/islamic/SubSubCategory.dart';
import 'package:bpp_shop/view/islamic/productDetails/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class SubCategoryWiseProductView extends StatefulWidget {
  SubCategoryWiseProductView(
      {Key? key,
      this.title,
      required this.categoryId,
      required this.subCategoryId,this.nameFromFacebook, this.routeKey, required List<ProductUnderSubCategory> productUnderSubCategoryList})
      : super(key: key);
  String? title;
  //List<ProductUnderSubCategory>? productUnderSubCategoryList;
  String categoryId;
  String subCategoryId;
  String? nameFromFacebook;
  int? routeKey;

  @override
  _SubCategoryWiseProductViewState createState() =>
      _SubCategoryWiseProductViewState();
}

class _SubCategoryWiseProductViewState
    extends State<SubCategoryWiseProductView> {
  // String baseUrl = "https://bppshops.com/api/bs/yyy/yyyyy/dd";
  // List subSubCategoryList = [];
  GlobalKey<ScaffoldState> _scafoldKey = GlobalKey();

  @override
  Widget build(BuildContext context){
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
          title: Text(widget.title.toString(),style: TextStyle(color: Colors.white),),
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 35,
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.filter_alt_outlined,
                            color: Colors.grey,
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Filter()));
                              },
                              child: Text(
                                'Filters',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                              )),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.height,
                            color: Colors.grey,
                          ),
                          MyDropDown(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              FutureBuilder(
                future: getProductUnderSubSubCategory(
                  widget.categoryId,
                  widget.subCategoryId,
                ),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    List<ProductUnderSubCategory> productUnderSubCategoryList =
                        snapshot.data ?? <ProductUnderSubCategory>[];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child:productUnderSubCategoryList.length!=0? GridView.builder(
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 2 / 3,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 10),
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: productUnderSubCategoryList.length,
                          itemBuilder: (context, index) => Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(6),
                                    border:
                                        Border.all(color: Colors.grey, width: 1)),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child: GridTile(
                                    footer: GridTileBar(
                                      title: ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.amber,
                                          minimumSize: Size(90, 30),
                                        ),
                                        onPressed: () {
                                          showModalBottomSheet<void>(
                                            isDismissible: false,
                                            isScrollControlled: true,
                                            context: context,
                                            builder: (BuildContext context) {
                                              return MyBottomSheet(
                                                productId:
                                                    productUnderSubCategoryList[
                                                            index]
                                                        .id
                                                        .toString(),
                                                productImage: productUnderSubCategoryList[
                                                                index]
                                                            .productThambnail !=
                                                        null
                                                    ? 'https://bppshops.com/${productUnderSubCategoryList[index].productThambnail}'
                                                    : 'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg',
                                                productName:
                                                    productUnderSubCategoryList[
                                                            index]
                                                        .productName,
                                                productDetail:
                                                    productUnderSubCategoryList[
                                                            index]
                                                        .productDescp,
                                                //  shipping: double.tryParse(get[index].shipping!),
                                                productPrePrice:
                                                    productUnderSubCategoryList[
                                                            index]
                                                        .discountPrice,
                                                productPrice: double.tryParse(
                                                    productUnderSubCategoryList[
                                                            index]
                                                        .sellingPrice!),
                                              );
                                            },
                                          );
                                        },
                                        icon: Icon(
                                          Icons.shopping_bag_outlined,
                                          color: Colors.white,
                                          size: 17,
                                        ),
                                        label: Text(
                                          'Add to Bag',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: Column(
                                        //mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: Center(
                                              child: Container(
                                                child: productUnderSubCategoryList[
                                                                index]
                                                            .productThambnail !=
                                                        null
                                                    ? Image.network(
                                                        'https://bppshops.com/${productUnderSubCategoryList[index].productThambnail}',
                                                        fit: BoxFit.cover,
                                                      )
                                                    : Image.network(
                                                        'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg'),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(
                                                horizontal: 5,
                                              ),
                                              child: Text(
                                                '${productUnderSubCategoryList[index].productName}',
                                                maxLines: 2,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 15),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  flex: 4,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        '৳ ${double.tryParse(productUnderSubCategoryList[index].sellingPrice!)?.toStringAsFixed(1)}',
                                                        style: TextStyle(
                                                            color: Colors.green),
                                                      ),
                                                      Text(
                                                        '৳ ${double.tryParse(productUnderSubCategoryList[index].discountPrice!)?.toStringAsFixed(1)}',
                                                        style: TextStyle(
                                                            color: Colors.red,
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 4,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 12),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          child: Icon(
                                                            Icons.star,
                                                            size: 11,
                                                            color: Colors
                                                                .orangeAccent,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Icon(
                                                            Icons.star,
                                                            size: 11,
                                                            color: Colors
                                                                .orangeAccent,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Icon(
                                                            Icons.star,
                                                            size: 11,
                                                            color: Colors
                                                                .orangeAccent,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Icon(
                                                            Icons.star,
                                                            size: 11,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Icon(
                                                            Icons.star,
                                                            size: 11,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                        //  SizedBox(width: 5,),
                                                        Expanded(
                                                          child: Text(
                                                            '(4)',
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.black,
                                                                fontSize: 8),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )):Padding(
                                padding: const EdgeInsets.only(top: 200),
                                child: Text("No Product Found",textAlign: TextAlign.center,),
                              ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Shimmer(
                            duration: Duration(seconds: 2), //Default value
                            interval: Duration(
                                seconds: 1), //Default value: Duration(seconds: 0)
                            color: Colors
                                .black, //Colors.grey.shade700, //Default value
                            colorOpacity: 0, //Default value
                            enabled: true, //Default value
                            direction: ShimmerDirection.fromLTRB(),
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              height: 30,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          ),
                          GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 2 / 3,
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 10),
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 8,
                            itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Shimmer(
                                  duration:
                                      Duration(seconds: 2), //Default value
                                  interval: Duration(
                                      seconds:
                                          1), //Default value: Duration(seconds: 0)
                                  color: Colors
                                      .black, //Colors.grey.shade700, //Default value
                                  colorOpacity: 0, //Default value
                                  enabled: true, //Default value
                                  direction: ShimmerDirection.fromLTRB(),
                                  child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    height: 200,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
        floatingActionButton: floatingButton(context, Colors.amber),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: bottomAppBar(context, Colors.amber),
      ),
    );
  }
}
