part of 'trending_movies_bloc.dart';

abstract class TrendingMoviesEvent extends Equatable{
  const TrendingMoviesEvent();
  @override
  List<Object> get props => [];
}

class LoadTrendingMoviesInfo extends TrendingMoviesEvent {
  final int page;

  const LoadTrendingMoviesInfo({
    required this.page,
  });
}
