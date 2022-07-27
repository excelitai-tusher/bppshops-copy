
import 'package:bpp_shop/fashion/controller/app_bar_controler.dart';
import 'package:bpp_shop/fashion/controller/secondary_page_controller.dart';
import 'package:bpp_shop/fashion/controller/sub_category_controller.dart';
import 'package:bpp_shop/fashion/model/woman_category_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CategoryScreenBody extends StatelessWidget {
  const CategoryScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final categoryData = Provider.of<ProdCategoryModel>(context);
    final categories = categoryData.items;

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2/3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          mainAxisExtent: 230
      ),
      itemBuilder: (ctx,i) => Container(
        child: GestureDetector(
          onTap: (){
            // Navigator.of(context).pushNamed(
            //     SubCatScreen.routeName, arguments: categories[i].categoryName
            // );
            final catName=Provider.of<SubCategoriesController>(context,listen: false);
            catName.setSubCategory(categories[i].categoryName.toString());
            final appBar =
            Provider.of<PrimaryScreenState>(context, listen: false);
            appBar.setPrimaryState(false);
            final pageState =
            Provider.of<SecondaryPage>(context, listen: false);
            pageState.setSecondaryPage(4);
          },
          child: Column(
            children: [
              Image.asset(categories[i].imageUrl!),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(categories[i].categoryName!),
              ),
            ],
          ),
        ),
      ),
      itemCount: categories.length,
    );
  }
}