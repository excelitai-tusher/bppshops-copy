import 'package:bpp_shop/models/grocery/categories.dart';
import 'package:bpp_shop/service/grocery/http_categories.dart';
import 'package:bpp_shop/view/bpp/appBar/appBar2.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/BottomAppBar2.dart';
import 'package:bpp_shop/view/bpp/drawer/bpp_drawer.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/floatingButton.dart';
import 'package:bpp_shop/view/grocery/ui/view/category%20page/sub_category.dart';
import 'package:flutter/material.dart';

class AllCategory extends StatefulWidget {
  AllCategory({Key? key}) : super(key: key);
  String? nameFromFacebook;
  int? routeKey;
  @override
  _AllCategoryState createState() => _AllCategoryState();
}

class _AllCategoryState extends State<AllCategory> {
  GlobalKey<ScaffoldState> _scafoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scafoldKey,
      appBar: bppAppBar2(
          context, _scafoldKey, widget.nameFromFacebook, widget.routeKey),
      drawer: BPPMainPageDrawer(),
      body: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_outlined,
              size: 25,
              color: Colors.black,
            ),
          ),
          title: Center(
            child: Text(
              "All categories",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(Icons.search, size: 30, color: Colors.grey),
            ),
          ],
        ),
        body: FutureBuilder(
          future: getGroceryCategories(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<GCategory> get = snapshot.data ?? <GCategory>[];
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemCount: get.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => SubCategoryPage(
                                  categoryId: "${get[index].id}",
                                  categorySlugName:
                                      "${get[index].categoryName}",
                                )),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            child: Image(
                              image: get[index].categoryImage != null
                                  ? NetworkImage(
                                      "https://bppshops.com/${get[index].categoryImage}")
                                  : NetworkImage(
                                      'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg'),
                              fit: BoxFit.cover,
                            ),
                            radius: 35,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${get[index].categoryName}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,

                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        floatingActionButton: floatingButton(context, Color(0xFF3DC73C)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: bottomAppBar(context, Color(0xFF3DC73C)),
      ),
    );
  }
}
