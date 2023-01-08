import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/top_movies_bloc.dart';

final TextStyle normalText = GoogleFonts.inter(
    textStyle: const TextStyle(fontSize: 16, letterSpacing: 0.8));

final TextStyle headingText = GoogleFonts.inter(
  textStyle: const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
  ),
);

pushReplaceNewScreen(BuildContext context, Widget page) {
  Navigator.pushReplacement(
    context,MaterialPageRoute(builder: (BuildContext context) =>
      page)
    // _createRoute(page),
  );
}
pushNewScreen(BuildContext context, Widget page) {
  Navigator.push(
    context,MaterialPageRoute(builder: (BuildContext context) =>
      page)
    // _createRoute(page),
  );
}
popScreen(BuildContext context) {
  Navigator.pop(
    context
  );
}

String getGenreNameFromID(List<num>? movieGenreIDs, index) {
  List<String> genre=[];
  for(int p=0;p<movieGenreIDs!.length;p++){
    for(int q=0;q<TopMoviesBloc.allGenreList.length;q++){
      if(movieGenreIDs[p]==TopMoviesBloc.allGenreList[q].id){
        genre.add(TopMoviesBloc.allGenreList[q].name!);
      }
    }
  }

  return genre.length == 1
      ? genre[0]
      : genre.join('/').toString();
}