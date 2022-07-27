
import 'dart:convert';
import 'package:bpp_shop/fashion/widget/product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class sub_sub_Categories extends StatefulWidget {
  const sub_sub_Categories({Key? key}) : super(key: key);
  @override
  _sub_sub_CategoriesState createState() => _sub_sub_CategoriesState();
}
class _sub_sub_CategoriesState extends State<sub_sub_Categories> {
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
        title: Padding(
          padding: const EdgeInsets.only(left: 80 ,right: 80),
          child: Text(
            "Kameez",
            style: TextStyle(color: Colors.white),
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
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
                return GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder:(context)=>FashionProductPage()));

                  },
                  child: Container(
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
                          Text(
                            _loadedPhotos[index]['title'],
                            style: TextStyle(
                                color: Colors.grey),
                          ),


                        ],
                      ),
                    ),),
                    // color: Colors.orange,
                    // alignment: Alignment.center,
                    // child: Text("${list[index]}"),
                  ),
                );
              },
            );  },
        ),
      ),
    );
  }
}







