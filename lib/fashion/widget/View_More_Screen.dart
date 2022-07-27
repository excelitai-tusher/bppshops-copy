

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class View_More extends StatefulWidget {
  const View_More({Key? key}) : super(key: key);
  @override
  _View_MoreState createState() => _View_MoreState();
}
class _View_MoreState extends State<View_More> {
  List _loadedPhotos = [];

  _fetchData() async {
    const API_URL = 'https://jsonplaceholder.typicode.com/photos';
    final response = await http.get(Uri.parse(API_URL));
    final data = json.decode(response.body);
    print(response.body);
    setState(() {
      _loadedPhotos = data;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Color(0xFFE37D4E),
        title: Center(
          child: Text(
            "Fashion",
            style: TextStyle(color: Colors.white),
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: FutureBuilder(
          future:_fetchData() ,
          builder: (BuildContext context, AsyncSnapshot snapsho){
            return  GridView.builder(
              itemCount: _loadedPhotos.length ,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 2.5,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 10),
              itemBuilder: (BuildContext context,int index){
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Theme.of(context).primaryColor)),
                  child: GridTile(child:
                  GridTileBar(
                    subtitle: Column(
                      children: [
                        Container(
                            height: 100,
                            child:Image.network("https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg")
                          //   _loadedPhotos [index]['thumbnailUrl']!= null
                          //       ? Image.network(
                          //     'https://jsonplaceholder.typicode.com/${_loadedPhotos[index].productThambnail}',
                          //     fit: BoxFit.cover,
                          //   )
                          //       : Image.network(
                          //       'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg'),
                          //
                        ),
                        Center(
                          child: Column(
                            children: [
                              Text(
                                _loadedPhotos[index]['title'],
                                style: TextStyle(
                                    color: Colors.grey),
                              ),
                              Text(
                                _loadedPhotos[index]['title'],
                                style: TextStyle(
                                    color: Colors.grey),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('৳ 2,000.0',
                                      // '${double.tryParse([index].sellingPrice!)?.toStringAsFixed(1)}',
                                  style: TextStyle(color: Colors.green),),
                                  Text(
                                    '৳ 2,500.0',
                                        // '${double.tryParse([index].discountPrice!)?.toStringAsFixed(1)}',
                                    style: TextStyle(color: Colors.red,decoration: TextDecoration.lineThrough,overflow:TextOverflow.ellipsis),
                                  ),

                                ],
                              ),

                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFFE37D4E),
                                  minimumSize: Size(90, 30),
                                ),
                                onPressed: () {},
                                child: Text("hello",
                                  style: TextStyle(color: Colors.white),),)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),),
                  // color: Colors.orange,
                  // alignment: Alignment.center,
                  // child: Text("${list[index]}"),
                );
              },
            );  },
        ),
      ),
    );
  }
}







