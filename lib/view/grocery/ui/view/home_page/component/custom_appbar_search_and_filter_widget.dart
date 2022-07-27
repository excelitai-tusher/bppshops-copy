// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../../constant/app_colors.dart';
//
// class CustomAppBarSearchAndFilterWidget extends StatefulWidget {
//   const CustomAppBarSearchAndFilterWidget({Key? key}) : super(key: key);
//
//   @override
//   _CustomAppBarSearchAndFilterWidgetState createState() =>
//       _CustomAppBarSearchAndFilterWidgetState();
// }
//
// class _CustomAppBarSearchAndFilterWidgetState
//     extends State<CustomAppBarSearchAndFilterWidget>{
//
//   @override
//   Widget build(BuildContext context){
//
//     final customScafoldKey = Provider.of<CustomScafoldKey>(context);
//     return Column(
//       children: [
//         //SizedBox(height: 20,),
//         SizedBox(
//           height: 60,
//           width: MediaQuery.of(context).size.width,
//           child: Stack(
//             fit: StackFit.expand,
//             children: [
//
//               ListTile(
//                 leading: GestureDetector(
//                   onTap: () {
// // <<<<<<< HEAD
// //                       customScafoldKey.scaffoldKey.currentState!.openDrawer();
// //                     },
// //                     child: SizedBox(
// //                       height: 40,
// //                       width: 40,
// //                       child: Image.asset("images/hamburger_menu.png"),
// // =======
//                     final customScafoldKey =
//                     Provider.of<CustomScafoldKey>(context, listen: false);
//                     customScafoldKey.scaffoldKey.currentState!.openDrawer();
//                   },
//                   child: SizedBox(
//                     height: 50,
//                     width: 50,
//                     child: Icon(Icons.menu),
//                   ),
//                 ),
//                 title:  Text('Grocery',textAlign: TextAlign.center, style: TextStyle(
//                   color: Colors.green,
//
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),),
//                 trailing:  SizedBox(
//                   height: 50,
//                   width: 50,
//                   //child:Container(),
//                 ),
//               ),
//
//             ],
//           ),
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         Padding(
//           padding: const EdgeInsets.all(0.0),
//           child: Row(
//             children: [
//               Expanded(
//                 flex: 9,
//                 child: Padding(
//                   padding: const EdgeInsets.only(right: 8.0),
//                   child: TextFormField(
//                     textAlign: TextAlign.start,
//                     // controller: searchCtrl,
//                     keyboardType: TextInputType.text,
//                     decoration: InputDecoration(
//                       prefixIcon: GestureDetector(
//                         onTap: () {
//                           final pageState = Provider.of<AppStateController>(
//                               context,
//                               listen: false);
//                           pageState.setAppBarViewState(false);
//                           pageState.setSecondaryPageState(true);
//                           pageState.setSecondaryCurrentIndex(3);
//                         },
//                         child: Icon(
//                           Icons.search,
//                         ),
//
//                       ),
//                       hintText: 'Search Products',
//                       hintStyle: TextStyle(fontSize: 16),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30),
//                         borderSide: BorderSide(
//                           width: 0,
//                           style: BorderStyle.none,
//                         ),
//                       ),
//                       filled: true,
//                       contentPadding: EdgeInsets.only(top: 8, bottom: 8),
//                       fillColor:
//                           tertiaryColor1, //Color(0xff3DC73C),//tertiaryColor1,
//                     ),
//                   ),
//                 ),
//               ),
//               // Expanded(
//               //   flex: 1,
//               //   child: GestureDetector(
//               //     onTap: () {
//               //       //Search1 filter=Search1();
//               //       // final pageState=Provider.of<AppStateController>(context,listen: false);
//               //       // pageState.setAppBarViewState(false);
//               //       // pageState.setSecondaryPageState(true);
//               //       // pageState.setSecondaryCurrentIndex(3);
//               //     },
//               //     child: SizedBox(
//               //       height: 20,
//               //       width: 20,
//               //       child: Image.asset(
//               //         "images/filter1.png",
//               //       ), //filter1.png
//               //     ),
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   void onButtonPressed() {
//     showModalBottomSheet(
//         context: context,
//         builder: (context) {
//           return DraggableScrollableSheet(
//             initialChildSize: 1, //set this as you want
//             //maxChildSize: 1, //set this as you want
//             //minChildSize: 0.5, //set this as you want
//             expand: true,
//             builder: (BuildContext context, ScrollController scrollController) {
//               return Scaffold(
//                 backgroundColor: Colors.white,
//                 appBar: AppBar(
//                   elevation: 0,
//                   backgroundColor: Colors.white,
//                   leading: InkWell(
//                       onTap: () {},
//                       child: Icon(Icons.cancel, size: 30, color: Colors.black)),
//                   title: Center(
//                     child: Text(
//                       "Filter",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 20,
//                       ),
//                     ),
//                   ),
//                   actions: [
//                     Padding(
//                       padding: const EdgeInsets.only(top: 20, right: 20),
//                       child: Text(
//                         "Reset",
//                         style: TextStyle(
//                           color: Colors.green,
//                           fontSize: 10,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 body: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 50, right: 20),
//                             child: Row(
//                               //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 SizedBox(
//                                   width: 280,
//                                   height: 40,
//                                   child: ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                       primary: Colors.white,
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(2.0),
//                                       ),
//                                     ),
//                                     onPressed: () {
//                                       //Navigator.push(context, MaterialPageRoute(builder: (context) =>MapSample()));
//                                     },
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Text(
//                                           "Sort By",
//                                           style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 15,
//                                             fontFamily: 'Roboto-Regular.ttf',
//                                           ),
//                                         ),
//                                         Row(
//                                           children: [
//                                             Text(
//                                               "Popularity",
//                                               style: TextStyle(
//                                                 color: Colors.grey,
//                                                 fontSize: 15,
//                                               ),
//                                             ),
//                                             Icon(
//                                               Icons.keyboard_arrow_down_sharp,
//                                               size: 35,
//                                               color: Colors.grey,
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 15),
//                             child: Text(
//                               "Price Range",
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black,
//                                 fontSize: 15,
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 8,
//                           ),
//                           Image(
//                             image: AssetImage("images/Price Range.png"),
//                           ),
//                           SizedBox(
//                             height: 8,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 10),
//                             child: Text(
//                               "Categoties",
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black,
//                                 fontSize: 15,
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 10, right: 15),
//                             child: Row(
//                               children: [
//                                 SizedBox(
//                                   width: 50,
//                                   height: 25,
//                                   child: ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                       primary: Colors.green,
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(8.0),
//                                       ),
//                                     ),
//                                     onPressed: () {},
//                                     child: Text(
//                                       "All",
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 15,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(width: 5),
//                                 SizedBox(
//                                   width: 65,
//                                   height: 25,
//                                   child: ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                       primary: Colors.limeAccent,
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(8.0),
//                                       ),
//                                     ),
//                                     onPressed: () {},
//                                     child: Text(
//                                       "Fruits",
//                                       style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 12,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 5,
//                                 ),
//                                 SizedBox(
//                                   width: 100,
//                                   height: 25,
//                                   child: ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                       primary: Colors.limeAccent,
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(8.0),
//                                       ),
//                                     ),
//                                     onPressed: () {},
//                                     child: Text(
//                                       "Vegetables",
//                                       style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 12,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(width: 5),
//                                 SizedBox(
//                                   width: 65,
//                                   height: 25,
//                                   child: ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                       primary: Colors.limeAccent,
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(8.0),
//                                       ),
//                                     ),
//                                     onPressed: () {},
//                                     child: Text(
//                                       "Dairy",
//                                       style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 12,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(width: 5),
//                                 SizedBox(
//                                   width: 65,
//                                   height: 25,
//                                   child: ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                       primary: Colors.limeAccent,
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(8.0),
//                                       ),
//                                     ),
//                                     onPressed: () {},
//                                     child: Text(
//                                       "Meat",
//                                       style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 10,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Column(
//                             children: [
//                               Row(
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                         left: 10, right: 10),
//                                     child: Row(
//                                       children: [
//                                         SizedBox(
//                                           width: 70,
//                                           height: 25,
//                                           child: ElevatedButton(
//                                             style: ElevatedButton.styleFrom(
//                                               primary: Colors.limeAccent,
//                                               shape: RoundedRectangleBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(8.0),
//                                               ),
//                                             ),
//                                             onPressed: () {},
//                                             child: Text(
//                                               "Fishes",
//                                               style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 12,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         SizedBox(width: 3),
//                                         SizedBox(
//                                           width: 63,
//                                           height: 25,
//                                           child: ElevatedButton(
//                                             style: ElevatedButton.styleFrom(
//                                               primary: Colors.limeAccent,
//                                               shape: RoundedRectangleBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(8.0),
//                                               ),
//                                             ),
//                                             onPressed: () {},
//                                             child: Text(
//                                               "Drink",
//                                               style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 12,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           width: 5,
//                                         ),
//                                         SizedBox(
//                                           width: 80,
//                                           height: 25,
//                                           child: ElevatedButton(
//                                             style: ElevatedButton.styleFrom(
//                                               primary: Colors.limeAccent,
//                                               shape: RoundedRectangleBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(8.0),
//                                               ),
//                                             ),
//                                             onPressed: () {},
//                                             child: Text(
//                                               "Snacks",
//                                               style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 12,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         SizedBox(width: 4),
//                                         SizedBox(
//                                           width: 70,
//                                           height: 25,
//                                           child: ElevatedButton(
//                                             style: ElevatedButton.styleFrom(
//                                               primary: Colors.limeAccent,
//                                               shape: RoundedRectangleBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(8.0),
//                                               ),
//                                             ),
//                                             onPressed: () {},
//                                             child: Text(
//                                               "Beauty",
//                                               style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 12,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         SizedBox(width: 3),
//                                         SizedBox(
//                                           width: 73,
//                                           height: 25,
//                                           child: ElevatedButton(
//                                             style: ElevatedButton.styleFrom(
//                                               primary: Colors.limeAccent,
//                                               shape: RoundedRectangleBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(8.0),
//                                               ),
//                                             ),
//                                             onPressed: () {},
//                                             child: Text(
//                                               "Cleaning",
//                                               style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 10,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 10, right: 10),
//                             child: Column(
//                               children: [
//                                 Row(
//                                   children: [
//                                     SizedBox(
//                                       width: 100,
//                                       height: 25,
//                                       child: ElevatedButton(
//                                         style: ElevatedButton.styleFrom(
//                                           primary: Colors.limeAccent,
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(8.0),
//                                           ),
//                                         ),
//                                         onPressed: () {},
//                                         child: Text(
//                                           "Frozen Food",
//                                           style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 12,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(width: 5),
//                                     SizedBox(
//                                       width: 80,
//                                       height: 25,
//                                       child: ElevatedButton(
//                                         style: ElevatedButton.styleFrom(
//                                           primary: Colors.limeAccent,
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(8.0),
//                                           ),
//                                         ),
//                                         onPressed: () {},
//                                         child: Text(
//                                           "Dry Druits",
//                                           style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 10,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(width: 5),
//                                     SizedBox(
//                                       width: 80,
//                                       height: 25,
//                                       child: ElevatedButton(
//                                         style: ElevatedButton.styleFrom(
//                                           primary: Colors.limeAccent,
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(8.0),
//                                           ),
//                                         ),
//                                         onPressed: () {},
//                                         child: Text(
//                                           "Stationary",
//                                           style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 10,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 10),
//                             child: Text(
//                               "Brands",
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black,
//                                 fontSize: 15,
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 10, right: 15),
//                             child: Column(
//                               children: [
//                                 Row(
//                                   children: [
//                                     SizedBox(
//                                       width: 55,
//                                       height: 25,
//                                       child: ElevatedButton(
//                                         style: ElevatedButton.styleFrom(
//                                           primary: Colors.limeAccent,
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(8.0),
//                                           ),
//                                         ),
//                                         onPressed: () {},
//                                         child: Text(
//                                           "Any",
//                                           style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 12,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(width: 5),
//                                     SizedBox(
//                                       width: 65,
//                                       height: 25,
//                                       child: ElevatedButton(
//                                         style: ElevatedButton.styleFrom(
//                                           primary: Colors.limeAccent,
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(8.0),
//                                           ),
//                                         ),
//                                         onPressed: () {},
//                                         child: Text(
//                                           "Square",
//                                           style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 10,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(width: 5),
//                                     SizedBox(
//                                       width: 90,
//                                       height: 25,
//                                       child: ElevatedButton(
//                                         style: ElevatedButton.styleFrom(
//                                           primary: Colors.limeAccent,
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(8.0),
//                                           ),
//                                         ),
//                                         onPressed: () {},
//                                         child: Text(
//                                           "Bosundhara",
//                                           style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 10,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(width: 5),
//                                     SizedBox(
//                                       width: 65,
//                                       height: 25,
//                                       child: ElevatedButton(
//                                         style: ElevatedButton.styleFrom(
//                                           primary: Colors.limeAccent,
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(8.0),
//                                           ),
//                                         ),
//                                         onPressed: () {},
//                                         child: Text(
//                                           "Nestle",
//                                           style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 10,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(width: 5),
//                                     SizedBox(
//                                       width: 70,
//                                       height: 25,
//                                       child: ElevatedButton(
//                                         style: ElevatedButton.styleFrom(
//                                           primary: Colors.limeAccent,
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(8.0),
//                                           ),
//                                         ),
//                                         onPressed: () {},
//                                         child: Text(
//                                           "Unilever",
//                                           style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 10,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 10, right: 10),
//                             child: Column(
//                               children: [
//                                 Row(
//                                   children: [
//                                     SizedBox(
//                                       width: 80,
//                                       height: 25,
//                                       child: ElevatedButton(
//                                         style: ElevatedButton.styleFrom(
//                                           primary: Colors.limeAccent,
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(8.0),
//                                           ),
//                                         ),
//                                         onPressed: () {},
//                                         child: Text(
//                                           "Radhuni",
//                                           style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 12,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(width: 5),
//                                     SizedBox(
//                                       width: 120,
//                                       height: 25,
//                                       child: ElevatedButton(
//                                         style: ElevatedButton.styleFrom(
//                                           primary: Colors.limeAccent,
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(8.0),
//                                           ),
//                                         ),
//                                         onPressed: () {},
//                                         child: Text(
//                                           "Bombay sweets",
//                                           style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 10,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(width: 5),
//                                     SizedBox(
//                                       width: 90,
//                                       height: 25,
//                                       child: ElevatedButton(
//                                         style: ElevatedButton.styleFrom(
//                                           primary: Colors.limeAccent,
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(8.0),
//                                           ),
//                                         ),
//                                         onPressed: () {},
//                                         child: Text(
//                                           "ACI Limited",
//                                           style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 10,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(width: 5),
//                                     SizedBox(
//                                       width: 65,
//                                       height: 25,
//                                       child: ElevatedButton(
//                                         style: ElevatedButton.styleFrom(
//                                           primary: Colors.limeAccent,
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(8.0),
//                                           ),
//                                         ),
//                                         onPressed: () {},
//                                         child: Text(
//                                           "see all",
//                                           style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 10,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 15,
//                                 ),
//                                 SizedBox(
//                                   height: 35,
//                                   width: 250,
//                                   child: ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                       primary: Colors.lightGreen,
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(8.0),
//                                       ),
//                                     ),
//                                     onPressed: () {
//                                       //Navigator.push(context, MaterialPageRoute(builder: (context) =>Cards()));
//                                     },
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Row(
//                                           children: [
//                                             Text(
//                                               "Apply Filter",
//                                               style: TextStyle(
//                                                 color: Colors.white,
//                                                 //fontWeight: FontWeight.bold,
//                                                 fontSize: 20,
//                                               ),
//                                             ),
//                                           ],
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ]);
//                   },
//                 ),
//               );
//             },
//           );
//         });
//   }
// }
