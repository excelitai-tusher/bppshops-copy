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
  // HotDealsProvider?hotDealsProvider;
  // @override
  // void initState() {
  //   hotDealsProvider= Provider.of<HotDealsProvider>(context,listen: false);
  //   hotDealsProvider!.getHotDealsProvider();
  //   // TODO: implement initState
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
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
       elevation: 00, ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 20,),
              TextField(decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
              ),)
            ],
          ),
        ));
  }
}
