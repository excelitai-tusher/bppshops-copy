
import 'package:bpp_shop/models/grocery/drawer_sub_sub_categories_model.dart';
import 'package:bpp_shop/view/grocery/ui/view/category%20page/product_view.dart';
import 'package:bpp_shop/view/grocery/ui/view/category%20page/sub_category.dart';
import 'package:bpp_shop/view/grocery/ui/view/category%20page/sub_sub_categories.dart';
import 'package:bpp_shop/view/grocery/ui/view/home_page/component/special_offers_list_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../../../../fashion/grocery/grocery_drawer_view_model.dart';
import '../../constant/app_colors.dart';

class GroceryDrawer extends StatefulWidget {

  GroceryDrawer({Key? key}) : super(key: key);
  @override
  _GroceryDrawerState createState() => _GroceryDrawerState();
}

class _GroceryDrawerState extends State<GroceryDrawer> {

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    final gdrawerProvider = Provider.of<GroceryDrawerViewModel>(context);
    return SafeArea(
      child: Container(
        height: double.infinity,
        width: MediaQuery.of(context).size.width / 1.5,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.amber, width: 2)),
        child: gdrawerProvider.gDcategoryList!=null?SingleChildScrollView(
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
                itemCount: gdrawerProvider.gDcategoryList!.length,
                itemBuilder: (BuildContext context,index){

                  return Theme(
                    data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 28.0, bottom: 8),
                          child: ListView.builder(
                            itemCount: gdrawerProvider.gDsubCategoryList!.length,
                            physics:
                            const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context,subindex){
                              //drawerProvider.getOnClickSubCategory(drawerProvider.categoryList![categoryindex].id!.toInt());
                              final subItem=gdrawerProvider.gDsubCategoryList![subindex];
                              List<GDSubsubcategories> list=gdrawerProvider.checkSubSubCategory(subItem.id.toString());
                              return subItem.categoryId.toString()==gdrawerProvider.gDcategoryList![index].id.toString()?
                              Theme(
                                data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                                child: ExpansionTile(
                                    leading: Container(width: 1,color: Colors.amber,),
                                    trailing: list.length==0?Text(''):null,
                                    title:GestureDetector(
                                        onTap: () async{
                                          list.length==0? Navigator.push(context, MaterialPageRoute(builder: (context) =>  ProductView(sub: "yes", subCategoryId:subItem.id.toString(),name:subItem.subCategorySlugName!,))) :Navigator.push(context, MaterialPageRoute(builder: (context) =>  GrocerySubSubCategories(categoryId: subItem.categoryId!,subCategoryId:subItem.id.toString(),name:subItem.subCategorySlugName!,)));
                                          },
                                        child: Text(subItem.subCategorySlugName.toString())) ,

                                    children:[

                                      Padding(
                                        padding: const EdgeInsets.only(left: 28.0, bottom: 8),
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            physics: NeverScrollableScrollPhysics(),
                                            itemCount: gdrawerProvider.gDsubSubcategoryList!.length,
                                            itemBuilder: (BuildContext context,subsubindex){
                                              final subSubItem=gdrawerProvider.gDsubSubcategoryList![subsubindex];
                                              return subSubItem.subcategoryId.toString()==gdrawerProvider.gDsubCategoryList![subindex].id.toString()?Theme(
                                                data: Theme.of(context)
                                                    .copyWith(dividerColor: Colors.transparent),
                                                child: ExpansionTile(
                                                  leading: Container(width: 1,color: Colors.amber,),
                                                  title: Text(""),
                                                  trailing: GestureDetector(


                                                        onTap: () async{
                                                     Navigator.push(context, MaterialPageRoute(builder: (context) =>  ProductView(sub:"",subSubCategoryId:subSubItem.id.toString(),name:subSubItem.subsubcategorySlugName!,)));


                                                        },

                                                      child: Text(subSubItem.subsubcategorySlugName.toString())),
                                                ),
                                              ):Container();
                                            }
                                        ),
                                      ),
                                    ]
                                ),
                              ):Container();
                            },
                          ),
                        )
                      ],
                      leading: Container(
                        height: 25,
                        width: 25,
                        child: Image.network(
                          "https://bppshops.com/" + gdrawerProvider.gDcategoryList![index].categoryIcon.toString(),
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: GestureDetector(
                        onTap: (){
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //       builder: (context) => SubCategoryPage(
                          //         categoryId:
                          //         "${gdrawerProvider.gDcategoryList![index].id}",
                          //         categorySlugName: "${gdrawerProvider.gDcategoryList![index].categoryName}",
                          //       )
                          //   ),
                          // );
                        },
                        child: Text(
                          gdrawerProvider.gDcategoryList![index].categoryName!,
                          style: const TextStyle(letterSpacing: 1, fontSize: 15),
                        ),
                      ),
                      iconColor: Colors.red,
                      textColor: Colors.amber,
                      collapsedTextColor: Colors.black,
                    ),
                  );
                },
              ),

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
    final gdrawerProvider = Provider.of<GroceryDrawerViewModel>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 20,left: 20,bottom: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>SpecialOfferListView(gSpecialOffersList: gdrawerProvider.gSpecialOffersList!,)));
                },
                child: Row(
                  children: [
                    Text(
                      "Special Offers",
                      style: TextStyle(fontSize: 20, color: titleFontColor),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 6),
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.deepOrangeAccent, width: 2),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child:  Center(
                        child: Text(
                          "${gdrawerProvider.gspacialOffers}",
                          style: TextStyle(
                              fontSize: 18, color: Colors.deepOrangeAccent),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.menu_open),
                //alignment: Alignment.topRight,
              ),
            ],
          ),
          GestureDetector(
            // onTap: (){
            //   Navigator.push(
            //       context, MaterialPageRoute(builder: (_) => MyCoupons()));
            // },
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

