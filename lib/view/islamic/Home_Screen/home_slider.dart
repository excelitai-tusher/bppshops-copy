import 'package:bpp_shop/models/islamic/slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import '../../../service/islamic/http_slider.dart';

class HomeMainSlider extends StatefulWidget {
  const HomeMainSlider({Key? key}) : super(key: key);

  @override
  State<HomeMainSlider> createState() => _HomeMainSliderState();
}

class _HomeMainSliderState extends State<HomeMainSlider> {
  int _current = 0;
  final CarouselController? _carouselSlider = CarouselController();
  // List<Sliders>? slider;
  //  @override
  //  void initState() {
  //    // TODO: implement initState
  //    getSliderData();
  //    super.initState();
  //  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getSlider(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<Sliders> get = snapshot.data ?? <Sliders>[];
            return Container(
              height: 120,
              width: MediaQuery.of(context).size.width,
              child: CarouselSlider.builder(
                  itemCount: get.length,
                  options: CarouselOptions(
                      pauseAutoPlayOnTouch: true,
                      enlargeCenterPage: true,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      },
                      reverse: false,
                      autoPlay: true,
                      autoPlayAnimationDuration: Duration(
                        milliseconds: 2000,
                      ),
                      height: MediaQuery.of(context).size.height),
                  carouselController: _carouselSlider,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                    get[itemIndex];
                    return Stack(
                      children: [
                        Container(
                            height: 120,
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: get[itemIndex].sliderImg != null
                                ? Image.network(
                                    'https://bppshops.com/${get[itemIndex].sliderImg}',
                                    fit: BoxFit.fill,
                                  )
                                : Image.network(
                                    'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg')),
                        Positioned(
                          bottom: 10,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: get.asMap().entries.map((entry) {
                              return GestureDetector(
                                onTap: () =>
                                    _carouselSlider?.animateToPage(entry.key),
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: CircleAvatar(
                                      radius: 4,
                                      backgroundColor: (Theme.of(context).brightness == Brightness.light
                                              ? Colors.amber
                                              : Colors.white)
                                          .withOpacity(_current == entry.key ? 1 : 0.2)),
                                ),
                              );
                            }).toList(),
                          ),
                        )
                      ],
                    );
                  }),
            );
          } else {
            return Center(
              child: Shimmer(
                duration: Duration(seconds: 2), //Default value
                interval:
                    Duration(seconds: 1), //Default value: Duration(seconds: 0)
                color: Colors.black, //Colors.grey.shade700, //Default value
                colorOpacity: 0, //Default value
                enabled: true, //Default value
                direction: ShimmerDirection.fromLTRB(),
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            );
          }
        });
  }
}
