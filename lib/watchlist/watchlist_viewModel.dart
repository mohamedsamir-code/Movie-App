import 'package:flutter/material.dart';
import 'package:movie_app/firebase_utils.dart';

import '../model/PopularResponse.dart';

class WatchlistViewModel extends ChangeNotifier {
  List<Results>? movies;

  Future<void> getWatchlistMovies() async {
    try {
      movies = await getAllWatchlistMovies();
      print(movies);
    } catch (e) {
      throw (e);
    }

    notifyListeners();
  }
}
