import 'dart:convert';
import 'package:bpp_shop/FASHION/Model/categoriesModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  Future<CategoriesModel> getCagoriesData() async {
    Map<String, dynamic>? result;
    try {
      String url = 'https://bppshops.com/api/bs/category_view';
      http.Response response = await http.get(Uri.parse(url));
      print('provider ${response.body}');
      if (response.statusCode == 200) {
        result = jsonDecode(response.body);
        print(result);
        return CategoriesModel.fromJson(result!);
      }
    } catch (e) {
      print(' Error has ${e.toString()}');
    }
    return CategoriesModel.fromJson(result!);
  }

  List<Getcategorys>? categorilist = [];
  getdata() async {
    var data = await getCagoriesData();
    setState(() {
      categorilist = data.getcategory;
    });
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

//   @override
//   Widget build(BuildContext context) {
//   //  CatgoriesProvider catgoriesProvider= Provider.of<CatgoriesProvider>(context);

//     return Center(
//       child: Column(
//       children: [
//         Container(child: Text('How are you Oshin'),),
//      Text("${categoryList![i].categoryName}") ],
//     ));
//   }
// }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: TextButton(
            child: Icon(
              Icons.arrow_back_ios_outlined,
              size: 25,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          title: Text(
            "All Category",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(Icons.search, size: 30, color: Colors.grey),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Text(
                  "Categories",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .2,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(
                       // width: 130,
                      );
                    },
                     scrollDirection: Axis.horizontal,
                    itemCount: categorilist!.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height * .14,
                              width: 190,
                              decoration: BoxDecoration(
                               // color: Colors.brown,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "https://bppshops.com/${categorilist![index].categoryImage}",
                                  ),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              )),
                          SizedBox(
                           // width: 290,
                            child: Text(
                              categorilist![index].categoryName.toString(),
                              //categoryList.categoryName.toString(),
                              style: TextStyle(color: Colors.black),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
