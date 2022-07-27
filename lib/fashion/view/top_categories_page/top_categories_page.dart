
import 'package:bpp_shop/fashion/controller/app_bar_controler.dart';
import 'package:bpp_shop/fashion/model/top_categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class TopCategoriesPage extends StatelessWidget {
  const TopCategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {
                      final appBar = Provider.of<PrimaryScreenState>(context,
                          listen: false);
                      appBar.setPrimaryState(true);
                    },
                    icon: Icon(Icons.arrow_back_ios_outlined),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Top Categories",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 9,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Color(0xffCACACA),
                borderRadius: BorderRadius.circular(15)
              ),
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                //physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: TopCategoriModel.list.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  childAspectRatio: 3 / 2,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 220,
                ),
                itemBuilder: (BuildContext context, i) {
                  TopCategoriModel product =
                  TopCategoriModel.list[i];
                  return GestureDetector(
                    onTap: () {
                      // final appBar =
                      // Provider.of<AppBarController>(context, listen: false);
                      // appBar.setAppBar(false);
                      // final view = Provider.of<SecondaryPage>(context,
                      //     listen: false);
                      // view.setSecondaryPage(1);
                    },
                    child: Container(
                      //margin: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
                      height: MediaQuery.of(context).size.height,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                        color: Colors.white,
                        //borderRadius: BorderRadius.circular(15),
                        // image: DecorationImage(
                        //   image: AssetImage(product.imageUrl.toString()),
                        //   fit: BoxFit.fill
                        // )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(product.imagePath.toString()),
                                  fit: BoxFit.contain),
                              color: Colors.transparent,
                              //borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(product.categoriName.toString()),
                                Text(product.items.toString()),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     Row(
                                //       children: [
                                //         Text(
                                //           "\$" + product.productPrice.toString(),
                                //           style: TextStyle(
                                //               color: Color(0xffFF6000),
                                //               fontWeight: FontWeight.bold),
                                //         ),
                                //       ],
                                //     ),
                                //     Row(
                                //       children: [
                                //         Icon(
                                //           Icons.star,
                                //           color: Color(0xffFF6000),
                                //           size: 20,
                                //         ),
                                //         Text(
                                //           " " + product.productRating.toString(),
                                //           style: TextStyle(
                                //             //color: Color(0xffFF6000),
                                //               fontWeight: FontWeight.bold),
                                //         ),
                                //       ],
                                //     ),
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
