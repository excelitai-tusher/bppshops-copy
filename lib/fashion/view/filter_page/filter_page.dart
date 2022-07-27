
import 'package:bpp_shop/fashion/controller/app_bar_controler.dart';
import 'package:bpp_shop/fashion/controller/check_box_state_controller.dart';
import 'package:bpp_shop/fashion/controller/secondary_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  static const routeName = '/filter-page';

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  final categories = [
    CatCheckBoxState(title: 'Jacket'),
    CatCheckBoxState(title: 'Electronics'),
    CatCheckBoxState(title: 'Fashion'),
    CatCheckBoxState(title: 'Bike'),
    CatCheckBoxState(title: 'Food'),
    CatCheckBoxState(title: 'Men'),
    CatCheckBoxState(title: 'Women'),
  ];

  final brands = [
    BrandCheckBoxState(title: 'Arong'),
    BrandCheckBoxState(title: 'Kay Kraft'),
    BrandCheckBoxState(title: 'Taga'),
    BrandCheckBoxState(title: 'Gentle Park'),
    BrandCheckBoxState(title: 'Onjons'),
    BrandCheckBoxState(title: 'Dorjibari'),
    BrandCheckBoxState(title: 'Yellow'),
  ];

  final tags = [
    TagCheckBoxState(title: 'Sharee'),
    TagCheckBoxState(title: 'Kameez'),
    TagCheckBoxState(title: 'Handbag'),
    TagCheckBoxState(title: 'Shoes'),
    TagCheckBoxState(title: 'Shirts'),
    TagCheckBoxState(title: 'Watch'),
    TagCheckBoxState(title: 'Jeans'),
  ];


  final sizes = [
    SizeCheckBoxState(title: '32'),
    SizeCheckBoxState(title: '34'),
    SizeCheckBoxState(title: '36'),
    SizeCheckBoxState(title: '38'),
    SizeCheckBoxState(title: '40'),
    SizeCheckBoxState(title: '42'),
    SizeCheckBoxState(title: '44'),
  ];


  RangeValues values = RangeValues(1500, 25000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            //Navigator.pop(context);
            final appBar =
            Provider.of<PrimaryScreenState>(context, listen: false);
            appBar.setPrimaryState(false);

            final pageState =
            Provider.of<SecondaryPage>(context, listen: false);
            pageState.setSecondaryPage(5);
          },
          child: const Icon(Icons.arrow_back_ios,color: Colors.black,),
        ),


        title: Container(
          height: 19,
          width: 80,
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.grey,
                  width: .5
              ),
              borderRadius: BorderRadius.circular(10)
          ),
          child: const Center(
            child: Text('Filters',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14
              ),
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,


      ),



      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey,
                        width: .5
                    ),
                    borderRadius: BorderRadius.circular(7)
                ),
                child: Column(
                  children: [



                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 300,
                            child: ListView(
                              physics: const NeverScrollableScrollPhysics(),
                              itemExtent: 35,
                              padding: EdgeInsets.all(10),
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Text('By Categories',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16
                                    ),
                                  ),
                                ),
                                ...categories.map(categorySingleCheckBox).toList(),


                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 300,
                            child: ListView(
                              physics: const NeverScrollableScrollPhysics(),
                              itemExtent: 35,
                              padding: const EdgeInsets.all(10),
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Text('By Brands',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16
                                    ),
                                  ),
                                ),
                                ...brands.map(brandSingleCheckBox).toList(),

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30,),
                    Row(
                      children: [
                        Expanded(
                            child:Container(
                              height: 300,
                              child: ListView(
                                padding: const EdgeInsets.all(10),
                                physics: const NeverScrollableScrollPhysics(),
                                itemExtent: 35,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Text('By Tags',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                      ),
                                    ),
                                  ),
                                  ...tags.map(tagSingleCheckBox).toList(),
                                ],
                              ),
                            )
                        ),
                        Expanded(
                            child: SizedBox(
                              height: 300,
                              child: ListView(
                                padding: const EdgeInsets.all(10),
                                physics: const NeverScrollableScrollPhysics(),
                                itemExtent: 35,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Text('By Size',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                      ),
                                    ),
                                  ),
                                  ...sizes.map(sizeSingleCheckBox).toList(),
                                ],
                              ),
                            )
                        )
                      ],
                    ),




                    const SizedBox(height: 20,),


                    SizedBox(
                      height: 120,
                      child: Column(
                        children: [
                          const Text('By Price',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: RangeSlider(
                                activeColor: const Color(0xFFFF6000),
                                inactiveColor: Colors.black,
                                min: 1500,
                                max: 25000,
                                values: values,
                                onChanged: (value){
                                  setState(() {
                                    values = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 50),
                                  child: Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFFF6000),
                                        borderRadius: BorderRadius.circular(7)
                                    ),
                                    child: Center(
                                        child: Text(
                                          values.start.toStringAsFixed(0),
                                          style: const TextStyle(
                                              color: Colors.white
                                          ),
                                        )
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 50),
                                  child: Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFFF6000),
                                        borderRadius: BorderRadius.circular(7)
                                    ),
                                    child: Center(
                                        child: Text(
                                          values.end.toStringAsFixed(0),
                                          style: const TextStyle(
                                              color: Colors.white
                                          ),
                                        )
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )



                  ],
                ),
              ),
              const SizedBox(height: 20,),



              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        onPressed: (){},
                        child: const Text('Apply Filters'),
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFFFF6000),
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            side: const BorderSide(width: 1, color: Color(0xFFFF6000))
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        onPressed: (){},
                        child: const Text('Clear All'),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: const Color(0xFFFF6000),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            side: BorderSide(width: 1, color: const Color(0xFFFF6000))
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              //SizedBox(height: 20,)


            ],
          ),
        ),
      ),
    );
  }

  Widget categorySingleCheckBox(CatCheckBoxState category){
    return CheckboxListTile(
        activeColor: const Color(0xFFFF6000),
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(category.title,
          style: const TextStyle(
              color: Colors.grey
          ),
        ),
        value: category.value,
        onChanged: (value)=> setState(() {
          category.value = value!;
        })
    );
  }


  Widget brandSingleCheckBox(BrandCheckBoxState brand){
    return CheckboxListTile(
        activeColor: Color(0xFFFF6000),
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(brand.title,
          style: TextStyle(
              color: Colors.grey
          ),
        ),
        value: brand.value,
        onChanged: (value)=> setState(() {
          brand.value = value!;
        })
    );
  }


  Widget tagSingleCheckBox(TagCheckBoxState tag){
    return CheckboxListTile(
        activeColor: Color(0xFFFF6000),
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(tag.title,
          style: TextStyle(
              color: Colors.grey
          ),
        ),
        value: tag.value,
        onChanged: (value)=> setState(() {
          tag.value = value!;
        })
    );
  }


  Widget sizeSingleCheckBox(SizeCheckBoxState size){
    return CheckboxListTile(
        activeColor: Color(0xFFFF6000),
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(size.title,
          style: TextStyle(
              color: Colors.grey
          ),
        ),
        value: size.value,
        onChanged: (value)=> setState(() {
          size.value = value!;
        })
    );
  }
}
