import 'package:flutter/material.dart';

import '../../models/islamic/most_popular.dart';
import '../Api_Service/popular_product_service.dart';

class PropularProvider extends ChangeNotifier{
  List<MostPopularAll> getPopularList =[];
  getPropularProvider ()async{
 final data= await PopularProductservice().getPopularProduct();
 getPopularList=data.mostPopularAll!.cast<MostPopularAll>();

 print("TopRated Product:${getPopularList.length}");
 notifyListeners();

  }
}