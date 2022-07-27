
import 'package:bpp_shop/fashion/controller/product_detail_controller.dart';
import 'package:bpp_shop/fashion/model/cart_model.dart';
import 'package:bpp_shop/fashion/model/wishlist_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    final wishList = Provider.of<WishlistModel>(context);


    return SingleChildScrollView(
      child: wishList.wishListDataCheck(false)?
      Center(
          child: Column(
            children: [
              SizedBox(height: 100,),
              Text('No Item in WishList !'),
            ],
      )):Column(
        children: [

          SizedBox(height: 10,),
          SizedBox(
            height: MediaQuery.of(context).size.height * .7,
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10,
                );
              },
              itemCount: WishlistModel.list.length,
              //itemExtent: 100,
              itemBuilder: (context, index) {
                WishlistModel item = WishlistModel.list[index];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: ListTile(
                        leading: SizedBox(
                          height: MediaQuery.of(context).size.height,
                          width: 100,
                          child: Image.asset(
                            item.imageUrl.toString(),
                          ),
                        ),
                        title: Text(
                          item.productName.toString(),
                          style: TextStyle(fontSize: 15),
                        ),
                        subtitle: Text(
                          item.productPrice.toString(),
                          style: TextStyle(fontSize: 15),
                        ),
                        trailing: Column(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: IconButton(
                                iconSize: 15,
                                onPressed: () {





                                  showDialog(
                                      context: context,
                                      builder: (ctx)=> AlertDialog(
                                        title: const Text('Are you sure?'),
                                        content: const Text('Dou tou wnt to delete item from the WishList? '),
                                        actions: [
                                          TextButton(
                                              onPressed: (){
                                                Navigator.of(ctx).pop(false);
                                              },
                                              child: const Text('No', style: TextStyle(color: Colors.deepOrange),)
                                          ),
                                          TextButton(
                                              onPressed: (){
                                                Navigator.of(ctx).pop(true);

                                                wishList.deleteList(index);
                                              },
                                              child: const Text('Yes', style: TextStyle(color: Colors.deepOrange))
                                          )
                                        ],
                                      )
                                  );



                                },
                                icon: Icon(
                                  FontAwesomeIcons.timesCircle,
                                  size: 20,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: IconButton(
                                iconSize: 15,
                                onPressed: () {

                                  final prodDetails = Provider.of<ProductDetailController>(context, listen: false);
                                  prodDetails.setProductData(
                                    item.imageUrl.toString(),
                                    item.productName.toString(),
                                    item.productPrice.toString(),
                                  );
                                  final cart = Provider.of<CartModel>(context, listen: false);
                                  cart.addCartList(
                                      prodDetails.productImageUrl.toString(),
                                      prodDetails.productName.toString(),
                                      prodDetails.productPrice.toString()
                                  );


                                },
                                icon: Icon(
                                  Icons.add_shopping_cart,
                                  color: Color(0xffFF6000),
                                  size: 20,
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
            ),
          ),
          SizedBox(
            height: 40,
            width: MediaQuery.of(context).size.width*.5,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xffFF6000),
              ),
              onPressed: () {

              },
              child: Text(
                "Add all to my cart",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
