import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/trending_movies/trending_movies_bloc.dart';
import '../../../utils/color_constant.dart';
import '../../../utils/math_util.dart';
import '../../../utils/utils.dart';
import '../../../widget/ImageShadowWidget.dart';
import '../../../widget/common_imageview.dart';
import '../../../widget/movie_detail_widget.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen(
      {Key? key,
      required this.id,
      required this.genre,
      required this.rate,
      required this.overView,
      required this.poster,
      required this.color,
      required this.name,
      required this.isTopMostMovie,
      required this.date})
      : super(key: key);
  final num id;
  final num rate;
  final String overView;
  final String genre;
  final String poster;
  final Color color;
  final String name;
  final bool isTopMostMovie;
  final String date;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TrendingMoviesBloc()..add(const LoadTrendingMoviesInfo(page: 1)),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorConstant.black900,
          body: Container(
            margin: getMargin(
              bottom: 24,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Stack(alignment: Alignment.topRight, children: [
                            ImageShadowWidget(
                              url: "https://image.tmdb.org/t/p/w500/$poster",
                              height: getVerticalSize(
                                472.00,
                              ),
                              width: getHorizontalSize(
                                360.00,
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: getPadding(
                                        left: 20,
                                        top: 27,
                                        right: 20,
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          popScreen(context);
                                        },
                                        child: CommonImageView(
                                          svgPath: "assets/img_arrowleft.svg",
                                          height: getSize(
                                            15.00,
                                          ),
                                          width: getSize(
                                            15.00,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      margin: getMargin(
                                        left: 24,
                                        top: 128,
                                        right: 24,
                                        bottom: 204,
                                      ),
                                      child: MovieDetailWidget(
                                        isTopMostMovie: isTopMostMovie,
                                        name: name,
                                        overview: overView,
                                        date: date,
                                        genre: genre,
                                        rate: rate,
                                        color:Colors.white
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ]),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
