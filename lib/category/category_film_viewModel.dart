import 'package:flutter/material.dart';
import 'package:movie_app/api_manager.dart';
import '../model/PopularResponse.dart';

class CategoryFilmsViewModel extends ChangeNotifier {
  List<Results>? results;
  String? errorMsg;
  Future<void> getMoviesByGenres(String genreID) async {
    try {
      var response = await ApiManager.getMoviesByGenres(genreID);
      if (response.success == false) {
        errorMsg = response.status_message;
      } else {
        results = response.results;
      }
    }catch (e) {
      rethrow;
    }
    notifyListeners();
  }
}
