import 'package:bpp_shop/FASHION/MyTheme/app_colors.dart';
import 'package:bpp_shop/FASHION/Provider/hot_deals_provider.dart';


import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FlashDeal extends StatefulWidget {
  const FlashDeal({Key? key}) : super(key: key);

  @override
  State<FlashDeal> createState() => _FlashDealState();
}

class _FlashDealState extends State<FlashDeal> {
  CarouselController buttonCarouselController = CarouselController();
  //final controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  void initState() {
    // TODO: implement initState

    HotDealsProvider hotDealsProvider =
        Provider.of<HotDealsProvider>(context, listen: false);
    hotDealsProvider.getHotDealsProvider();
  }

  int pageIndex = 0;
  List _list = ['Page1', 'Page2', 'Page3'];
  @override
  Widget build(BuildContext context) {
    HotDealsProvider hotDealsProvider = Provider.of(context);
    return Container(
      padding: EdgeInsets.all(10),
      color: Color.fromRGBO(208, 199, 199, 0.122),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text('HOT DEALS',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  shadows: [Shadow(color: Colors.black, offset: Offset(0, -5))],
                  color: Colors.transparent,
                  decoration: TextDecoration.underline,
                  decorationColor: appColor().mainColor,
                  decorationThickness: 3,
                  decorationStyle: TextDecorationStyle.solid,
                )),
          ),
          SizedBox(
            height: 10,
          ),
          Stack(children: [
            Container(
              //   height: 200,
              child: Column(children: <Widget>[
                CarouselSlider.builder(
                  itemCount: hotDealsProvider.hotDealList.length,
                  itemBuilder: ((context, pageIndex, realIndex) {
                    return Container(
                        // height: 100,
                        padding: EdgeInsets.symmetric(horizontal: 35),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 100,
                              padding:
                                  EdgeInsets.only(top: 10, left: 15, right: 15),
                              child: Image(
                                image: NetworkImage('https://bppshops.com/' +
                                    '${hotDealsProvider.hotDealList[pageIndex].productThambnail}')
                                //  AssetImage('assets/banner.png'),
                                ,
                                fit: BoxFit.fill, width: double.infinity,
                                //
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              hotDealsProvider.hotDealList[pageIndex].productName
                                  .toString(),maxLines: 2,
                              style: TextStyle(color: appColor().buttonColor),
                            ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      hotDealsProvider
                                          .hotDealList[pageIndex].sellingPrice
                                          .toString(),
                                      style: TextStyle(
                                          color: appColor().buttonColor),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      hotDealsProvider
                                          .hotDealList[pageIndex].discountPrice
                                          .toString(),
                                      style: TextStyle(
                                        color: appColor().red_color,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 1),
                                    child: Container(
                                        width: 88,
                                        // height: 25,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: appColor().buttonColor,
                                        ),
                                        padding: EdgeInsets.only(bottom: 4),
                                        child: Center(
                                            child: Text(
                                          'Shop Now',
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.white),
                                        ))),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        color: Color.fromARGB(255, 242, 218, 217));
                  }),
                  carouselController: buttonCarouselController,
                  options: CarouselOptions(
                     // autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 0.9,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          pageIndex = index;
                        });
                        print(pageIndex);
                     }
                      ),
                ),
                SizedBox(height: 10,),
                AnimatedSmoothIndicator(
                  activeIndex: pageIndex,
                  count: hotDealsProvider.hotDealList.length,
                  effect: SlideEffect(  
      spacing:  8.0,  
      radius:  50.0,  
      dotWidth:  13.0,  
      dotHeight:  13.0,  
      paintStyle:  PaintingStyle.stroke,  
      strokeWidth:  1.5,  
      dotColor:  Colors.grey,  
      activeDotColor:  appColor().mainColor
   ),  
                  onDotClicked: (index){
                    setState(() {
                      pageIndex=index;
                    });
                  },
                )
              ]),
            ),
            Positioned(
              top: 50,
              left: 10,
              child: TextButton(
                  onPressed: () => buttonCarouselController.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear),
                  child: Icon(Icons.arrow_back_ios,
                      size: 30, color: appColor().mainColor)),
            ),
            Positioned(
              top: 50,
              right: 10,
              child: TextButton(
                onPressed: () => buttonCarouselController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linear),
                child: Icon(Icons.arrow_forward_ios,
                    size: 30, color: appColor().mainColor),
              ),
            ),
          ]),
        
        ],
      ),
    );
  }
}
