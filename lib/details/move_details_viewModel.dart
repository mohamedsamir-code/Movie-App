import 'package:flutter/material.dart';
import 'package:movie_app/api_manager.dart';
import 'package:movie_app/model/MovieDetails.dart';

import '../model/PopularResponse.dart';

class MovieDetailsViewModel extends ChangeNotifier {
  MovieDetails? movie;
  List<Results>? similarMovies;
  String? errorMsg;

  void getDetails(int movieID) async {
    try {
      var response = await ApiManager.getMovieDetails(movieID);
      if (response.success == false) {
      } else {
        movie = response;
        print(movie);
      }
    } catch (e) {
      throw (e);
    }
    notifyListeners();
  }

  void getSimilar(int movieID) async {
    try {
      var response = await ApiManager.getSimilar(movieID);
      if (response.success == false) {
        errorMsg = response.status_message;
      }
      similarMovies = response.results;
    } catch (e) {
      throw (e);
    }
    notifyListeners();
  }
}