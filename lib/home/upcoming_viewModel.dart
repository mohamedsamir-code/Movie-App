import 'package:flutter/material.dart';
import 'package:movie_app/api_manager.dart';
import 'package:movie_app/model/PopularResponse.dart';

class UpcomingViewModel extends ChangeNotifier{
  List<Results>? upcomingMovies;

  void getUpcoming() async{
    try{
      var response =await ApiManager.getUpComing();
      upcomingMovies = response.results;
    }catch(e){
      throw(e);
    }
    notifyListeners();
  }
}