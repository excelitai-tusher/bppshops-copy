
import 'package:bpp_shop/view/bpp/order/order_bottom_sheet.dart';
import 'package:bpp_shop/view/bpp/order/shipping%20address.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:time_range/time_range.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  DateTime? _selectDate;

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate:DateTime(2023,DateTime.now().day+5),)
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectDate = pickedDate;
      });
    });
  }

  static const orange = Color(0xFFFE9A75);
  static const dark = Color(0xFF333A47);
  static const double leftPadding = 50;

  final _defaultTimeRange = TimeRangeResult(
    TimeOfDay(hour: 14, minute: 50),
    TimeOfDay(hour: 15, minute: 20),
  );
  TimeRangeResult? _timeRange;

  @override
  void initState() {
    super.initState();
    //_timeRange = _defaultTimeRange;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(
          'CheckOut',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shipping to',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            SizedBox(height: 20,),
            CheckOutCard('check'),
            SizedBox(height: 10,),
            CheckOutCard(' '),
            SizedBox(height: 10,),
            TextButton(
              onPressed: () {},
              child: Text(
                'Add New Address',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30,bottom: 20),
              child: Text(
                'Preferd Delivary time',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
            ),
            Row(
              children: [
                Card(
                  color: Color(0xFFfff2df),
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Date',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Row(
                          children: [
                            Container(
                              child: Text(
                                _selectDate == null
                                    ? 'Choose date'
                                    : ' ${DateFormat.MMMEd().format(_selectDate!)}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            IconButton(
                              onPressed: _presentDatePicker,
                              icon: Icon(Icons.arrow_drop_down),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Color(0xFFfff2df),
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Time',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Row(
                          children: [
                            Text(_timeRange == null
                                ? 'Choose Time'
                                : ' ${_timeRange!.start.format(context)} - ${_timeRange!.end.format(context)}'),
                            IconButton(
                              onPressed: () {
                                showModalBottomSheet<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      color: Colors.white,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 20),
                                      height:
                                          MediaQuery.of(context).size.height /
                                              4,
                                      child: TimeRange(
                                        fromTitle: Text(
                                          'FROM',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: dark,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        toTitle: Text(
                                          'TO',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: dark,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        titlePadding: leftPadding,
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: dark,
                                        ),
                                        activeTextStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                        borderColor: dark,
                                        activeBorderColor: dark,
                                       backgroundColor: Colors.transparent,
                                        activeBackgroundColor: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        firstTime:
                                            TimeOfDay(hour: 8, minute: 00),
                                        lastTime:
                                            TimeOfDay(hour: 22, minute: 00),
                                        initialRange: _timeRange,
                                        timeStep: 10,
                                        timeBlock: 30,
                                        onRangeCompleted: (range) =>
                                            setState(() => _timeRange = range),
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: Icon(Icons.arrow_drop_down),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
        SizedBox(height: 30,),
        Center(
          child: ElevatedButton(onPressed: (){

            showModalBottomSheet<void>(
                // isDismissible: false,
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {

              return OrderBottomSheet();
            },
            );
          },
              child: Text('Complete Order',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),)),
        )
          ],
        ),
      ),

        // floatingActionButton:   Consumer<Cart>(
        //   builder: (_, cart, ch) => Badge(
        //     value: cart.itemCount.toString(),
        //     child: ch,
        //   ),
        //   child: FloatingActionButton(
        //
        //     backgroundColor: Theme.of(context).colorScheme.primary,
        //     onPressed: (){
        //       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CartScreen()));
        //     },
        //     child: Icon(Icons.shopping_bag_sharp,color: Colors.white,),
        //
        //
        //   ),
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // bottomNavigationBar: BottomAppBar(
        //   shape: CircularNotchedRectangle(),
        //   notchMargin: 6,
        //   child: Container(
        //     height: 60,
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: <Widget>[
        //         Row(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: <Widget>[
        //             MaterialButton(
        //               minWidth: 40,
        //               onPressed: () {
        //                 setState(() {
        //                   // currentScreen =
        //                   //     Home_Page(); // if user taps on this dashboard tab will be active
        //                   // currentTab = 0;
        //                   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Bottom_NavBar(currentTab: 0,currentScreen: Home_Page(),)), (route) => false);
        //                   //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottom_NavBar(currentTab: 0,currentScreen: Home_Page(),)));
        //                 });
        //               },
        //               child: Column(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: <Widget>[
        //                   Icon(
        //                     Icons.home,
        //                     color: Colors.grey,//currentTab == 0 ? Colors.amber,//: Colors.grey,
        //                   ),
        //                   Text(
        //                     'Home',
        //                     style: TextStyle(
        //                       color: Colors.grey,//currentTab == 0 ? Colors.amber : Colors.grey,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //             // Home_Page(),
        //             // MyWishList(),
        //             // HistoryTabbar(),
        //             // ProfileScreen(),
        //             // PopularProduct(),
        //             MaterialButton(
        //               minWidth: 40,
        //               onPressed: () {
        //                 setState(() {
        //                   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Bottom_NavBar(currentTab: 1,currentScreen: MyWishList(),)), (route) => false);
        //                   // Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottom_NavBar(currentTab: 1,currentScreen: MyWishList(),)));
        //                   // currentScreen =
        //                   //     MyWishList(); // if user taps on this dashboard tab will be active
        //                   // currentTab = 1;
        //                 });
        //               },
        //               child: Column(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: <Widget>[
        //                   Icon(
        //                     Icons.favorite_border_outlined,
        //                     color: Colors.grey,//currentTab == 1 ? Colors.amber : Colors.grey,
        //                   ),
        //                   Text(
        //                     'Favorite',
        //                     style: TextStyle(
        //                       color: Colors.grey,//,currentTab == 1 ? Colors.amber: Colors.grey,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             )
        //           ],
        //         ),
        //
        //         // Right Tab bar icons
        //
        //         Row(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: <Widget>[
        //             MaterialButton(
        //               minWidth: 40,
        //               onPressed: () {
        //                 setState(() {
        //                   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Bottom_NavBar(currentTab: 2,currentScreen: HistoryTabbar(),)), (route) => false);
        //                   //Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottom_NavBar(currentTab: 2,currentScreen: HistoryTabbar(),)));
        //                   // currentScreen =
        //                   //     HistoryTabbar(); // if user taps on this dashboard tab will be active
        //                   // currentTab = 2;
        //                 });
        //               },
        //               child: Column(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: <Widget>[
        //                   Icon(
        //                     Icons.dashboard_outlined,
        //                     color: Colors.grey,//currentTab == 2 ? Colors.amber: Colors.grey,
        //                   ),
        //                   Text(
        //                     'History',
        //                     style: TextStyle(
        //                       color: Colors.amber,//,currentTab == 2 ? Colors.amber : Colors.grey,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //             MaterialButton(
        //               minWidth: 40,
        //               onPressed: () {
        //                 setState(() {
        //                   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Bottom_NavBar(currentTab: 3,currentScreen: IslamicProfileScreen(),)), (route) => false);
        //                   //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottom_NavBar(currentTab: 3,currentScreen: ProfileScreen(),)));
        //                   // currentScreen =
        //                   //     ProfileScreen(); // if user taps on this dashboard tab will be active
        //                   // currentTab = 3;
        //                 });
        //               },
        //               child: Column(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: <Widget>[
        //                   Icon(
        //                     Icons.account_circle,
        //                     color: Colors.grey,//currentTab == 3 ? Colors.amber : Colors.grey,
        //                   ),
        //                   Text(
        //                     'Profile',
        //                     style: TextStyle(
        //                       color: Colors.grey,//currentTab == 3 ? Colors.amber: Colors.grey,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             )
        //           ],
        //         )
        //
        //       ],
        //     ),
        //   ),
        // )
    );
  }
}
