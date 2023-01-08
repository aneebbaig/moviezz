import 'package:flutter/material.dart';

import '../utils/color_constant.dart';
import 'common_imageview.dart';

class ImageShadowWidget extends StatelessWidget {
  const ImageShadowWidget({Key? key, required this.url, required this.height, required this.width}) : super(key: key);
  final String url;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topRight,
    children: [

      Align(
        alignment: Alignment.topCenter,
        child: Container(
          child: CommonImageView(
            url:
            url,
            height: height,
            width: width,
          ),
        ),
      ),
      Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              ColorConstant.gray90000,
              ColorConstant.black900E0,
              ColorConstant.black901,
            ],
          ),
        ),
        child: Container(),
      ),
    ],);
  }
}
