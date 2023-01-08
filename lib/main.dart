import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bloc/top_movies_bloc.dart';
import 'data/service_locator.dart';
import 'screen/splash/splash_screen.dart';
import 'utils/color_constant.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Movie database',
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
        home: const SplashScreen());
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
