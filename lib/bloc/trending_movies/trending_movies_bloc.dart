import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_db_practical/data/service_locator.dart';

import '../../data/model/genre/genres_list.dart';
import '../../data/model/top_movies/results.dart';
import '../../data/model/top_movies/top_movies_model.dart';
import '../../data/repository/fetch_genre_data.dart';
import '../top_movies_bloc.dart';

part 'trending_movies_event.dart';
part 'trending_movies_state.dart';

class TrendingMoviesBloc extends Bloc<TrendingMoviesEvent, TrendingMoviesState> {
  final repo = s1.get<TopTrendingMovies>();
  List<GenresList>? genreList=[];
  TrendingMoviesBloc() : super(TrendingMoviesState.initial()) {

    on<TrendingMoviesEvent>((event, emit) async{
      if (event is LoadTrendingMoviesInfo) {
        try {
          emit(state.copyWith(
              movieStatus: TrendingMovieStatus.loading
          ));

          final TopMoviesModel info = await repo.getTrendingMovies(1);
          emit(state.copyWith(
              movieStatus: TrendingMovieStatus.loaded,
              movies: info.results,
              moviePage: 1,
              genreList: TopMoviesBloc.allGenreList
          ));
        } catch (e) {
          emit(state.copyWith(movieStatus: TrendingMovieStatus.error));
        }
      }
    });
  }
}
