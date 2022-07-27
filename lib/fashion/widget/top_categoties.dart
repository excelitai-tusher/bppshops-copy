import 'package:flutter/material.dart';

import '../../FASHION/MyTheme/app_colors.dart';

class TopCatagories extends StatefulWidget {
  const TopCatagories({Key? key}) : super(key: key);

  @override
  State<TopCatagories> createState() => _TopCatagoriesState();
}

class _TopCatagoriesState extends State<TopCatagories> {
  List productsCatagories = [
    {
      'image': 'assets/banner.png',
      'name': 'Men',
      'shirt': 'T-Shirt',
      'pant': 'Pant',
      'panjabi': 'Panjabi',
      'shoes': 'Shoes'
    },
    {
      'image': 'assets/banner.png',
      'name': 'Women',
      'shirt': 'T-Shirt',
      'pant': 'Pant',
      'panjabi': 'Panjabi',
      'shoes': 'Shoes'
    },
    //{'image': 'assets/pic3.png', 'name': 'Kids','price':'\$2000','discount':'\$2500'},
    //{'image': 'assets/banner.png', 'name': 'Men','price':'\$2000','discount':'\$2500'},
    // {'image': 'assets/banner.png', 'name': 'Women','price':'\$2000','discount':'\$2500'},
    // {'image': 'assets/banner.png', 'name': 'Men','price':'\$2000','discount':'\$2500'},
    // {'image': 'assets/banner.png', 'name': 'Women','price':'\$2000','discount':'\$2500'},
    // {'image': 'assets/pic3.png', 'name': 'Kids','price':'\$2000','discount':'\$2500'},
    // {
    //   'image': 'assets/banner.png',
    //   'name': 'Men',
    //   'price': '\$2000',
    //   'discount': '\$2500'
    // },
    {
      'image': 'assets/banner.png',
      'name': 'Accessories',
      'shirt': 'T-Shirt',
      'pant': 'Pant',
      'panjabi': 'Panjabi',
      'shoes': 'Shoes'
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
                  height: 35,
                  child: Center(
                      child: Text(
                    'Top Categories This Week',
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
          ), SizedBox(
            height: 10,
          ),
          ListView.builder(
              itemCount: productsCatagories.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: ((context, index) {
                return Container(
                  child: Card( color: appColor().grey_color,
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  productsCatagories[index]['name'],
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(productsCatagories[index]['shirt']),
                                Text(productsCatagories[index]['pant']),
                                Text(productsCatagories[index]['panjabi']),
                                Text(productsCatagories[index]['shoes']),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                              width: 100,
                              height: 100,
                              color: Colors.amber,
                              child: Image.asset(
                                productsCatagories[index]['image'],
                               
                                fit: BoxFit.fill,
                              )),
                        ),
                      ],
                    ),
                  ),
                );
              }))
        ],
      ),
    );
  }
}
