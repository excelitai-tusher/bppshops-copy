import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_model/bpp/app_provider.dart';

class BPPMainPageDrawer extends StatefulWidget {
  const BPPMainPageDrawer({Key? key}) : super(key: key);

  @override
  _BPPMainPageDrawerState createState() => _BPPMainPageDrawerState();
}

class _BPPMainPageDrawerState extends State<BPPMainPageDrawer> {
  @override
  Widget build(BuildContext context) {
    final appsData = Provider.of<BppApps>(context);

    final apps =appsData.items;
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xffE47D4E), width: 2)),
        child: Column(
          children: [
            //buildDrawerHeader(),
             SizedBox(
              height: 30,
              width: double.maxFinite,
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.menu_open,color: Colors.black54,),alignment: Alignment.topRight,),
            ),

            Expanded(
              child: ListView.builder(
              // itemBuilder: (BuildContext context, index) {
                 // BPPDrawerItem drawerList = bppDrawerLists[index];
                  itemCount: apps.length,
                  itemBuilder: (context, index) => ChangeNotifierProvider.value(
                  value: apps[index],
                  child: ListTile(
                    onTap:
                      apps[index].subApps != null ?

                          () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => apps[index].subApps!), (route) => false);
                        // Navigator.of(context).push(MaterialPageRoute(builder: (
                        //     context) => apps[index].subApps!));
                      }
                      : null,


                    title: Text(
                      '${apps[index].title}',
                      style: TextStyle( letterSpacing: .3, fontSize: 15,color: Colors.black54),
                    ),
                    leading:SizedBox(
                        height: 45,
                             width: 45,
                        child: Image.asset('${apps[index].drawerIcon}')),
                    trailing: Icon(Icons.arrow_forward_ios,size: 14,),
                  ),
                  )
              ),
            ),

            //Expanded(child: SizedBox(width: 100,))
          ],
        ),
      ),
    );
  }

  Widget buildDrawerHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20.0, bottom: 20),
      child: Row(
        children: [
          const Text(
            'Offers',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.deepOrangeAccent, width: 2),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: const Center(
              child: Text(
                '25',
                style: TextStyle(fontSize: 18, color: Colors.deepOrangeAccent),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
