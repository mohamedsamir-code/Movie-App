import 'package:flutter/material.dart';
import 'package:movie_app/api_manager.dart';
import '../model/PopularResponse.dart';

class SearchViewModel extends ChangeNotifier {
  List<Results>? searchedMovies;
 String? errorMsg;
  void searchMovie(String keyword) async {

    try {
      var response = await ApiManager.searchMovies(keyword);
      searchedMovies = response.results;
      print(searchedMovies);
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }
}
