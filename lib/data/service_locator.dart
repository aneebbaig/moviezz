import 'package:get_it/get_it.dart';
import '/data/repository/fetch_genre_data.dart';

GetIt s1 = GetIt.asNewInstance();

void setUpLocator() {
  s1.registerSingleton<TopMovieRepo>(TopMovieRepo());
  s1.registerSingleton<TopTrendingMovies>(TopTrendingMovies());
}
