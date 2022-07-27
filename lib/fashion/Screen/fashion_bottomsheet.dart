import 'package:bpp_shop/view/islamic/productDetails/product%20details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../view_model/bpp/cart_provider.dart';
import '../fashion_product_details/fashion_product_details.dart';

class FashionBottomSheet extends StatefulWidget {
  static const routeName = '/fashionbottomSheet';

  String? id;
  String? productId;
  String? productName;
  //String? productImage;
  // double? productPrice;
  String? color;
  // String? size;
  // String? productPrePrice;
  //String? productDetail;
  // int qty;
  // String? video;

  FashionBottomSheet({
    this.id,
    this.productId,
    this.productName,
    // this.productImage,
    //this.productDetail,
    // this.productPrePrice,
    // this.productPrice,
    this.color,
    // this.size,
    // this.video,
    // this.qty = 1,
  });

  @override
  State<FashionBottomSheet> createState() => _FashionBottomSheetState();
}

class _FashionBottomSheetState extends State<FashionBottomSheet> {
  // int count = 1;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return Container(
        height: MediaQuery.of(context).size.height * 0.8,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(35, 20, 35, 80),
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //Text("${widget.productName}"),
                  Container(
                    height: 150.h,
                    child: Image.network(
                      //"${widget.productImage}",
                      'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg',
                    ),
                  ),
                  Text(
                    "T-Shirt",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  // RichText(
                  //   text: TextSpan(
                  //     text: '৳ ${widget.productPrice!.toStringAsFixed(1)}  ',
                  //     style: TextStyle(
                  //         fontWeight: FontWeight.w600,
                  //         fontSize: 18,
                  //         color: Colors.green),
                  //     children: <TextSpan>[
                  //       TextSpan(
                  //         text:
                  //             '৳ ${double.tryParse(widget.productPrePrice!)!.toStringAsFixed(1)}',
                  //         style: TextStyle(
                  //             color: Theme.of(context).errorColor,
                  //             fontSize: 15.sp,
                  //             decoration: TextDecoration.lineThrough),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 40),
                  //   child: Html(
                  //     data: "${widget.productDetail}",
                  //   ),
                  // ),
                  // widget.size == null
                  //     ? Container()
                  //     : Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Row(
                  //             children: [
                  //               Text(
                  //                 'Size:  ',
                  //                 style: TextStyle(fontWeight: FontWeight.w600),
                  //               ),
                  //               GestureDetector(
                  //                 onTap: () {},
                  //                 child: Container(
                  //                   padding: EdgeInsets.symmetric(
                  //                       horizontal: 6.w, vertical: 4.h),
                  //                   decoration: BoxDecoration(
                  //                     color: Colors.grey,
                  //                     borderRadius: BorderRadius.circular(6),
                  //                   ),
                  //                   child: Text(
                  //                     "${widget.size}",
                  //                     style: TextStyle(color: Colors.white),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //           Text(
                  //             'required',
                  //             style: TextStyle(
                  //                 color: Theme.of(context).errorColor,
                  //                 fontSize: 10.sp),
                  //           ),
                  //         ],
                  //       ),
                  SizedBox(
                    height: 20,
                  ),
                  widget.color == null
                      ? Container()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Color:  ',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15.w, vertical: 6.h),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(
                                            width: 1.w, color: Colors.amber)),
                                    child: Text("${widget.color}"),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'required',
                              style: TextStyle(
                                color: Theme.of(context).errorColor,
                                fontSize: 10.sp,
                              ),
                            )
                          ],
                        ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 20),
                  //   child: Row(
                  //     children: [
                  //       Text('Quantity'),
                  //       Container(
                  //         width: 120.w,
                  //         height: 40.h,
                  //         margin:
                  //             EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  //         decoration: BoxDecoration(
                  //             border: Border.all(color: Colors.grey),
                  //             borderRadius: BorderRadius.circular(6)),
                  //         child: Center(
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             crossAxisAlignment: CrossAxisAlignment.center,
                  //             children: [
                  //               IconButton(
                  //                 onPressed: () {
                  //                   setState(() {
                  //                     if (widget.qty > 1) widget.qty--;
                  //                   });
                  //                 },
                  //                 icon: Icon(Icons.remove),
                  //               ),
                  //               Text(
                  //                 '${widget.qty}',
                  //                 style: TextStyle(fontSize: 18),
                  //               ),
                  //               IconButton(
                  //                 onPressed: () {
                  //                   setState(() {
                  //                     widget.qty++;
                  //                   });
                  //                 },
                  //                 icon: Icon(Icons.add),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  Container(// bottomsheet
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 35, vertical: 0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                  color: Theme.of(context).primaryColor)),
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> Fashion_Product_Details()));
                                // Navigator.of(context).pushNamed(
                                //     ProductDetails.routeName,
                                //     arguments: FashionBottomSheet(
                                //       productId: widget.productId,
                                //       productImage: widget.productImage,
                                //       productPrice: widget.productPrice,
                                //       productPrePrice: widget.productPrePrice,
                                //       productName: widget.productName,
                                //       productDetail: widget.productDetail,
                                //       qty: widget.qty,
                                //       color: widget.color,
                                //       size: widget.size,
                                //       video: widget.video,
                                //     ),
                                // );

                                // Navigator.push(context, MaterialPageRoute(builder: (context) =>  ProductDetails(args.title)));
                              },
                              child: Text(
                                'View Details',
                                style: TextStyle(
                                  fontSize: 13,
                                    color: Theme.of(context).primaryColor),
                              )),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.amber,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                              ),
                              Text(
                                'Add to cart',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ],
                          ),
                          onPressed: () {
                            print("product added");
                            // cart.addItem(
                            //   widget.productId!,
                            //   widget.productPrice!,
                            //   widget.productName.toString(),
                            //   widget.productImage.toString(),
                            //   widget.qty,
                            // );

                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                right: 3,
                top: -12,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.cancel_outlined,
                    color: Theme.of(context).primaryColor,
                  ),
                ))
          ],
        ),
      );
  }
}
