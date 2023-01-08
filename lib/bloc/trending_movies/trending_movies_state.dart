part of 'trending_movies_bloc.dart';

enum TrendingMovieStatus {
  initial,
  loading,
  loaded,
  error,
}

class TrendingMoviesState {
  final int moviePage;
  final TrendingMovieStatus movieStatus;
  final List<Results> movies;
  final List<GenresList> genreList;
  TrendingMoviesState({
    required this.moviePage,
    required this.movieStatus,
    required this.movies,
    required this.genreList,
  });
  factory TrendingMoviesState.initial() => TrendingMoviesState(
    moviePage: 1,
    movieStatus: TrendingMovieStatus.initial,
    movies: [],
    genreList: [],
  );

  TrendingMoviesState copyWith({
    int? moviePage,
    TrendingMovieStatus? movieStatus,
    List<Results>? movies,
    List<GenresList>? genreList,
  }) {
    return TrendingMoviesState(
      moviePage: moviePage ?? this.moviePage,
      movieStatus: movieStatus ?? this.movieStatus,
      movies: movies ?? this.movies,
      genreList: genreList ?? this.genreList,
    );
  }
}