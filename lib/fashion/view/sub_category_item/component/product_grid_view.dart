
import 'package:bpp_shop/fashion/controller/app_bar_controler.dart';
import 'package:bpp_shop/fashion/controller/secondary_page_controller.dart';
import 'package:bpp_shop/fashion/controller/sub_category_controller.dart';
import 'package:bpp_shop/fashion/model/sub_category_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SubCategoryBody extends StatelessWidget {
  //const SubCategoryBody({Key? key}) : super(key: key);
  String? cat;
  SubCategoryBody({Key? key, this.cat}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final subCatData = Provider.of<ProdSubCatModel>(context);
    final subCategories = subCatData.items;




    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2/3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          mainAxisExtent: 230
      ),
      itemBuilder: (ctx, i)=> Container(
        child: GestureDetector(
          onTap: (){
            final catName=Provider.of<SubCategoriesController>(context,listen: false);
            catName.setSubSubCategory(subCategories[i].categoryName.toString());
            final appBar =
            Provider.of<PrimaryScreenState>(context, listen: false);
            appBar.setPrimaryState(false);
            final pageState =
            Provider.of<SecondaryPage>(context, listen: false);
            pageState.setSecondaryPage(5);
            // Navigator.of(context).pushNamed(
            //     SubSubProductScreen.routeName,
            //     arguments: {
            //       'a':cat,
            //       'b':subCategories[i].categoryName
            //     }
            // );
          },
          child: Column(
            children: [
              Image.asset(subCategories[i].imageUrl!),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(subCategories[i].categoryName!),
              )
            ],
          ),
        ),
      ),
      itemCount: subCategories.length,
    );
  }
}
