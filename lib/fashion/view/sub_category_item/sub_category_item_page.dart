
import 'package:bpp_shop/fashion/controller/app_bar_controler.dart';
import 'package:bpp_shop/fashion/controller/secondary_page_controller.dart';
import 'package:bpp_shop/fashion/controller/sub_category_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'component/product_grid_view.dart';

class SubCatScreen extends StatefulWidget {
  SubCatScreen({Key? key}) : super(key: key);


  static const routeName = '/product-subCat';


  @override
  State<SubCatScreen> createState() => _SubCatScreenState();
}

class _SubCatScreenState extends State<SubCatScreen> {


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


  @override
  Widget build(BuildContext context) {
    //final catName = ModalRoute.of(context)!.settings.arguments as String;
    final catName=Provider.of<SubCategoriesController>(context);
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
            pageState.setSecondaryPage(3);
          },
          child: Icon(Icons.arrow_back_ios,color: Colors.black,),
        ),
        title: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 3),
            decoration: const BoxDecoration(
                color: Color(0xFFFF6000),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                      offset: Offset(0, 3)
                  )
                ]
            ),
            child: const Text('Fashion',
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
            onPressed: (){},
            icon: Image.asset(
              "assets/icons/filter_icon.png",
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Women '),
                      Text('> '+catName.selectedSubCategory.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
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
                                onPressed: (){},
                                icon: Image.asset('assets/icons/dropDown_icon.png')
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: DropdownButton(
                                isExpanded: true,
                                iconSize: 15,
                                underline: SizedBox(),
                                style: const TextStyle(
                                    fontSize: 10,
                                    color: Colors.black
                                ),
                                value: dropdownvalue,
                                icon: const Icon(Icons.keyboard_arrow_down),
                                items: items.map((String items){
                                  return DropdownMenuItem(
                                    child: Text(items),
                                    value: items,
                                  );
                                }).toList(),
                                onChanged: (String? newValue){
                                  setState(() {
                                    dropdownvalue = newValue!;
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
              height: MediaQuery.of(context).size.height*.75,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SubCategoryBody(cat: catName.selectedSubCategory.toString()),
              ),
            ),


          ],
        ),
      ),



      //bottomNavigationBar: BottomNav(),

    );
  }
}
