import 'package:flutter/material.dart';
class FiltersScreen extends StatelessWidget {
  const FiltersScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0), // here the desired height
          child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            centerTitle: true,
            leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black,
            onPressed: () {  },

            ),
            title: Container(
              width: 90,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(20),color: Colors.white,

              ),
              child: Center(child: Text('Filter',style: TextStyle(color: Colors.black),)),

            ),
       ),


        ),

        ),
      body: Container(
        height: 150,
        width: 200,
        child: Row(

        ),

      ),

     );
  }
}