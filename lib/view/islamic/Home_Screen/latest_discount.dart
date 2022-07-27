

import 'package:bpp_shop/component/gradient_text.dart';
import 'package:bpp_shop/models/islamic/latest_discount_model.dart';
import 'package:bpp_shop/view/islamic/Home_Screen/latest_discount_shop_now.dart';
import 'package:bpp_shop/view/islamic/productDetails/bottom_sheet.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';

import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../service/islamic/http_latest_discount.dart';


class LatestDiscount extends StatefulWidget {
  @override
  _LatestDiscountState createState() => _LatestDiscountState();
}

class _LatestDiscountState extends State<LatestDiscount> {
  final CarouselController? _carouselSlider = CarouselController();

 // HttpRequests _httpRequests = HttpRequests();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:getlatestDiscountData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<Latestdiscountproduct> get = snapshot.data ??
              <Latestdiscountproduct>[];
          return get.length>0? Column(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  child: Text(
                    "Latest Discount Products",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Container(
                height: 200,
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .42,
                          child: Image.asset(
                            "assets/image 158.webp",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                            top: 10,
                            left: 5,
                            child: Text(
                              "Bring Hala Products\n into your Home",
                            )),
                        Positioned(
                            top: 55,
                            left: 10,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LatestDiscountShopNow()));
                              },
                              child: Text(
                                'Shop Now ->',
                                style: TextStyle(color: Colors.white),
                              ),
                            ))
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width * .45,
                        height: 445,
                        child: CarouselSlider.builder(
                            itemCount: get.length,
                            options: CarouselOptions(
                              viewportFraction: 1,
                              enlargeCenterPage: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayAnimationDuration: Duration(
                                milliseconds: 2000,
                              ),
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height,
                            ),
                            carouselController: _carouselSlider,
                            itemBuilder: (context, int index, int pageViewIndex) {
                              return Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,

                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.grey, width: 1)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex:6
                                     , child: Container(

                                          alignment: Alignment.center,
                                          child:get[index].productThambnail != null? Image.network(
                                            'https://bppshops.com/${get[index].productThambnail}',
                                            fit: BoxFit.cover,
                                          ):
                                          Image.network('https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg'),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        '${get[index].category!.categoryName}',
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(fontSize: 14,color: Colors.grey),
                                      ),
                                    ),

                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        '${get[index].productName}',
style: TextStyle(
  fontSize: 16
),
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            size: 12,
                                            color: Colors.orangeAccent,
                                          ),
                                          Icon(
                                            Icons.star,
                                            size: 12,
                                            color: Colors.orangeAccent,
                                          ),
                                          Icon(
                                            Icons.star,
                                            size: 12,
                                            color: Colors.orangeAccent,
                                          ),
                                          Icon(
                                            Icons.star,
                                            size: 12,
                                            color: Colors.grey,
                                          ),
                                          Icon(
                                            Icons.star,
                                            size: 12,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '(4)',
                                            style: TextStyle(color: Colors.black,fontSize: 11),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: RichText(
                                        text: TextSpan(
                                          text: '৳ ${double.tryParse(get[index].sellingPrice!)?.toStringAsFixed(1)}  ',
                                            style: TextStyle(color: Colors.green),
                                          children:  <TextSpan>[
                                            TextSpan(text:  '৳ ${double.tryParse(get[index].discountPrice!)?.toStringAsFixed(1)}', style: TextStyle(
                                                color: Theme.of(context).errorColor,
                                                decoration: TextDecoration
                                                    .lineThrough)),

                                          ],
                                        ),
                                      ),
                                    ),

                                    Center(
                                      child: FittedBox(
                                        child: ElevatedButton.icon(
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
                                                  productId: get[index].id.toString(),
                                                  productImage:get[index].productThambnail != null?
                                                  'https://bppshops.com/${get[index]
                                                      .productThambnail}':'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg',
                                                  productName: get[index].productName,
                                                  productDetail: get[index].metaDesc,
                                                  productPrePrice: get[index].discountPrice,
                                                 color: get[index].productColor,
                                                 size: get[index].productSize,
                                                 // shipping: double.tryParse(get[index].shipping!),
                                                  productPrice:
                                                  double.tryParse(get[index].sellingPrice!),
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
                                    ),
                                  ],
                                ),
                              );
                            }


                        )),
                  ],
                ),
              ),
            ],
          ):Container();
        }
        else {
          return Column(
            children: [
              Shimmer(
                duration: Duration(seconds: 2), //Default value
                interval: Duration(seconds: 1), //Default value: Duration(seconds: 0)
                color: Colors.black,//Colors.grey.shade700, //Default value
                colorOpacity: 0, //Default value
                enabled: true, //Default value
                direction: ShimmerDirection.fromLTRB(),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 35,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(6),

                  ),
                ),
              ),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2/2.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10
                ),
              itemCount: 2,
scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, i) {
              return Shimmer(
                duration: Duration(seconds: 2), //Default value
                interval: Duration(seconds: 1), //Default value: Duration(seconds: 0)
                color: Colors.black,//Colors.grey.shade700, //Default value
                colorOpacity: 0, //Default value
                enabled: true, //Default value
                direction: ShimmerDirection.fromLTRB(),
                child: Container(
                        child: Center(
                          child: GradientText(
                            'Bpp Shop',
                            style: TextStyle(fontSize:10,fontWeight: FontWeight.bold,letterSpacing: 0,),

                            gradient: LinearGradient(colors: [
                              // Colors.grey.shade900,
                              // Colors.grey.shade800,
                              // Colors.grey.shade700,
                              Colors.grey.shade500,
                              Colors.grey.shade500,
                              Colors.grey.shade500,
                              Colors.grey.shade500,
                              Colors.grey.shade500,
                              // Colors.grey.shade400,
                              // Colors.grey.shade300,
                              // Colors.grey.shade200,
                              // Colors.grey.shade100,
                              // Colors.teal,
                              // Colors.green,
                              // Colors.lightGreen,
                              // Colors.lime,
                              // Colors.yellow,
                              // Colors.amber,
                              // Colors.orange,
                              // Colors.deepOrange,
                            ]),
                            align:TextAlign.center,
                          ),
                        ),
                decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(6),)
                ),
              );}),
            ],
          );
        }
      }

    );
  }

}
