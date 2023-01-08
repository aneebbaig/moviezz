import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../utils/constants.dart';
import '../model/error.dart';
import '../model/genre/genre_model.dart';
import '../model/top_movies/top_movies_model.dart';

abstract class ITopMovieRepositoryClass{
  Future<TopMoviesModel> getTopMovies(int page);
  Future<Genre> getAllGenres();
}
abstract class ITopTrendingMovies {
  Future<TopMoviesModel> getTrendingMovies(int page);
}

class TopMovieRepo extends ITopMovieRepositoryClass{
  @override
  Future<TopMoviesModel> getTopMovies(int page) async {
    var res = await http.get(
        Uri.parse('$BASE_URL/movie/popular?api_key=$API_KEY&page=$page'));
    if (res.statusCode == 200) {
      return TopMoviesModel.fromJson(jsonDecode(res.body));
    } else {
      throw FetchDataError("Something went wrong!");
    }
  }
  @override
  Future<Genre> getAllGenres() async {
    var res = await http.get(
        Uri.parse('$BASE_URL/genre/movie/list?api_key=$API_KEY'));
    if (res.statusCode == 200) {
      return Genre.fromJson(jsonDecode(res.body));
    } else {
      throw FetchDataError("Something went wrong!");
    }
  }
}

class TopTrendingMovies extends ITopTrendingMovies{
  @override
  Future<TopMoviesModel> getTrendingMovies(int page) async {
    var res = await http.get(
        Uri.parse('$BASE_URL/trending/movie/week?api_key=$API_KEY&page=$page'));
    if (res.statusCode == 200) {
      return TopMoviesModel.fromJson(jsonDecode(res.body));
    } else {
      throw FetchDataError("Something went wrong!");
    }
  }
}
