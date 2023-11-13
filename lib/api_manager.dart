import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/model/MovieDetails.dart';
import 'model/GenresResponse.dart';
import 'model/PopularResponse.dart';

class ApiManager {
  static const String baseUrl = 'api.themoviedb.org';

  static Future<PopularResponse> getPopular() async{
    var url = Uri.https(baseUrl,'/3/movie/popular',{
      'api_key' : '8f044e31d234a670d1e7006f6eed2a20',
    });
    try {
      var response = await http.get(url);
      var stringBody = response.body;
      var json = jsonDecode(stringBody);
      var popularResponse = PopularResponse.fromJson(json);
      return popularResponse;
    }catch(e){
      throw(e);
    }

  }

  static Future<PopularResponse> getTopRated() async{
    var url = Uri.https(baseUrl,'/3/movie/top_rated',{
      'api_key' : '8f044e31d234a670d1e7006f6eed2a20',
    });
    try {
      var response = await http.get(url);
      var stringBody = response.body;
      var json = jsonDecode(stringBody);
      var popularResponse = PopularResponse.fromJson(json);
      return popularResponse;
    }catch(e){
      throw(e);
    }

  }

  static Future<PopularResponse> getUpComing() async{
    var url = Uri.https(baseUrl,'/3/movie/upcoming',{
      'api_key' : '8f044e31d234a670d1e7006f6eed2a20',
    });
    try {
      var response = await http.get(url);
      var stringBody = response.body;
      var json = jsonDecode(stringBody);
      var popularResponse = PopularResponse.fromJson(json);
      return popularResponse;
    }catch(e){
      throw(e);
    }

  }

  static Future<PopularResponse> searchMovies(String keyword) async{
    var url = Uri.https(baseUrl,'/3/search/movie',{
      'api_key' : '8f044e31d234a670d1e7006f6eed2a20',
      'query' : keyword,
      // 'include_adult' : 'true'
    });
    try {
      var response = await http.get(url);
      var stringBody = response.body;
      var json = jsonDecode(stringBody);
      var searchResponse = PopularResponse.fromJson(json);
      return searchResponse;
    }catch(e){
      rethrow;
    }
  }

  static Future<MovieDetails> getMovieDetails(int movieID) async{
    var url = Uri.https(baseUrl,'/3/movie/${movieID}',{
      'api_key' : '8f044e31d234a670d1e7006f6eed2a20',
    });
    try {
      var response = await http.get(url);
      var stringBody = response.body;
      var json = jsonDecode(stringBody);
      var details = MovieDetails.fromJson(json);
      return details;
    }catch(e){
      rethrow;
    }
  }

  static Future<PopularResponse> getSimilar(int movieID) async{
    var url = Uri.https(baseUrl,'/3/movie/${movieID}/similar',{
      'api_key' : '8f044e31d234a670d1e7006f6eed2a20',
    });
    try {
      var response = await http.get(url);
      var stringBody = response.body;
      var json = jsonDecode(stringBody);
      var similarResponse = PopularResponse.fromJson(json);
      return similarResponse;
    }catch(e){
      rethrow;
    }
  }

  static Future<GenresResponse> getGenres() async{
    var url = Uri.https(baseUrl,'3/genre/movie/list',{
      'api_key' : '8f044e31d234a670d1e7006f6eed2a20',
    });
    try {
      var response = await http.get(url);
      var stringBody = response.body;
      var json = jsonDecode(stringBody);
      var genresResponse = GenresResponse.fromJson(json);
      return genresResponse;
    }catch(e){
      rethrow;
    }
  }

  static Future<PopularResponse> getMoviesByGenres(String genreID) async{
    var url = Uri.https(baseUrl,'3/discover/movie',{
      'api_key' : '8f044e31d234a670d1e7006f6eed2a20',
      'with_genres' : genreID
    });
    try {
      var response = await http.get(url);
      var stringBody = response.body;
      var json = jsonDecode(stringBody);
      var moviesByGenre = PopularResponse.fromJson(json);
      return moviesByGenre;
    }catch(e){
      rethrow;
    }
  }



}
