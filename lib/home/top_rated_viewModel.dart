import 'package:flutter/material.dart';
import 'package:movie_app/api_manager.dart';
import '../model/PopularResponse.dart';

class TopRatedViewModel extends ChangeNotifier{
  List<Results>? topRatedMovies;
  String? errorMsg;

   void getTopRated() async{
    try{
      var response = await ApiManager.getTopRated();
      if(response.success == false){
        errorMsg = response.status_message;
      }else {
        topRatedMovies = response.results;
      }
    }catch(e){
      throw(e);
    }
    notifyListeners();
  }

}