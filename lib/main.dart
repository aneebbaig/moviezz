import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'utils/color_constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moviezz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        scaffoldBackgroundColor: ColorConstant.primaryColor,
        primarySwatch: Colors.blue,
        splashColor: Colors.transparent,
        primaryColor: ColorConstant.blue500,
        textTheme: GoogleFonts.interTextTheme(),
      ),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: ScrollConfiguration(
            behavior: NoGlowBehavior(),
            child: child!,
          ),
        );
      },
      //home: const SplashScreen()
    );
  }
}

class NoGlowBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }
}
