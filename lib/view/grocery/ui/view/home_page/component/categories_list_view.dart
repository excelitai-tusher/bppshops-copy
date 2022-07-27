import 'package:bpp_shop/models/grocery/categories.dart';
import 'package:bpp_shop/service/grocery/http_categories.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import '../../category page/sub_category.dart';

class CategoriesListView extends StatelessWidget {
  CategoriesListView({Key? key}) : super(key: key);
  final CarouselController? _carouselSlider = CarouselController();
  @override
  Widget build(BuildContext context) {

    // final homeProvider = Provider.of<GHomeViewModel>(context);
    return FutureBuilder(
        future: getGroceryCategories(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<GCategory> getdata = snapshot.data ?? <GCategory>[];
            return Column(
                children: [
                  SizedBox(
                    height: 130,
                    width: MediaQuery.of(context).size.width,
                    child: CarouselSlider.builder(
                        itemCount: getdata.length,
                        options: CarouselOptions(
                            viewportFraction: .2,
                            initialPage: 0,
                            reverse: false,
                            autoPlay: true,
                            autoPlayAnimationDuration: Duration(
                              milliseconds: 2000,
                            ),
                            height: MediaQuery.of(context).size.height),
                        carouselController: _carouselSlider,
                        itemBuilder: (context, int i, int pageViewIndex) {
                          // final get=homeProvider.gcategoryList![i];
                          final get = getdata[i];
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => SubCategoryPage(
                                      categoryId: "${get.id}",
                                      categorySlugName: "${get.categoryName}",
                                    )),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 4, bottom: 5, left: 10, right: 5),

                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 40,
                                    backgroundImage: get.categoryImage != null
                                        ? NetworkImage(
                                        "https://bppshops.com/${get.categoryImage}")
                                        : NetworkImage(
                                        'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg'),
                                  ),

                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 3,
                                        offset: Offset(
                                            0, 1), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                ),
                                Center(
                                    child: Text(
                                      "${get.categoryName}",
                                      style: TextStyle(fontSize: 12),
                                    )),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: Column(
                children: [
                  Shimmer(
                    duration: Duration(seconds: 2), //Default value
                    interval: Duration(
                        seconds: 1), //Default value: Duration(seconds: 0)
                    color: Colors.black, //Colors.grey.shade700, //Default value
                    colorOpacity: 0, //Default value
                    enabled: true, //Default value
                    direction: ShimmerDirection.fromLTRB(),
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 30,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 90,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Shimmer(
                            duration: Duration(seconds: 2), //Default value
                            interval: Duration(
                                seconds:
                                1), //Default value: Duration(seconds: 0)
                            color: Colors
                                .black, //Colors.grey.shade700, //Default value
                            colorOpacity: 0, //Default value
                            enabled: true, //Default value
                            direction: ShimmerDirection.fromLTRB(),
                            child: CircleAvatar(
                              backgroundColor: Colors.grey.shade300,
                              radius: 34,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }
}
