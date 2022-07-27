
import 'package:bpp_shop/fashion/controller/app_bar_controler.dart';
import 'package:bpp_shop/fashion/controller/product_detail_controller.dart';
import 'package:bpp_shop/fashion/controller/secondary_page_controller.dart';
import 'package:bpp_shop/fashion/model/new_arrival_madel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewArrivalsListView extends StatelessWidget {
  const NewArrivalsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 5.w,
          );
        },
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: NewArrivalModel.list.length,
        itemBuilder: (BuildContext context, i) {
          NewArrivalModel product = NewArrivalModel.list[i];
          return Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 7,
                  ),
                  GestureDetector(
                    onTap: () {
                      final appBar =
                      Provider.of<PrimaryScreenState>(context, listen: false);
                      appBar.setPrimaryState(false);
                      final pageState = Provider.of<SecondaryPage>(context,
                          listen: false);
                      pageState.setSecondaryPage(2);
                      final view = Provider.of<ProductDetailController>(context,
                          listen: false);
                      view.setProductData(
                        product.imageUrl.toString(),
                        product.productName.toString(),
                        product.productPrice.toString(),
                      );
                    },
                    child: Container(
                      height: 280,
                      width: 280,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset:
                            Offset(0, 1), // changes position of shadow
                          ),
                        ],
                        color: Colors.white,
                        //borderRadius: BorderRadius.circular(15),
                        // image: DecorationImage(
                        //   image: AssetImage(product.imageUrl.toString()),
                        //   fit: BoxFit.fill
                        // )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 180,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        product.imageUrl.toString()),
                                    fit: BoxFit.cover),
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            Text(product.productName.toString(),
                              style: TextStyle(fontSize: 17.sp),
                            ),
                            Text(product.productDetail.toString(),
                              style: TextStyle(fontSize: 14.sp),),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "\৳ " +
                                          product.productPrice.toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          "\৳ " +
                                              product.productPrice
                                                  .toString(),
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black,
                                              decoration:
                                              TextDecoration.lineThrough
                                            //fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Text(
                                  "\$" + product.productOffers.toString(),
                                  style: TextStyle(
                                      color: Color(0xffFF6000),
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          );
        },
      ),
    );
  }
}
