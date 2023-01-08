part of 'top_movies_bloc.dart';

enum MovieStatus {
  initial,
  loading,
  loaded,
  error,
}

class TopMoviesState {
  final MovieStatus movieStatus;
  final List<Results> movies;
  final List<GenresList> genreList;
  TopMoviesState({
    required this.movieStatus,
    required this.movies,
    required this.genreList,
  });
  factory TopMoviesState.initial() => TopMoviesState(
    movieStatus: MovieStatus.initial,
    movies: [],
    genreList: [],
  );

  TopMoviesState copyWith({
    MovieStatus? movieStatus,
    List<Results>? movies,
    List<GenresList>? genreList,
  }) {
    return TopMoviesState(
      movieStatus: movieStatus ?? this.movieStatus,
      movies: movies ?? this.movies,
      genreList: genreList ?? this.genreList,
    );
  }
}