import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db_practical/widget/rate_icon_display.dart';

import '../bloc/trending_movies/trending_movies_bloc.dart';
import '../screen/top_movies/movie_detail_screen/movie_detail_screen.dart';
import '../utils/color_constant.dart';
import '../utils/math_util.dart';
import '../utils/utils.dart';
import 'common_imageview.dart';
import 'custom_text.dart';
import 'movie_card_view.dart';
import 'no_result_found.dart';
class MovieDetailWidget extends StatelessWidget {
  const MovieDetailWidget({Key? key, required this.isTopMostMovie, required this.name, required this.overview, required this.date, required this.genre, required this.color, required this.rate}) : super(key: key);
  final bool isTopMostMovie;
  final String name;
  final String overview;
  final String date;
  final String genre;
  final Color color;
  final num rate;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment:
      CrossAxisAlignment.start,
      mainAxisAlignment:
      MainAxisAlignment.start,
      children: [
        Padding(
          padding: getPadding(
            right: 10,
          ),
          child: CustomTextWidget(
            text: "Top movie of the week",
            fontSize: 14,
            textAlign: TextAlign.left,
            fontWeight: FontWeight.w400,
            spacingHeight: 1.00,
            color: ColorConstant.bluegray100,
          ),
        ),
        Padding(
          padding: getPadding(
            top: 9,
          ),
          child: Row(
            mainAxisAlignment:
            MainAxisAlignment.start,
            crossAxisAlignment:
            CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              isTopMostMovie
                  ? Padding(
                padding: getPadding(
                    bottom: 1,
                    top: 2
                ),
                child:
                Container(
                  child: CommonImageView(
                    svgPath:
                    "assets/award_ribbon.svg",
                    fit:BoxFit.fitHeight,
                    height:
                    getVerticalSize(
                      40.00,
                    ),
                    width:
                    getHorizontalSize(
                      35.00,
                    ),
                  ),
                ),
              )
                  : Container(),
              Expanded(
                child: Column(
                  mainAxisSize:
                  MainAxisSize.min,
                  crossAxisAlignment:
                  CrossAxisAlignment
                      .start,
                  mainAxisAlignment:
                  MainAxisAlignment
                      .start,
                  children: [
                    Padding(
                      padding: getPadding(
                        left: isTopMostMovie
                            ? 10
                            : 0,
                        top: 7,
                      ),
                      child: CustomTextWidget(
                        text: name,
                        fontSize: 32,
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w600,
                        spacingHeight: 1.00,
                        color: ColorConstant.whiteA700,
                      ),
                    ),
                    Align(
                      alignment: Alignment
                          .centerLeft,
                      child: Padding(
                        padding: getPadding(
                          left:
                          isTopMostMovie
                              ? 10
                              : 0,
                          top: 7,
                        ),
                        child:  CustomTextWidget(
                          text: "${date.split("-").first}   $genre",
                          fontSize: 12,
                          textAlign: TextAlign.left,
                          fontWeight: FontWeight.w400,
                          spacingHeight: 1.00,
                          color: ColorConstant.bluegray100,
                        ),

                      ),
                    ),
                    Align(
                      alignment: Alignment
                          .centerLeft,
                      child: Padding(
                        padding: getPadding(
                          top: 14,
                          left:
                          isTopMostMovie
                              ? 10
                              : 0,
                        ),
                        child: Container(
                          width:
                          getHorizontalSize(
                            264.00,
                          ),
                          child: CustomTextWidget(
                            text: overview,
                            fontSize: 14,
                            textAlign: TextAlign.left,
                            fontWeight: FontWeight.w400,
                            spacingHeight: 1.43,
                            color: ColorConstant.whiteA700,
                          ),
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment
                            .centerLeft,
                        child: Padding(
                          padding:
                          getPadding(
                            top: 14,
                            left:
                            isTopMostMovie
                                ? 10
                                : 0,
                          ),
                          child: Flex(
                            direction: Axis
                                .horizontal,
                            children: [
                              ClipRRect(
                                borderRadius:
                                BorderRadius.circular(
                                    8.0),
                                child:
                                Container(
                                  color: color
                                      .withOpacity(
                                      0.05),
                                  child:
                                  Padding(
                                    padding:
                                    const EdgeInsets.all(8.0),
                                    child:
                                    Row(
                                      children: [
                                        RateDisplay(
                                          value: ((rate * 5) / 10),
                                        ),
                                        CustomTextWidget(
                                          text: "  ${num.parse(((rate * 5) / 10).toStringAsFixed(1))}/5",
                                          fontSize: 14,
                                          spacingHeight: 1.2,
                                          color: color,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: getPadding(
              right: 24,
              top: 46,
            ),
            child:
            CustomTextWidget(
              text: "Also trending",
              fontSize: 24,
              spacingHeight: 1,
              color: ColorConstant.whiteA700,
              textAlign: TextAlign.left,
              fontWeight: FontWeight.w600,

            ),
          ),
        ),
        Padding(
          padding: getPadding(
            top: 17,
          ),
          child: BlocBuilder<
              TrendingMoviesBloc,
              TrendingMoviesState>(
            builder: (context, state) {
              if (state.movieStatus ==
                  TrendingMovieStatus
                      .loaded) {
                return ListView.builder(
                  physics:
                  const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.movies.length,
                  itemBuilder:
                      (context, index) {
                    String movieGenre =
                    getGenreNameFromID(
                        state.movies[index].genreIds, index);
                    return MovieCardView(
                        id: state
                            .movies[index]
                            .id!,
                        name: state
                            .movies[index]
                            .title!,
                        poster: state
                            .movies[index]
                            .posterPath!,
                        color: Colors.white,
                        date: state
                            .movies[index]
                            .releaseDate!,
                        rate: state
                            .movies[index]
                            .voteAverage!,
                        overView: state
                            .movies[index]
                            .overview!,
                        genre: movieGenre,
                        isTopMostMovie:
                        index == 0
                            ? false
                            : false,
                        onTap: () {
                          pushNewScreen(
                            context,
                            MovieDetailsScreen(
                              id: state
                                  .movies[
                              index]
                                  .id!,
                              name: state
                                  .movies[
                              index]
                                  .title!,
                              genre: movieGenre,
                              rate: state
                                  .movies[
                              index]
                                  .voteAverage!,
                              overView: state
                                  .movies[
                              index]
                                  .overview!,
                              poster: state
                                  .movies[
                              index]
                                  .posterPath!,
                              color: Colors
                                  .white,
                              date:state.movies[index].releaseDate!,
                              isTopMostMovie:
                              index == 0
                                  ? true
                                  : false,
                            ),
                          );
                        },
                        padding: getPadding());
                  },
                );
              } else if (state
                  .movieStatus ==
                  TrendingMovieStatus
                      .error) {
                return const ErrorPage();
              } else if (state
                  .movieStatus ==
                  TrendingMovieStatus
                      .loading) {
                return Center(
                  child:
                  CircularProgressIndicator(
                    color: Colors
                        .grey.shade700,
                    strokeWidth: 2,
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        )
      ],
    );
  }
}
