import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db_practical/data/model/top_movies/results.dart';
import 'package:movie_db_practical/utils/color_constant.dart';
import 'package:movie_db_practical/widget/custom_text.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../bloc/top_movies_bloc.dart';
import '../../utils/constants.dart';
import '../../utils/math_util.dart';
import '../../utils/utils.dart';
import '../../widget/movie_card_view.dart';
import '../../widget/no_result_found.dart';
import 'movie_detail_screen/movie_detail_screen.dart';

class TopMoviesScreen extends StatefulWidget {
  const TopMoviesScreen({Key? key}) : super(key: key);

  @override
  State<TopMoviesScreen> createState() => _TopMoviesScreenState();
}

class _TopMoviesScreenState extends State<TopMoviesScreen> {
  List<Results> listMovies=[];
  final RefreshController _refreshController =
  RefreshController(initialRefresh: false);

  int page=2;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      TopMoviesBloc()
        ..add(const LoadAllGenres()),
      child: BlocListener<TopMoviesBloc, TopMoviesState>(
        listener: (context, state) {
          if(state.movieStatus == MovieStatus.loaded) {
            listMovies.addAll(state.movies);
            _refreshController.loadComplete();
          }
        },
        child: BlocBuilder<TopMoviesBloc, TopMoviesState>(
          builder: (context, state) {
            if (state.movieStatus == MovieStatus.loaded) {
              return Scaffold(
                backgroundColor: primaryColor,
                body: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      appBarWidget(),
                      Expanded(
                        child: SmartRefresher(

                          onLoading: ()async{
                            BlocProvider.of<TopMoviesBloc>(context).add(LoadTopMoviesInfo(page: page++));

                          },
                          controller: _refreshController,
                          enablePullUp: true,
                          enablePullDown: false,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: listMovies.length,
                              itemBuilder: (context, index) {
                                String movieGenre =
                                getGenreNameFromID(listMovies[index].genreIds, index);
                                return MovieCardView(
                                  id: listMovies[index].id!,
                                  name: listMovies[index].title!,
                                  poster: listMovies[index].posterPath!,
                                  color: Colors.white,
                                  date: listMovies[index].releaseDate!,
                                  rate: listMovies[index].voteAverage!,
                                  overView: listMovies[index].overview!,
                                  genre: movieGenre,
                                  isTopMostMovie: index == 0 ? true : false,
                                  onTap: () {
                                    pushNewScreen(
                                      context,
                                      MovieDetailsScreen(
                                        id: listMovies[index].id!,
                                        name: listMovies[index].title!,
                                        genre: movieGenre,
                                        rate: listMovies[index].voteAverage!,
                                        overView: listMovies[index].overview!,
                                        poster: listMovies[index].posterPath!,
                                        color: Colors.white,
                                        isTopMostMovie: index == 0 ? true : false,
                                        date: listMovies[index].releaseDate!,
                                      ),
                                    );
                                  },
                                  padding: getPadding(
                                      left: 20, right: 20),
                                );
                              },
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (state.movieStatus == MovieStatus.error) {
              return const ErrorPage();
            } else if (state.movieStatus == MovieStatus.loading) {
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(
                    color: Colors.grey.shade700,
                    strokeWidth: 2,
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                ),
              );
            }
            return const Scaffold();
          },
        ),
      ),
    );
  }

  Widget appBarWidget() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(child: CustomTextWidget(text: "Top Movies",color: ColorConstant.white,fontSize: 40,fontWeight: FontWeight.w600,)),
          Icon(
            CupertinoIcons.search,
            color: Colors.white.withOpacity(0.8),
            size: 40,
          )
        ],
      ),
    );
  }
}
