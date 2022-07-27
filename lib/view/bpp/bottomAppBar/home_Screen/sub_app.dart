import 'package:bpp_shop/models/bpp/app_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class SubApps extends StatefulWidget {
  String?up;

  //const ProductOffer({Key? key}) : super(key: key);
  SubApps({this.up,});

  @override
  State<SubApps> createState() => _SubAppsState();
}

class _SubAppsState extends State<SubApps> {
  @override
  Widget build(BuildContext context) {
    final subapp = Provider.of<Apps>(context, listen: false);
    return GestureDetector(
      onTap:subapp.subApps!= null?(){
        Navigator.of(context).push(MaterialPageRoute(builder:(context)=> subapp.subApps!));
      }:null,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.grey)),
        child: GridTile(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child:Container(
                    margin: EdgeInsets.only(right: 8),
                    alignment: Alignment.topRight,
                    child:subapp.upcoming),
              ),

             Expanded(
               flex: 6,
                //  height: 110,
                  child: Center(
                    child: Image.asset(
                      '${subapp.image}',
                      fit: BoxFit.cover,
                    ),
                  )),
              Expanded(
                flex: 2,
                child: Text(
                  '${subapp.title}',overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}