import 'dart:convert';
import 'package:bpp_shop/fashion/Screen/fashion_bottomsheet.dart';
import 'package:bpp_shop/fashion/widget/floating_button/floatingActionButton.dart';
import 'package:bpp_shop/service/grocery/http_top_selling.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/BottomAppBar2.dart';
import 'package:bpp_shop/view/islamic/productDetails/bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import '../../FASHION/widget/mostPopular_product.dart';
import '../../component/cart.dart';
import '../../models/islamic/most_popular.dart';
import '../../view/bpp/bottomAppBar/floatingButton.dart';

class FashionProductPage extends StatefulWidget {
  const FashionProductPage({Key? key}) : super(key: key);

  @override
  State<FashionProductPage> createState() => _FashionProductPageState();
}

class _FashionProductPageState extends State<FashionProductPage> {
  List _loadedPhotos = [];

  _fetchData() async {
    const API_URL = 'https://jsonplaceholder.typicode.com/photos';
    final response = await http.get(Uri.parse(API_URL));
    final data = json.decode(response.body);
    print(response.body);
    setState(() {
      _loadedPhotos = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Cotton",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          SizedBox(
            width: 5,
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.notifications_outlined, color: Colors.white),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: FutureBuilder(
          future: _fetchData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return GridView.builder(
              itemCount: _loadedPhotos.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 2.5,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 10),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Theme.of(context).primaryColor)),
                  child: GridTile(
                    child: GridTileBar(
                      subtitle: Column(
                        children: [
                          Container(
                              height: 100,
                              child: Image.network(
                                  "https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg")
                            // child: _loadedPhotos [index]['thumbnailUrl']!= null
                            //     ? Image.network(
                            //   'https://jsonplaceholder.typicode.com/${_loadedPhotos[index].productThambnail}',
                            //   fit: BoxFit.cover,
                            // )
                            //     : Image.network(
                            //     'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg'),

                          ),
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  _loadedPhotos[index]['title'],
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  _loadedPhotos[index]['title'],
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '৳ 2,000.0',
                                      //'${double.tryParse([index].sellingPrice!)?.toStringAsFixed(1)}',
                                      style: TextStyle(color: Colors.green),
                                    ),
                                    Text(
                                      '৳ 2,500.0',
                                      // '${double.tryParse([index].discountPrice!)?.toStringAsFixed(1)}',
                                      style: TextStyle(
                                          color: Colors.red,
                                          decoration:
                                          TextDecoration.lineThrough,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ],
                                ),
                                ElevatedButton.icon(
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
                                        return FashionBottomSheet(
                                          productId: _loadedPhotos[index]['id'].toString(),
                                          //productImage: _loadedPhotos[index]['thumbnailUrl'],
                                          productName: _loadedPhotos[index]['title'].toString(),
                                          //productDetail: get[index].productDescp,
                                          //productPrePrice: _loadedPhotos[index].discountPrice,
                                          //  shipping: double.tryParse(get[index].shipping!),
                                          //color: get[index].productColor,
                                         // size: get[index].productSize,
                                          //video: get[index].videoLink,
                                          // productPrice: double.tryParse(
                                          //  _loadedPhotos[index].sellingPrice!,
                                          // ),
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

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // color: Colors.orange,
                  // alignment: Alignment.center,
                  // child: Text("${list[index]}"),
                );
              },
            );
          },
        ),
      ),
      // Container(
      //   child: Column(
      //     children: [
      //       Container(
      //         margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Container(
      //               decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(6),
      //                 border: Border.all(color: Colors.grey),
      //               ),
      //               child: Row(
      //                 children: [
      //                   Icon(
      //                     Icons.filter_alt_outlined,
      //                     color: Colors.grey,
      //                   ),
      //                   TextButton(
      //                       onPressed: () {
      //                       //  Navigator.of(context).push(MaterialPageRoute(
      //                       //      builder: (context) => Filter()));
      //                       },
      //                       child: Text(
      //                         'Filters',
      //                         style: TextStyle(
      //                             color: Theme.of(context).primaryColor),
      //                       )),
      //                 ],
      //               ),
      //             ),
      //             Container(
      //               decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(6),
      //                 border: Border.all(color: Colors.grey),
      //               ),
      //               child: Row(
      //                 children: [
      //                   Icon(
      //                     Icons.height,
      //                     color: Colors.grey,
      //                   ),
      //                   TextButton(
      //                       onPressed: () {
      //                         //  Navigator.of(context).push(MaterialPageRoute(
      //                         //      builder: (context) => Filter()));
      //                       },
      //                       child: Text(
      //                         'Filters',
      //                         style: TextStyle(
      //                             color: Theme.of(context).primaryColor),
      //                       )),
      //               //    MyDropDown(),
      //                 ],
      //               ),
      //             ),
      //           ],
      //         ),
      //
      //       ),
      //       Container(
      //      //   margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      //         child: FutureBuilder(
      //           future:_fetchData() ,
      //           builder: (BuildContext context, AsyncSnapshot snapsho){
      //             return  GridView.builder(
      //               itemCount: _loadedPhotos.length ,
      //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //                   crossAxisCount: 2,
      //                   childAspectRatio: 2 / 2.5,
      //                   crossAxisSpacing: 15,
      //                   mainAxisSpacing: 10),
      //               itemBuilder: (BuildContext context,int index){
      //                 return Container(
      //                   decoration: BoxDecoration(
      //                       color: Colors.white,
      //                       borderRadius: BorderRadius.circular(6),
      //                       border: Border.all(color: Theme.of(context).primaryColor)),
      //                   child: GridTile(child:
      //                   GridTileBar(
      //                     subtitle: Column(
      //                       children: [
      //                         Container(
      //                             height: 100,
      //                             child:Image.network("https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg")
      //                           //   _loadedPhotos [index]['thumbnailUrl']!= null
      //                           //       ? Image.network(
      //                           //     'https://jsonplaceholder.typicode.com/${_loadedPhotos[index].productThambnail}',
      //                           //     fit: BoxFit.cover,
      //                           //   )
      //                           //       : Image.network(
      //                           //       'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg'),
      //                           //
      //                         ),
      //                         Center(
      //                           child: Column(
      //                             children: [
      //                               Text(
      //                                 _loadedPhotos[index]['title'],
      //                                 style: TextStyle(
      //                                     color: Colors.grey),
      //                               ),
      //                               Text(
      //                                 _loadedPhotos[index]['title'],
      //                                 style: TextStyle(
      //                                     color: Colors.grey),
      //                               ),
      //                               Row(
      //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                                 children: [
      //                                   Text('৳ 2,000.0',
      //                                     // '${double.tryParse([index].sellingPrice!)?.toStringAsFixed(1)}',
      //                                     style: TextStyle(color: Colors.green),),
      //                                   Text(
      //                                     '৳ 2,500.0',
      //                                     // '${double.tryParse([index].discountPrice!)?.toStringAsFixed(1)}',
      //                                     style: TextStyle(color: Colors.red,decoration: TextDecoration.lineThrough,overflow:TextOverflow.ellipsis),
      //                                   ),
      //
      //                                 ],
      //                               ),
      //
      //                               ElevatedButton(
      //                                 style: ElevatedButton.styleFrom(
      //                                   primary: Color(0xFFE37D4E),
      //                                   minimumSize: Size(90, 30),
      //                                 ),
      //                                 onPressed: () {},
      //                                 child: Text("hello",
      //                                   style: TextStyle(color: Colors.white),),)
      //                             ],
      //                           ),
      //                         )
      //                       ],
      //                     ),
      //                   ),),
      //                   // color: Colors.orange,
      //                   // alignment: Alignment.center,
      //                   // child: Text("${list[index]}"),
      //                 );
      //               },
      //             );  },
      //         ),
      //
      //       ),
      //
      //
      //     ],
      //   ),
      // ),
      floatingActionButton: floatingButton(context, Colors.amber),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottomAppBar(context, Colors.amber),
    );
  }
}