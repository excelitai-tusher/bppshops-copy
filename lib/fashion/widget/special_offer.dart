import 'package:flutter/material.dart';

class Special_Offer extends StatefulWidget {
  const Special_Offer({Key? key}) : super(key: key);

  @override
  State<Special_Offer> createState() => _Special_OfferState();
}

class _Special_OfferState extends State<Special_Offer> {
  List productsCatagories = [
    {'image': 'assets/banner.png', 'name': 'Men', 'price': '\$1000'},
    {'image': 'assets/banner.png', 'name': 'Women', 'price': '\$1000'},
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
    {'image': 'assets/banner.png', 'name': 'Accessories', 'price': '\$1000'},
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            'SPECIAL OFFER',
            style: TextStyle(
              shadows: [Shadow(color: Colors.red, offset: Offset(0, -5))],
              color: Colors.transparent,
              decoration: TextDecoration.underline,
              decorationColor: Colors.red,
              decorationThickness: 2,
              decorationStyle: TextDecorationStyle.solid,
            ),
          ),
        ],
      ),
    );
  }
}
