import 'package:bpp_shop/FASHION/Provider/all_brand_filter_provider.dart';
import 'package:bpp_shop/FASHION/Widget/check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../FASHION/MyTheme/app_colors.dart';

class AllBrandsFiltering extends StatefulWidget {
  const AllBrandsFiltering({Key? key}) : super(key: key);

  @override
  State<AllBrandsFiltering> createState() => _AllBrandsFilteringState();
}

class _AllBrandsFilteringState extends State<AllBrandsFiltering> {
  // Map<String, bool> values = {
  //   'Apple': false,
  //   'Banana': false,
  //   'Cherry': false,
  //   'Mango': false,
  //   'Orange': false,
  // };

  // var tmpArray = [];

  // getCheckboxItems() {
  //   values.forEach((key, value) {
  //     if (value == true) {
  //       tmpArray.add(key);
  //     }
  //   });

  //   // Printing all selected items on Terminal screen.
  //   print(tmpArray);
  //   // Here you will get all your selected Checkbox items.

  //   // Clear array after use.
  //   tmpArray.clear();
  // }

  Map<String, bool> valuess = {
    'Apple': false,
    'Banana': false,
    'Cherry': false,
    'Mango': false,
    'Orange': false,
  };

  var tmpArrays = [];

  getCheckboxItemss() {
    valuess.forEach((key, value) {
      if (value == true) {
        tmpArrays.add(key);
      }
    });

    // Printing all selected items on Terminal screen.
    print(tmpArrays);
    // Here you will get all your selected Checkbox items.

    // Clear array after use.
    tmpArrays.clear();
  }

  @override
  void initState() {
    AllBrandfilterProvider allBrandfilterProvider =
        Provider.of<AllBrandfilterProvider>(context, listen: false);
    allBrandfilterProvider.getCheckboxItems();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AllBrandfilterProvider allBrandfilterProvider =
        Provider.of<AllBrandfilterProvider>(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text('All Brand'),
        centerTitle: true,
        backgroundColor: appColor().mainColor,
        elevation: 00,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16,
            ),
            Container(
              height: 40,
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Search brand and discount offer',
                    contentPadding: EdgeInsets.all(5),
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: appColor().buttonColor.withOpacity(.9),
                        borderRadius: BorderRadius.circular(5)),
                    child: Container(
                        padding: EdgeInsets.all(11),
                        child: Center(
                            child: Text(
                          'ALL Brand',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ))),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        //color: appColor().buttonColor.withOpacity(.9),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: appColor().buttonColor,
                        )),
                    child: Container(
                        padding: EdgeInsets.all(11),
                        child: Center(
                            child: Text(
                          'Discount Offer',
                          style: TextStyle(
                              color: appColor().mainColor,
                              fontWeight: FontWeight.w600),
                        ))),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children:allBrandfilterProvider.
                    
                     values.keys.map((String key) {
                      return new CheckboxListTile(
                        title: new Text(key),
                        value:allBrandfilterProvider. values[key],
                        activeColor: Colors.pink,
                        checkColor: Colors.white,
                        onChanged: (bool? value) {
                         // allBrandfilterProvider.getOnchangetValue(key);
                          setState(() {
                           allBrandfilterProvider. values[key] = value!;
                          });
                          print( allBrandfilterProvider. values[key] );
                          // print(teml)
                        },
                      );
                    }).toList(),
                  ),
                ),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: valuess.keys.map((String key) {
                      return new CheckboxListTile(
                        title: new Text(key),
                        value: valuess[key],
                        activeColor: Colors.pink,
                        checkColor: Colors.white,
                        onChanged: (bool? value) {
                          setState(() {
                            valuess[key] = value!;
                          });
                          print(valuess[key]);
                          // print(teml)
                        },
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ElevatedButton(
          onPressed: () {
          allBrandfilterProvider.  getCheckboxItems();
            Future.delayed(Duration(seconds: 4), () {
              

            });
          },
          child: Text('Submit')),
      SizedBox(
        height: 100,
      )  ],
        ),
        //  CheckboxWidget()
      ),
    );
  }
}
