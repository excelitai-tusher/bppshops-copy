
import 'package:bpp_shop/fashion/controller/app_bar_controler.dart';
import 'package:bpp_shop/fashion/controller/secondary_page_controller.dart';
import 'package:bpp_shop/fashion/controller/sub_category_controller.dart';
import 'package:bpp_shop/fashion/model/sub_sub_categories_product_model.dart';
import 'package:bpp_shop/fashion/view/sub_sub_categories_page/component/product_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubSubProductScreen extends StatefulWidget {
  const SubSubProductScreen({Key? key}) : super(key: key);

  static const routeName = '/subSub-products';

  @override
  _SubSubProductScreenState createState() => _SubSubProductScreenState();
}

class _SubSubProductScreenState extends State<SubSubProductScreen> {


  String dropdownvalue = 'Default';
  var items = [
    'Default',
    'Oldest',
    'Newest',
    'Price: low to high',
    'price: high to low',
    'Name: A to Z',
    'Name: Z to A',
    'Rating: low to high',
    'Rating: high to low'
  ];

  Future<void> _sortProd()async{
    if(dropdownvalue=="Name: A to Z"){
      await Provider.of<SubSubProductsModel>(context, listen: false).ascendingTitle();
    }else if(dropdownvalue=="Name: Z to A"){
      await Provider.of<SubSubProductsModel>(context, listen: false).descendingTitle();
    }else if(dropdownvalue=="Price: low to high"){
      await Provider.of<SubSubProductsModel>(context, listen: false).priceLowToHigh();
    }else if(dropdownvalue=="price: high to low"){
      await Provider.of<SubSubProductsModel>(context, listen: false).priceHighToLow();
    }
  }



  @override
  Widget build(BuildContext context) {
    //final subCatName = ModalRoute.of(context)!.settings.arguments as Map;
    final subCatName=Provider.of<SubCategoriesController>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFA800),
        leading: GestureDetector(
          onTap: (){
            //Navigator.pop(context);
            final appBar =
            Provider.of<PrimaryScreenState>(context, listen: false);
            appBar.setPrimaryState(false);

            final pageState =
            Provider.of<SecondaryPage>(context, listen: false);
            pageState.setSecondaryPage(4);
          },
          child: Icon(Icons.arrow_back_ios,color: Colors.black,),
        ),
        title: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 3),
            decoration: BoxDecoration(
                color: Color(0xFFFF6000),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                      offset: Offset(0, 3)
                  )
                ]
            ),
            child: Text('Fashion',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon: Image.asset(
              "assets/icons/search_icon.png",
              fit: BoxFit.cover,
            ),
          ),
          IconButton(
            onPressed: (){
              //Navigator.of(context).pushNamed(FilterScreen.routeName);
              final appBar =
              Provider.of<PrimaryScreenState>(context, listen: false);
              appBar.setPrimaryState(false);

              final pageState =
              Provider.of<SecondaryPage>(context, listen: false);
              pageState.setSecondaryPage(6);
            },
            icon: Image.asset(
              "assets/icons/filter_icon.png",
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),



      body: SingleChildScrollView(
        //physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            //SizedBox(height: MediaQuery.of(context).size.height*.01),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Women'),
                      Text(' > '+subCatName.selectedSubCategory.toString()),
                      Text(' > '+subCatName.selectedSubSubCategory.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*.5),
                    child: Container(
                      height: 30,
                      padding: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: IconButton(
                                onPressed: (){

                                },
                                icon: Image.asset('assets/icons/dropDown_icon.png')
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: DropdownButton(
                                isExpanded: true,
                                iconSize: 15,
                                underline: SizedBox(),
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black
                                ),
                                value: dropdownvalue,
                                icon: Icon(Icons.keyboard_arrow_down),
                                items: items.map((String items){
                                  return DropdownMenuItem(
                                    child: Text(items),
                                    value: items,
                                  );
                                }).toList(),
                                onChanged: (String? newValue){
                                  setState(() {
                                    dropdownvalue = newValue!;
                                    _sortProd();
                                  });

                                }
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*.73,
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: SubSubProductItems(),
              ),
            ),


          ],
        ),
      ),




      //bottomNavigationBar: BottomNav(),
    );
  }
}
