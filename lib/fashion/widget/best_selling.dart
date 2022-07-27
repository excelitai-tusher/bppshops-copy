import 'package:flutter/material.dart';

import '../../FASHION/MyTheme/app_colors.dart';

class BestSellingProduct extends StatefulWidget {
  const BestSellingProduct({Key? key}) : super(key: key);

  @override
  State<BestSellingProduct> createState() => _BestSellingProductState();
}

class _BestSellingProductState extends State<BestSellingProduct> {
  List productsList = [
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
          Container(
            height: 30,
            color: appColor().mainColor,
            child: Center(
                child: Text(
              'Best Selling Products',
              style: TextStyle(fontSize: 17, color: Colors.white),
            )),
          ),
          SizedBox(
            height: 10,
          ),
          ListView.builder(
              itemCount: productsList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: ((context, index) {
                return Card(
                  child: Container(
                      height: 100,
                      child: Row(
                        children: [
                          Container(
                            height: 100,
                            child: Image.asset(productsList[index]['image'],
                                width: 120, fit: BoxFit.fill),
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
                              Row(
                                children: [
                                  Wrap(
                                    children: List.generate(
                                        5,
                                        (index) => Icon(
                                              Icons.star,
                                              size: 13,
                                            )),
                                  )
                                ],
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
          SizedBox(
            height: 10,
          ),
          Container(
            height: 100,
            child: Image.asset(
              'assets/banner.png',
              fit: BoxFit.fill,
              width: double.infinity,
            ),
          )
        ],
      ),
    );
  }
}
