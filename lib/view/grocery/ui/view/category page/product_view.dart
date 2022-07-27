import 'dart:convert';

import 'package:bpp_shop/models/grocery/product_model.dart';
import 'package:bpp_shop/view/bpp/appBar/appBar2.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/BottomAppBar2.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/floatingButton.dart';
import 'package:bpp_shop/view/bpp/drawer/bpp_drawer.dart';
import 'package:bpp_shop/view/grocery/controller/product_detail_data_controller.dart';
import 'package:bpp_shop/view/grocery/ui/constant/app_colors.dart';
import 'package:bpp_shop/view/grocery/ui/constant/clip.dart';
import 'package:bpp_shop/view/grocery/ui/view/product_details/product%20details.dart';
import 'package:bpp_shop/view_model/bpp/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:math' as math;

import 'package:provider/provider.dart';
class ProductView extends StatefulWidget {
  String ?categoryId;
  String ?subCategoryId;
  String ?subSubCategoryId;
  String name;
  String? nameFromFacebook;
  int? routeKey;
  String?sub;
 ProductView({Key? key, this.categoryId, this.subCategoryId, this.subSubCategoryId,required this.name,this.sub}) : super(key: key);

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {

  GlobalKey<ScaffoldState> _scafoldKey = GlobalKey();
  List<Products>? productList;

  Future<List<Products>> getProducts() async {

    http.Response response = await http.post(
      Uri.parse("https://bppshops.com/api/gs/Product_show"),
      body:widget.sub=="yes"? {
       'sub_category_id':widget.subCategoryId,

      }:
          {
            'sub_sub_category_id':widget.subSubCategoryId.toString(),
          }
      ,


      headers:{
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
      },
    );
    if (response.statusCode == 200){
      final jsonBody = jsonDecode(response.body);
      GroceryProduct allProducts =GroceryProduct.fromJson(jsonBody);
      productList=allProducts.products!;
      return allProducts.products!;
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
    print(widget.subSubCategoryId.toString());
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);

    final productDetailData = Provider.of<ProductDetailDataController>(context);
    return Scaffold(
      key: _scafoldKey,
      appBar: bppAppBar2(context,_scafoldKey,widget.nameFromFacebook,widget.routeKey),
      drawer: BPPMainPageDrawer(),
      body: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(widget.name,style: TextStyle(color: Colors.black),),
          centerTitle: true,
          leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ),
        body:productList!=null?  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 3 / 4,
                          crossAxisSpacing: 6
                      ),
                      itemCount: productList!.length,
                      itemBuilder: (BuildContext context, index) {
                        //  BundleOffersModel item = BundleOffersModel.list[index];
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              productDetailData.setProductDetailData(
                                productName: productList![index].productName,
                                //item.productName,
                                productImageUrl: "https://bppshops.com/${productList![index].productThambnail}",
                                //item.productImageUrl,
                                productPrice:productList![index].sellingPrice,
                                productDetails: productList![index].productName,
                                productId: productList![index].id.toString(),
                                discountPrice: productList![index].discountPrice,
                                unit: productList![index].discountPrice,
                                //item.productPrice,
                              );

                              ///way:1
                              showDialog(
                                context: context,
                                builder: (context) => ProductDetails(),
                              );

                              ///way:1
                              ///way:2
                              // showGeneralDialog(
                              //   context: context,
                              //   pageBuilder: (context, animation1, animation2) {
                              //     return SizedBox();
                              //   },
                              //   transitionBuilder: (context, a1, a2, widget) {
                              //     return Transform.scale(
                              //       scale: a1.value,
                              //       child: ProductDetails(),
                              //     );
                              //   },
                              // );
                              ///way:2
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Container(
                                height: 220,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
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
                                              image: DecorationImage(
                                                image:productList![index].productThambnail!=null?NetworkImage("https://bppshops.com/${productList![index].productThambnail}"):
                                                NetworkImage('https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg'),
                                                // AssetImage(item.productImageUrl.toString()),
                                                fit: BoxFit.contain,
                                              )),
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
                                                alignment: Alignment.bottomRight,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    cart.addItem(
                                                      productList![index].id.toString(),
                                                        double.tryParse(productList![index].sellingPrice!)! ,
                                                      productList![index].productName,
                                                        "https://bppshops.com/${productList![index].productThambnail}",
                                                        1

                                                    );

                                                  },
                                                  child: Container(
                                                    height: 20,
                                                    width: 20,
                                                    decoration: BoxDecoration(
                                                      color: Colors.green,
                                                      borderRadius:
                                                      BorderRadius.circular(5),
                                                    ),
                                                    child: Icon(
                                                      Icons.add_shopping_cart_outlined,
                                                      color: tertiaryColor1,
                                                      size: 15,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                "${productList![index].productName}",
                                                //    item.productName.toString(),
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: titleFontColor,
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: Text("Product ingredient",
                                                // item.runtimeType.toString(),
                                                style: TextStyle(
                                                  //fontSize: 20,
                                                  color: tertiaryColor2,
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: Text("${productList![index].sellingPrice}",
                                                // item.productPrice.toString(),
                                                style: TextStyle(
                                                  //fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: primaryColor,
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
                          ),
                        );
                      },

                    )


                ):Center(child:   SpinKitSpinningLines(
    color:  Color(0xFF9FF348),
    size: 80.0,
    ),),


        floatingActionButton: floatingButton(context,Color(0xFF3DC73C)),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar:bottomAppBar(context,Color(0xFF3DC73C)),
      ),
    );
  }
}
