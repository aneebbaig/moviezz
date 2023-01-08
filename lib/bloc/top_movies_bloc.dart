
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_db_practical/data/model/top_movies/results.dart';

import '../data/model/genre/genre_model.dart';
import '../data/model/genre/genres_list.dart';
import '../data/model/top_movies/top_movies_model.dart';
import '../data/repository/fetch_genre_data.dart';
import '../data/service_locator.dart';

part 'top_movies_event.dart';
part 'top_movies_state.dart';

class TopMoviesBloc extends Bloc<TopMoviesEvent, TopMoviesState> {
  final repo = s1.get<TopMovieRepo>();
  static List<GenresList> allGenreList=[];
  List<GenresList>? genreList=[];
  TopMoviesBloc() : super(TopMoviesState.initial()) {
    on<TopMoviesEvent>((event, emit) async{

      if (event is LoadTopMoviesInfo) {
        try {
          if(event.page==1) {
            emit(state.copyWith(
                movieStatus: MovieStatus.loading
            ));
          }
          
          final TopMoviesModel info = await repo.getTopMovies(event.page);
          emit(state.copyWith(
            movieStatus: MovieStatus.loaded,
            movies: info.results,
            genreList: genreList
          ));
        } catch (e) {
          emit(state.copyWith(movieStatus: MovieStatus.error));
        }
      }

      if(event is LoadAllGenres){
        try {
          final Genre genre = await repo.getAllGenres();
          if (genre.genres!.isNotEmpty) {
            allGenreList.addAll(genre.genres!);
            genreList?.addAll(genre.genres!);
            add(const LoadTopMoviesInfo(page: 1));
          }
        } catch (e) {
          emit(state.copyWith(movieStatus: MovieStatus.error));
        }
      }
    });
  }
}
