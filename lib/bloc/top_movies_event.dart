part of 'top_movies_bloc.dart';

abstract class TopMoviesEvent extends Equatable {
  const TopMoviesEvent();

  @override
  List<Object> get props => [];
}


class LoadTopMoviesInfo extends TopMoviesEvent {
  final int page;

  const LoadTopMoviesInfo({
    required this.page,
  });
}

class LoadAllGenres extends TopMoviesEvent {

  const LoadAllGenres();
}
