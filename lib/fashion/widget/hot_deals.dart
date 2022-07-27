

import 'package:carousel_slider/carousel_slider.dart';
import 'package:date_count_down/date_count_down.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';

import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../FASHION/MyTheme/app_colors.dart';
import '../../FASHION/Provider/hot_deals_provider.dart';

class HotDeals extends StatefulWidget {
  const HotDeals({Key? key}) : super(key: key);

  @override
  State<HotDeals> createState() => _HotDealsState();
}

class _HotDealsState extends State<HotDeals> {
  List categories = [
    {'image': 'assets/pic1.png', 'name': 'Men'},
    {'image': 'assets/pic2.png', 'name': 'Women'},
    {'image': 'assets/pic3.png', 'name': 'Kids'},
    {'image': 'assets/pic1.png', 'name': 'Men'},
    {'image': 'assets/pic2.png', 'name': 'Women'},
  ];

  CarouselController buttonCarouselControllers = CarouselController();
  HotDealsProvider? hotDealsProvider;
  int _current_slider = 0;
  // CustomGunjonCountDownText? customGunjonCountDownText;
  var pageIndex=0;
  @override
  void initState() {
    HotDealsProvider hotDealsProvider =
    Provider.of<HotDealsProvider>(context, listen: false);
    hotDealsProvider.getHotDealsProvider();

    super.initState();
  }

  int itemLength = 1;

  @override
  Widget build(BuildContext context) {
    final dateTime = DateTime.now();
    var date = (DateTimeFormat.format(dateTime, format: 'D, M j, H:i'));
    HotDealsProvider hotDealsProvider =
    Provider.of<HotDealsProvider>(context, );
    return Container(
      padding: EdgeInsets.only(right: 10),
      child: ClipPath(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: Colors.grey,
                width: 3.0,
              ),
              right: BorderSide(
                color: Colors.grey,
                width: 3.0,
              ),
              bottom: BorderSide(
                color: Colors.grey,
                width: 2.0,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(date),
                Container(
                  padding: EdgeInsets.only(left: 15, top: 5),
                  width: double.infinity,
                  height: 30,
                  color: appColor().mainColor,
                  child: Text(
                    'Hot Deals',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                hotDealsProvider.hotDealList.length == null
                    ? Center(
                  child: CircularProgressIndicator(),
                )
                    : CarouselSlider.builder( carouselController: buttonCarouselControllers,
                    itemCount: hotDealsProvider.hotDealList.length,
                    options: CarouselOptions(
                        viewportFraction: 1,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        // autoPlay: true,
                        autoPlayInterval: Duration(seconds: 5),
                        autoPlayAnimationDuration:
                        Duration(milliseconds: 2000),
                        autoPlayCurve: Curves.easeInOut,
                        enlargeCenterPage: false,
                        scrollDirection: Axis.horizontal,
                        height: 400,
                        onPageChanged: (index, reason) {
                          setState(() {
                            pageIndex = index;
                          });
                          print(pageIndex);
                        }),
                    itemBuilder: (BuildContext context, int _current_slider, index) {
                      final hotDealsProvider =
                      Provider.of<HotDealsProvider>(context);
                      DateTime flashEndTime = DateTime.parse(hotDealsProvider.hotDealList[_current_slider].endDate.toString());
                      DateTime flashStartTime =
                      DateTime.parse(hotDealsProvider.hotDealList[_current_slider].startDate.toString());
                      int daysBetween_wrong2(DateTime flashEndTime, DateTime flashStartTime) {
                        flashEndTime =   DateTime(flashEndTime.year, flashEndTime.month, flashEndTime.day);
                        flashStartTime = DateTime(flashStartTime.year, flashStartTime.month, flashStartTime.day);
                        return DateTime.utc(flashEndTime.year, flashEndTime.month, flashEndTime.day).difference(DateTime.utc(
                            flashStartTime.year, flashStartTime.month, flashStartTime.day)).inSeconds;
                      }

                      int endTime = DateTime.now().millisecondsSinceEpoch +
                          1000 * int.parse(daysBetween_wrong2(flashEndTime, flashStartTime)
                                  .toString());

                      return Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                height: 100,
                                child: ListView.builder(
                                    itemCount: categories.length,
                                    shrinkWrap: true,
                                    // physics: NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: ((context, index) {
                                      return Container(
                                          padding: EdgeInsets.only(right: 10),
                                          // height: 80,
                                          // width: 80,
                                          child: Column(
                                            children: [
                                              CircleAvatar(
                                                backgroundImage: AssetImage(
                                                    categories[index]['image']),
                                                radius: 40,
                                              ),
                                            ],
                                          ));
                                    })),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 16),
                                child: Row(
                                  children: [
                                    Text(
                                      hotDealsProvider
                                          .hotDealList[_current_slider]
                                          .sellingPrice
                                          .toString(),
                                      //  '\$ 2500',
                                    ),
                                    SizedBox(width: 15),
                                    Text(
                                      hotDealsProvider
                                          .hotDealList[_current_slider]
                                          .discountPrice
                                          .toString(),
                                      //  '\$ 2500',

                                      //  '\$ 2503',
                                      style: TextStyle(
                                          decoration:
                                          TextDecoration.lineThrough,
                                          color: appColor().red_color),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 16),
                                child: Text(
                                  hotDealsProvider
                                      .hotDealList[_current_slider].productName
                                      .toString(),
                                  // 'winter Fashion',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 16),
                                height: 90,
                                width: 250,
                                child: Image(
                                  image: NetworkImage('https://bppshops.com/' +
                                      '${hotDealsProvider.hotDealList[_current_slider].productThambnail}')
                                  //  AssetImage('assets/banner.png'),
                                  ,
                                  fit: BoxFit.fill,
                                  //
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Text(
                                  'Hurry Up !',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              // Text(hotDealsProvider
                              //     .hotDealList[_current_slider].endDate
                              //     .toString())


                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Text(
                                  'Offer ends in :',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: CountdownTimer(
                                  endTime: endTime,
                                  widgetBuilder: (_, CurrentRemainingTime? time) {
                                    if (time == null) {
                                      return Text('Game over');
                                    }
                                    // return Text(
                                    //     'days: [ ${time.days} ], hours: [ ${time.hours} ], min: [ ${time.min} ], sec: [ ${time.sec} ]');
                                    return
                                      Padding(
                                          padding: const EdgeInsets.only(left: 16),
                                          child: Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                      decoration: BoxDecoration(
                                                          color:
                                                          appColor().yellow_color,
                                                          borderRadius:
                                                          BorderRadius.circular(5)),
                                                      height: 25,
                                                      width: 27,
                                                      child: Center(
                                                        child: Text(
                                                          '${time.days}',
                                                        ),
                                                      )),
                                                  Text(
                                                    'Days',
                                                    style: TextStyle(fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: appColor().yellow_color,
                                                        borderRadius:
                                                        BorderRadius.circular(5)),
                                                    height: 25,
                                                    width: 27,
                                                    child: Center(
                                                        child: Text(
                                                          '${time.hours}',
                                                        )),
                                                  ),
                                                  Text(
                                                    'Hours',
                                                    style: TextStyle(fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: appColor().yellow_color,
                                                        borderRadius:
                                                        BorderRadius.circular(5)),
                                                    height: 25,
                                                    width: 27,
                                                    child: Center(
                                                        child: Text(
                                                          '${time.min}',
                                                        )),
                                                  ),
                                                  Text(
                                                    'Min',
                                                    style: TextStyle(fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: appColor().yellow_color,
                                                        borderRadius:
                                                        BorderRadius.circular(5)),
                                                    height: 25,
                                                    width: 27,
                                                    child: Center(
                                                        child: Text(
                                                          '${time.sec}',
                                                        )),
                                                  ),
                                                  Text(
                                                    'Sec',
                                                    style: TextStyle(fontSize: 12),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ));
                                  },
                                ),
                              ),
                              // Padding(
                              //     padding: const EdgeInsets.only(left: 16),
                              //     child: Row(
                              //       children: [
                              //         Column(
                              //           children: [
                              //             Container(
                              //                 decoration: BoxDecoration(
                              //                     color:
                              //                         appColor().yellow_color,
                              //                     borderRadius:
                              //                         BorderRadius.circular(5)),
                              //                 height: 25,
                              //                 width: 27,
                              //                 child: Text(
                              //                   '00',
                              //                 )),
                              //             Text(
                              //               'Days',
                              //               style: TextStyle(fontSize: 12),
                              //             ),
                              //           ],
                              //         ),
                              //         SizedBox(
                              //           width: 10,
                              //         ),
                              //         Column(
                              //           children: [
                              //             Container(
                              //               decoration: BoxDecoration(
                              //                   color: appColor().yellow_color,
                              //                   borderRadius:
                              //                       BorderRadius.circular(5)),
                              //               height: 25,
                              //               width: 27,
                              //               child: Center(
                              //                   child: Text(
                              //                 '00',
                              //               )),
                              //             ),
                              //             Text(
                              //               'Hours',
                              //               style: TextStyle(fontSize: 12),
                              //             ),
                              //           ],
                              //         ),
                              //         SizedBox(
                              //           width: 10,
                              //         ),
                              //         Column(
                              //           children: [
                              //             Container(
                              //               decoration: BoxDecoration(
                              //                   color: appColor().yellow_color,
                              //                   borderRadius:
                              //                       BorderRadius.circular(5)),
                              //               height: 25,
                              //               width: 27,
                              //               child: Center(
                              //                   child: Text(
                              //                 '00',
                              //               )),
                              //             ),
                              //             Text(
                              //               'Min',
                              //               style: TextStyle(fontSize: 12),
                              //             ),
                              //           ],
                              //         ),
                              //         SizedBox(
                              //           width: 10,
                              //         ),
                              //         Column(
                              //           children: [
                              //             Container(
                              //               decoration: BoxDecoration(
                              //                   color: appColor().yellow_color,
                              //                   borderRadius:
                              //                       BorderRadius.circular(5)),
                              //               height: 25,
                              //               width: 27,
                              //               child: Center(
                              //                   child: Text(
                              //                 '00',
                              //               )),
                              //             ),
                              //             Text(
                              //               'Sec',
                              //               style: TextStyle(fontSize: 12),
                              //             ),
                              //           ],
                              //         )
                              //       ],
                              //     )),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                      width: 88,
                                      // height: 25,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: appColor().buttonColor,
                                      ),
                                      padding: EdgeInsets.only(bottom: 4),
                                      child: const Center(
                                          child: Text(
                                            'Shop Now',
                                            style: TextStyle(
                                                fontSize: 13, color: Colors.white),
                                          ))),
                                ),
                              ),

                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ));
                    }),
                Container(
                  decoration: BoxDecoration(
                      color: appColor().soft_grey_color,
                      border: Border(
                        top: BorderSide(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                      )),
                  padding: EdgeInsets.all(5),
                  height: 40,
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        size: 12,
                        color: Colors.grey,
                      ),
                      Text(
                        'Previous Deal',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        '|',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      SizedBox(
                        width: 20,
                      ),


                      GestureDetector(
                        onTap: () => buttonCarouselControllers.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.linear),
                        child: Text('Next Deal',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            )),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 12,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        clipper: ContainerClipSize(),
      ),
    );
  }
}

class ContainerClipSize extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width - 120, size.height);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

