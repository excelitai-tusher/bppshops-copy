import 'package:flutter/material.dart';

import '../Api_Service/top_rated_service.dart';
import '../model/Fashion_Model/topRated_model.dart';

class TopRatedProvider extends ChangeNotifier{
  List<TopRated>getTopRatedList=[];
  getRatedProvider()async{
    final data= await TopRated_Service().getTopRatedList_Service();
    getTopRatedList=data.topRated!;
    print("TopRated Product:${getTopRatedList.length}");
    notifyListeners();
  }
}