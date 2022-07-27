
import 'package:bpp_shop/models/islamic/drawer_sub_sub_category.dart';
import 'package:bpp_shop/view/islamic/category/screen_sub_category.dart';
import 'package:bpp_shop/view/islamic/category/screen_sub_category_products_view.dart';
import 'package:bpp_shop/view/islamic/special_offer_screen.dart';
import 'package:bpp_shop/view/bpp/coupon/my_coupon.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../../../service/islamic/http_home_page_category.dart';
import '../../../view_model/islamic/drawer_data_viewmodel.dart';
class MyDrawer extends StatefulWidget {
  String categoryId;
 // String categorySlugName;
  MyDrawer({Key? key,required this.categoryId,}) : super(key: key);
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    final drawerProvider = Provider.of<DrawerViewModel>(context);
    return SafeArea(
      child: Container(
        height: double.infinity,
        width: MediaQuery.of(context).size.width / 1.5,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.amber, width: 2)),
        child: drawerProvider.categoryList != null
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    buildDrawerHeader(),
                    Container(
                      height: 1,
                      width: double.maxFinite,
                      color: Colors.grey,
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: drawerProvider.categoryList!.length,
                      itemBuilder: (BuildContext context, index) {
                        // drawerProvider.getOnClickSubCategory(drawerProvider.categoryList![categoryindex].id!.toInt());
                        //print(drawerProvider.categoryList![categoryindex].id!.toInt());
                        return Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child: ExpansionTile(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 28.0, bottom: 8),
                                child: ListView.builder(
                                  itemCount:
                                      drawerProvider.subCategoryList!.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, subindex) {
                                    //drawerProvider.getOnClickSubCategory(drawerProvider.categoryList![categoryindex].id!.toInt());
                                    final subItem = drawerProvider
                                            .subCategoryList![
                                        subindex]; //drawerProvider.subCategoryList![subindex].id.toString
                                    List<Subsubcategories> list =
                                        drawerProvider.checkSubSubCategory(
                                            subItem.id.toString());
                                    //final list=drawerProvider.subSubcategoryList!.where((element) => subItem.id.toString()==element.subcategoryId.toString()).toList();
                                    //print(list.length.toString()+"<<<<<<<<<<<<<<<list length check >>>>>>>>>>>>>>>");
                                    return subItem.categoryId.toString() ==
                                            drawerProvider
                                                .categoryList![index].id
                                                .toString()
                                        ? Theme(
                                            data: Theme.of(context).copyWith(
                                                dividerColor:
                                                    Colors.transparent),
                                            child: ExpansionTile(
                                                leading: Container(
                                                  width: 1,
                                                  color: Colors.amber,
                                                ),
                                                trailing: list.length == 0
                                                    ? Text("")
                                                    : null,
                                                title: GestureDetector(
                                                    onTap: () {
                                                      // print(subItem.categoryId.toString());
                                                      // print(subItem.id.toString());
                                                      //await getSubSubCategory(subItem.categoryId.toString(),subItem.id.toString(),context,subItem.subCategorySlugName.toString());
                                                      list.length == 0
                                                          ? Navigator.of(
                                                                  context)
                                                              .push(
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        SubCategoryWiseProductView(
                                                                  //productUnderSubCategoryList: subCategory.productUnderSubCategory!,
                                                                  categoryId: subItem
                                                                      .categoryId
                                                                      .toString(),
                                                                  subCategoryId:
                                                                      subItem.id
                                                                          .toString(),
                                                                  title: subItem
                                                                      .subCategorySlugName
                                                                      .toString(), productUnderSubCategoryList: [],
                                                                  //subCategoryID: subCateGoryId,
                                                                ),
                                                              ),
                                                            )
                                                          : null;
                                                    },
                                                    child: Text(subItem
                                                        .subCategorySlugName
                                                        .toString())),
                                                children: [
                                                  //Container(height: 20,width: double.infinity,color: Colors.red,)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 28.0,
                                                            bottom: 8),
                                                    child: ListView.builder(
                                                        shrinkWrap: true,
                                                        physics:
                                                            NeverScrollableScrollPhysics(),
                                                        itemCount: drawerProvider
                                                            .subSubcategoryList!
                                                            .length,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                subsubindex) {
                                                          final subSubItem =
                                                              drawerProvider
                                                                      .subSubcategoryList![
                                                                  subsubindex];
                                                          return subSubItem
                                                                      .subcategoryId
                                                                      .toString() ==
                                                                  drawerProvider
                                                                      .subCategoryList![
                                                                          subindex]
                                                                      .id
                                                                      .toString()
                                                              ? Theme(
                                                                  data: Theme.of(
                                                                          context)
                                                                      .copyWith(
                                                                          dividerColor:
                                                                              Colors.transparent),
                                                                  child:
                                                                      ExpansionTile(
                                                                    title: Text(
                                                                        ""),
                                                                    trailing: GestureDetector(
                                                                      onTap: (){

                                                                      },
                                                                        child: Text(subSubItem
                                                                            .subsubcategorySlugName
                                                                            .toString())),
                                                                  ),
                                                                )
                                                              : Container();
                                                        }),
                                                  ),
                                                ]),
                                          )
                                        : Container();
                                  },
                                ),
                              )
                            ],
                            leading: Container(
                              height: 25,
                              width: 25,
                              child: Image.network(
                                "https://bppshops.com/" +
                                    drawerProvider
                                        .categoryList![index].categoryIcon
                                        .toString(),
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: GestureDetector(
                              onTap: () {
                                // Navigator.of(context).push(
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             ScreenSubCategory(
                                //               categoryId:
                                //               "${drawerProvider.categoryList![index].id}",
                                //               categorySlugName: "${drawerProvider.categoryList![index]
                                //                   .categorySlugName}",
                                //             )
                                //     ),
                                //   );
                              },
                              child: Text(
                                drawerProvider
                                    .categoryList![index].categorySlugName!,
                                style: const TextStyle(
                                    letterSpacing: 1, fontSize: 15),
                              ),
                            ),
                            iconColor: Colors.red,
                            textColor: Colors.amber,
                            collapsedTextColor: Colors.black,
                          ),
                        );
                      },
                    ),

              //Expanded(child: SizedBox(width: 100,))
            ],
          ),
        ):Center(child: SpinKitPouringHourGlassRefined(
          color:  Color(0xFFE37D4E),
          size: 50.0,
        )),
      ),
    );
  }

  Widget buildDrawerHeader(){
    final drawerProvider = Provider.of<DrawerViewModel>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20.0, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => SpecialOfferScreen()));
                },
                child: Row(
                  children: [
                    const Text(
                      'Special Offers',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.deepOrangeAccent, width: 2),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '${drawerProvider.spacialOffers}',
                          style: TextStyle(
                              fontSize: 18, color: Colors.deepOrangeAccent),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.menu_open),
                alignment: Alignment.topRight,
              ),
            ],
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => MyCoupons()));
            },
            child: Row(
              children: [
                const Text(
                  'Coupon',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    border:
                    Border.all(color: Colors.deepOrangeAccent, width: 2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '25',
                      style: TextStyle(
                          fontSize: 18, color: Colors.deepOrangeAccent),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
