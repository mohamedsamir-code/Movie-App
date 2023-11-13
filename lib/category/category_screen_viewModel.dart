import 'package:flutter/material.dart';
import 'package:movie_app/api_manager.dart';
import '../model/GenresResponse.dart';

class CategoryScreenViewModel extends ChangeNotifier{
  List<Genres>? genresList;

  Future<void> getGenres() async {
    try{
      var response = await ApiManager.getGenres();
      genresList = response.genres;

    }catch(e){
      rethrow;
    }
    notifyListeners();
  }
}