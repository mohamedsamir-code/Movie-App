
import 'package:flutter/material.dart';
import 'package:movie_app/api_manager.dart';
import '../model/PopularResponse.dart';

class PopularScreenViewModel extends ChangeNotifier{

  List<Results>? popularMovies;
  String? errorMsg;

  void getPopular() async{
    try {
      var response = await ApiManager.getPopular();
      if(response.success == false){
        errorMsg = response.status_message;
      }else {
        popularMovies = response.results;
      }
    }
    catch(e){
      throw(e);
    }
    notifyListeners();
  }

}