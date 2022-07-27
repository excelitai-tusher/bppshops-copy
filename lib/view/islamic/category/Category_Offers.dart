import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import '../../../models/islamic/home_page_category.dart';

class Category_offer extends StatefulWidget {
  const Category_offer({Key? key}) : super(key: key);
  @override
  State<Category_offer> createState() => _Category_offerState();
}

class _Category_offerState extends State<Category_offer> {
  final CarouselController? _carouselSlider = CarouselController();

  Future<List<Getcategory>?> getCategory() async {
    final response =
        await http.get(Uri.parse('https://bppshops.com/api/bs/category_view'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      Category category = Category.fromJson(json);
      return category.getcategory;
    } else {
      throw Exception(
          'Failed to load >>>>Status Code>>> :${response.statusCode}');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    //getCategoryData();
  }

  List<Getcategory>? categoryList;
  getData() async {
    final list = await getCategory();
    setState(() {
      categoryList = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return categoryList != null
        ? Column(
            children: [
              Center(
                child: Text(
                  "Categories", //text
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .2,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: CarouselSlider.builder(
                      itemCount: categoryList!.length,
                      options: CarouselOptions(
                          viewportFraction: .35,
                          reverse: false,
                          autoPlay: true,
                          autoPlayAnimationDuration: Duration(
                            milliseconds: 2000,
                          ),
                      height: MediaQuery.of(context).size.height),
                      carouselController: _carouselSlider,
                      itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) {
                        categoryList![itemIndex];
                        return GestureDetector(
                          // onTap: () {
                          //   Navigator.of(context).push(
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             ScreenSubCategory(
                          //               categoryId:
                          //               "${categoryList![itemIndex].id}",
                          //               categorySlugName: "${categoryList![itemIndex]
                          //                   .categorySlugName}",
                          //             )
                          //     ),
                          //   );
                          // },
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * .14,
                                width: 90,
                                //color: Colors.deepOrangeAccent,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: categoryList![itemIndex].categoryImage !=
                                            null
                                        ? NetworkImage(
                                            "https://bppshops.com/${categoryList![itemIndex].categoryImage}",
                                          )
                                        : NetworkImage(
                                            'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg',
                                          ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              // SizedBox(
                              //   height: 4,
                              // ),
                              SizedBox(
                                width: 90,
                                child: Text(
                                  "${categoryList![itemIndex].categoryName}",
                                  //categoryList.categoryName.toString(),
                                  style: TextStyle(color: Colors.black),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ),
            ],
          )
        : Column(
            children: [
              Shimmer(
                duration: Duration(seconds: 2), //Default value
                interval:
                    Duration(seconds: 1), //Default value: Duration(seconds: 0)
                color: Colors.black, //Colors.grey.shade700, //Default value
                colorOpacity: 0, //Default value
                enabled: true, //Default value
                direction: ShimmerDirection.fromLTRB(),
                child: Container(
                  height: 35,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(6),
                    // border:
                    // Border.all(color: Colors.grey, width: 1)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .2,
                  width: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10),
                      // childAspectRatio: 2/2.5),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, i) {
                        return Shimmer(
                          duration: Duration(seconds: 2), //Default value
                          interval: Duration(
                              seconds: 1), //Default value: Duration(seconds: 0)
                          color: Colors
                              .black, //Colors.grey.shade700, //Default value
                          colorOpacity: 0, //Default value
                          enabled: true, //Default value
                          direction: ShimmerDirection.fromLTRB(),
                          child: Container(
                            //height: MediaQuery.of(context).size.height * .14,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(6),
                              // border:
                              // Border.all(color: Colors.grey, width: 1)
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          );
  }
}
