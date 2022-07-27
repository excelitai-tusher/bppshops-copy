import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../FASHION/MyTheme/app_colors.dart';

class DailyBestSelling extends StatefulWidget {
  const DailyBestSelling({ Key? key }) : super(key: key);

  @override
  State<DailyBestSelling> createState() => _DailyBestSellingState();
}

class _DailyBestSellingState extends State<DailyBestSelling> { List productsList = [
    {
      'image': 'assets/banner.png',
      'name': 'Men',
      'price': '\$2000',
      'discount': '\$2500'
    },
    {
      'image': 'assets/banner.png',
      'name': 'Women',
      'price': '\$2000',
      'discount': '\$2500'
    },
    //{'image': 'assets/pic3.png', 'name': 'Kids','price':'\$2000','discount':'\$2500'},
    //{'image': 'assets/banner.png', 'name': 'Men','price':'\$2000','discount':'\$2500'},
    // {'image': 'assets/banner.png', 'name': 'Women','price':'\$2000','discount':'\$2500'},
    // {'image': 'assets/banner.png', 'name': 'Men','price':'\$2000','discount':'\$2500'},
    // {'image': 'assets/banner.png', 'name': 'Women','price':'\$2000','discount':'\$2500'},
    // {'image': 'assets/pic3.png', 'name': 'Kids','price':'\$2000','discount':'\$2500'},
    {
      'image': 'assets/banner.png',
      'name': 'Men',
      'price': '\$2000',
      'discount': '\$2500'
    },
    {
      'image': 'assets/banner.png',
      'name': 'Women',
      'price': '\$2000',
      'discount': '\$2500'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
         Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  color: appColor().mainColor,
                  height: 35.h,
                  child: Center(
                      child: Text(
                    'Daily Best Sale Products',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  )),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.white,
                  height: 35,
                  child: Text(''),
                ),
              ),
            ],
          ),
        SizedBox(
            height: 10,
          ),
          Container(height: 150,
            child: ListView.builder(
                itemCount: productsList.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
               // physics: NeverScrollableScrollPhysics(),
                itemBuilder: ((context, index) {
                  return Card(
                    child: Container(
                        height: 150,
                        child: Row(
                          children: [
                            Container(
                              height: 150,
                              child: Image.asset(productsList[index]['image'],
                                  width: 120, fit: BoxFit.fill,
                                  height: double.infinity,),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  productsList[index]['name'],
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w600),
                                ),
                                Text(productsList[index]['price']),
                                Text(
                                  productsList[index]['discount'],
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: appColor().red_color),
                                ),
                               
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                      width: 88,
                                     // height: 25,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: appColor().buttonColor,
                                      ),
                                    padding: EdgeInsets.only(bottom: 4),
                                      child: Center(
                                          child: Text(
                                        'Shop Now',
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.white),
                                      ))),
                                ),
                              ],
                            )
                          ],
                        )

                        //      ListTile(contentPadding: EdgeInsets.all(0),
                        //       trailing: Container(height: 150,color: Colors.amber,
                        //         child: Image.asset(productsList[index]['image'],
                        //         width: 70,
                        //         fit: BoxFit.fill),
                        //       ),
                        //  title: Text(productsList[index]['name']),
                        //  subtitle: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //     Text(productsList[index]['price']),
                        //          Text(productsList[index]['discount'])
                        //  ],), ),
                        ),
                  );
                })),
          ), 
      ],),
    );
  }
}