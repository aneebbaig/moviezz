import 'package:flutter/material.dart';
import 'package:movie_db_practical/utils/color_constant.dart';

import '../../utils/constants.dart';
class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Statistics",style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
