import 'dart:async';

import 'package:flutter/material.dart';

import '../../utils/color_constant.dart';
import '../../utils/utils.dart';
import '../../widget/common_imageview.dart';
import '../bottom_nav_bar.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2),
            ()=>pushReplaceNewScreen(context,const BottomNavBar())
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.lightBlueA700,
      body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonImageView(
                  imagePath: "assets/logo.png",
                  height: 100,
                  width: 100,
                ),
              ],
            ),
          )),
    );
  }
}

