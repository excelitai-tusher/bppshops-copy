
import 'package:bpp_shop/fashion/controller/app_bar_controler.dart';
import 'package:bpp_shop/fashion/controller/secondary_page_controller.dart';
import 'package:bpp_shop/fashion/controller/sub_category_controller.dart';
import 'package:bpp_shop/fashion/model/drawer_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'component/colors.dart';
import 'component/txt.dart';
import 'component/url.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ComplexDrawer extends StatefulWidget {
  const ComplexDrawer({Key? key}) : super(key: key);

  @override
  _ComplexDrawerState createState() => _ComplexDrawerState();
}

class _ComplexDrawerState extends State<ComplexDrawer> {
  int selectedIndex = -1; //dont set it to 0
  bool isExpanded = false;
  int selectedIndex2 = -1;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width*.7;
    return Drawer(
      child: Container(
        width: width,
        child: blackIconTiles(), //row(),
        //color: Colors.transparent,
      ),
    );
  }

  Widget row() {
    return Row(
      children: [
        blackIconTiles(), //isExpanded? blackIconTiles():blackIconMenu(),
        invisibleSubMenus(),
      ],
    );
  }

  Widget blackIconTiles(){
    return SafeArea(
      child: Container(
        //width: MediaQuery.of(context).size.width, //200,
        color: Colors.white, //Colorz.complexDrawerBlack,
        child: Column(
          children: [
            controlTile(),
            couponsAndothers(),
            Expanded(
              child: Container(
                color: Colors.white,
                child: ListView.builder(
                  itemCount: cdms.length,
                  itemBuilder: (BuildContext context, int index){
                    //  if(index==0) return controlTile();
                    CDM cdm = cdms[index];
                    bool selected = selectedIndex == index;
                    return ExpansionTile(
                      //backgroundColor: Color(0xffC4C4C4),
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      expandedAlignment: Alignment.centerLeft,
                      onExpansionChanged: (z) {
                        setState((){
                          selectedIndex = z ? index : -1;
                          if(cdm.title=="Women"){
                            print(cdm.title);
                            final appBar =
                            Provider.of<PrimaryScreenState>(context, listen: false);
                            appBar.setPrimaryState(false);
                            final pageState =
                            Provider.of<SecondaryPage>(context, listen: false);
                            pageState.setSecondaryPage(3);
                            //Navigator.pop(context);
                          }else{
                            final appBar =
                            Provider.of<PrimaryScreenState>(context, listen: false);
                            appBar.setPrimaryState(true);
                          }
                        });
                      },
                      leading: Icon(cdm.icon, color: Colors.black),
                      title: Txt(
                        text: cdm.title,
                        color: Colors.black,
                        fontSize: 15.sp,
                      ),
                      trailing: cdm.submenus!.isEmpty
                          ? null
                          : Icon(
                              selected
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: Colors.black,
                            ),
                      children: cdm.submenus!.map((subMenu) {
                        return sMenuButton(subMenu, false,);
                      }).toList(),
                    );
                  },
                ),
              ),
            ),
            //accountTile(),
          ],
        ),
      ),
    );
  }

  Widget controlTile() {
    return Container(
      color: Color(0xffFFA800),
      child: ListTile(
        //leading: FlutterLogo(),
        title: Center(
          child: Txt(
            text: "Fashion",
            fontSize: 18.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing:      IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.menu,color: Colors.white,),alignment: Alignment.topRight,),
        //onTap: expandOrShrinkDrawer,
      ),

    );
  }

  Widget couponsAndothers() {
    return SizedBox(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Coupons",
                  style: TextStyle(
                    fontSize: 16.sp
                  ),
                ),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    border: Border.all(
                      width: 1,
                      color: Color(0xffFF6000),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "1",
                      style: TextStyle(
                        color: Color(0xffFF6000),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Others",
                style: TextStyle(
                fontSize: 16.sp
            ),
                ),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    border: Border.all(
                      width: 1,
                      color: Color(0xffFFA800),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "1",
                      style: TextStyle(color: Color(0xffFFA800)),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget blackIconMenu() {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      width: 100, //MediaQuery.of(context).size.width*.5,//100,
      color: Colorz.complexDrawerBlack,
      child: Column(
        children: [
          controlButton(),
          Expanded(
            child: ListView.builder(
                itemCount: cdms.length,
                itemBuilder: (contex, index) {
                  // if(index==0) return controlButton();
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      height: 45,
                      alignment: Alignment.center,
                      child: Icon(cdms[index].icon, color: Colors.white),
                    ),
                  );
                }),
          ),
          accountButton(),
        ],
      ),
    );
  }

  Widget invisibleSubMenus() {
    // List<CDM> _cmds = cdms..removeAt(0);
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      width: isExpanded ? 0 : 125,
      color: Colorz.compexDrawerCanvasColor,
      child: Column(
        children: [
          Container(height: 95),
          Expanded(
            child: ListView.builder(
                itemCount: cdms.length,
                itemBuilder: (context, index) {
                  CDM cmd = cdms[index];
                  // if(index==0) return Container(height:95);
                  //controll button has 45 h + 20 top + 30 bottom = 95

                  bool selected = selectedIndex == index;
                  bool isValidSubMenu = selected && cmd.submenus!.isNotEmpty;
                  return subMenuWidget(
                      [cmd.title!]..addAll(cmd.submenus!), isValidSubMenu);
                }),
          ),
        ],
      ),
    );
  }

  Widget controlButton() {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 30),
      child: InkWell(
        onTap: expandOrShrinkDrawer,
        child: Container(
          height: 45,
          alignment: Alignment.center,
          child: FlutterLogo(
            size: 40,
          ),
        ),
      ),
    );
  }

  Widget subMenuWidget(List<String> submenus, bool isValidSubMenu) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: isValidSubMenu ? submenus.length.toDouble() * 37.5 : 45,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: isValidSubMenu
              ? Colorz.complexDrawerBlueGrey
              : Colors.transparent,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(8),
            bottomRight: Radius.circular(8),
          )),
      child: ListView.builder(
          padding: EdgeInsets.all(6),
          itemCount: isValidSubMenu ? submenus.length : 0,
          itemBuilder: (context, index) {
            String subMenu = submenus[index];
            return sMenuButton(subMenu, index == 0);
          }),
    );
  }
Widget subMenuButton(String subMenu,bool isTitle){
    return InkWell(
      onTap: () {
        //handle the function
        //if index==0? donothing: doyourlogic here
        if(subMenu=="Long Kameez"){
          final catName=Provider.of<SubCategoriesController>(context,listen: false,);
          catName.setSubSubCategory(subMenu.toString(),);

          final appBar =
          Provider.of<PrimaryScreenState>(context, listen: false);
          appBar.setPrimaryState(false);

          final pageState =
          Provider.of<SecondaryPage>(context, listen: false);
          pageState.setSecondaryPage(5);
          Navigator.pop(context);
        }
        if(subMenu=="katan Sharee"){
          final catName=Provider.of<SubCategoriesController>(context,listen: false,);
          catName.setSubSubCategory(subMenu.toString(),);

          final appBar =
          Provider.of<PrimaryScreenState>(context, listen: false);
          appBar.setPrimaryState(false);

          final pageState =
          Provider.of<SecondaryPage>(context, listen: false);
          pageState.setSecondaryPage(5);
          Navigator.pop(context);
        }
        print(subMenu);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Txt(
          text: subMenu,
          fontSize: isTitle ? 17 : 14,
          color: isTitle ? Colors.white : Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
}
  Widget sMenuButton(String subMenu, bool isTitle){
    return InkWell(
      onTap: () {
        print(subMenu);
        //handle the function
        //if index==0? donothing: doyourlogic here
      },
      child: subMenu=="Salwar Kameez"?Align(
        alignment: Alignment.centerRight,
        child: Container(
          height: 200,
          width: 200,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: subMenuWomen.length,
                  itemBuilder: (BuildContext context, int index) {
                    //  if(index==0) return controlTile();
                    CDM cdm = subMenuWomen[index];
                    bool selected = selectedIndex2 == index;
                    return ExpansionTile(
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      expandedAlignment: Alignment.center,
                      onExpansionChanged: (z) {
                        setState(() {
                          selectedIndex2 = z ? index : -1;
                          if(cdm.title=="Salwar Kameez"){
                            print(cdm.title);
                            final catName=Provider.of<SubCategoriesController>(context,listen: false,);
                            catName.setSubCategory(cdm.title.toString(),);
                            final appBar =
                            Provider.of<PrimaryScreenState>(context, listen: false);
                            appBar.setPrimaryState(false);
                            final pageState =
                            Provider.of<SecondaryPage>(context, listen: false);
                            pageState.setSecondaryPage(4);
                            //Navigator.pop(context);
                          }
                          if(cdm.title=="Sharee"){
                            print(cdm.title);

                            final catName=Provider.of<SubCategoriesController>(context,listen: false,);
                            catName.setSubCategory(cdm.title.toString(),);

                            final appBar =
                            Provider.of<PrimaryScreenState>(context, listen: false);
                            appBar.setPrimaryState(false);

                            final pageState =
                            Provider.of<SecondaryPage>(context, listen: false);
                            pageState.setSecondaryPage(4);
                            //Navigator.pop(context);
                          }
                        });
                      },
                      //leading: Icon(cdm.icon, color: Colors.black),
                      title: Txt(
                        text: cdm.title,
                        color: Colors.black,
                      ),
                      trailing: cdm.submenus!.isEmpty
                          ? null
                          : Icon(
                        selected
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: Colors.black,
                      ),
                      children: cdm.submenus!.map((subMenu){
                        return subMenuButton(subMenu,false);
                      }
                      ).toList(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ):Container(),
      // Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      //   child: Txt(
      //     text: subMenu,
      //     fontSize: isTitle ? 17 : 14,
      //     color: isTitle ? Colors.white : Colors.grey,
      //     fontWeight: FontWeight.bold,
      //   ),
      // ),
    );
  }

  Widget accountButton({bool usePadding = true}) {
    return Padding(
      padding: EdgeInsets.all(usePadding ? 8 : 0),
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: Colors.white70,
          image: DecorationImage(
            image: NetworkImage(Urls.avatar2),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }

  Widget accountTile() {
    return Container(
      color: Colorz.complexDrawerBlueGrey,
      child: ListTile(
        leading: accountButton(usePadding: false),
        title: Txt(
          text: "Prem Shanhi",
          color: Colors.white,
        ),
        subtitle: Txt(
          text: "Web Designer",
          color: Colors.white70,
        ),
      ),
    );
  }

  static List<CDM> cdms = [
    // CDM(Icons.grid_view, "Control", []),
    // CDM(Icons.grid_view, "Dashboard", []),
    CDM(
      icon: Icons.male_outlined,
      title: "Men",
      submenus: [
        "Top Wear",
        "T-Shirt",
        "Shirt",
        "Polo T-Shirt",
        "Fatua",
        "Pant",
        "Panjabi",
        "Jacket & Hoodie",
        "Blazer",
        "Shoe",
        "Watch",
        "Jeans",
      ],
    ),

    CDM(
      icon: Icons.female_outlined,
      title: "Women",
      submenus: [
        "Salwar Kameez",
        "Sharee",
      ],
    ),
    CDM(
      icon: Icons.child_care_outlined,
      title: "Kids",
      submenus: [],
    ),
    CDM(
      icon: FontAwesomeIcons.solidGem,
      title: "Jewellery",
      submenus: [],
    ),
    CDM(
      icon: FontAwesomeIcons.snowflake,
      title: "Winter Collection",
      submenus: ["Ad Blocker", "Everything Https", "Dark Mode"],
    ),
    CDM(
      icon: Icons.star_border_sharp,
      title: "Popular",
      submenus: [],
    ),
    CDM(
      icon: Icons.bolt_outlined,
      title: "Flash Sales",
      submenus: [],
    ),
    CDM(
      icon: FontAwesomeIcons.pepperHot,
      title: "Accessories",
      submenus: [],
    ),
    CDM(
      icon: FontAwesomeIcons.bandAid,
      title: "Brand",
      submenus: [],
    ),
  ];
  static List<CDM> subMenuTshirt = [
    CDM(
      title: "Full-Sleeve T-Shirt",
      submenus: [
        "product1",
        "product1",
      ],
    ),
    CDM(
      title: "Half-Sleeve T-Shirt",
      submenus: [
        "product1",
        "product1",
      ],
    ),
  ];
  static List<CDM> subMenuWomen = [
    CDM(
      title: "Salwar Kameez",
      submenus: [
        "Long Kameez",
      ],
    ),
    CDM(
      title: "Sharee",
      submenus: [
        "katan Sharee",
      ],
    ),
  ];

  void expandOrShrinkDrawer() {
    setState(
      () {
        isExpanded = !isExpanded;
      },
    );
  }
}
