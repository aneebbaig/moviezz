import 'package:flutter/material.dart';

import '../../utils/constants.dart';
class TrailersScreen extends StatelessWidget {
  const TrailersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Text("Trailer",style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
