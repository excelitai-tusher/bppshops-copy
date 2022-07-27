import 'package:flutter/material.dart';

import '../../FASHION/MyTheme/app_colors.dart';

class NewProducts extends StatefulWidget {
  const NewProducts({Key? key}) : super(key: key);

  @override
  State<NewProducts> createState() => _NewProductsState();
}

class _NewProductsState extends State<NewProducts> {
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: appColor().mainColor,
                  height: 35,
                  child: Center(
                    child: Text(
                      'New Products',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
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
          ListView.builder(
              itemCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: ((context, index) {
                return 
           index==0?     Card(
                  child: Container(
                      height: 100,
                      child: Row(
                        children: [
                          Container(
                            height: 100,
                            child: Image.asset(productsList[index]['image'],
                                width: 150, fit: BoxFit.fill),
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
                              Text(
                                '13th march',
                                style: TextStyle(color: Colors.yellow),
                              ),
                              Text(
                                'This is  confortable ',
                                style: TextStyle(),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                    width: 88,
                                    //height: 25,
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

                     
                      ),
                ): Card(
                  child: Container(
                      height: 100,
                      child: Row(mainAxisAlignment: MainAxisAlignment.end,crossAxisAlignment: CrossAxisAlignment.end
                       , children: [
                         
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                productsList[index]['name'],
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '13th march',
                                style: TextStyle(color: Colors.yellow),
                              ),
                              Text(
                                'This is  confortable ',
                                style: TextStyle(),
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
                          ),SizedBox(width: 25,),
                        Column(crossAxisAlignment: CrossAxisAlignment.end,mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(color: Colors.amber,
                                height: 100,
                                child: Image.asset(productsList[index]['image'],
                                    width: 150, fit: BoxFit.fill),
                              ),
                          ],
                        ),
                          ],
                      )));
              })),
              SizedBox(height: 10,),
      Container(padding: EdgeInsets.all(10),
        decoration: BoxDecoration(border: Border.all(color: appColor().mainColor),borderRadius: BorderRadius.circular(10)),
        child: Text('View More Products',style: TextStyle(color: appColor().mainColor),),)  ],
      ),
    );
  }
}
