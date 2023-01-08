import 'package:flutter/material.dart';

import '../utils/math_util.dart';
class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({Key? key,required this.text,this.textAlign,this.fontSize,this.fontWeight,this.spacingHeight,this.color}) : super(key: key);
  final String text;
  final TextAlign? textAlign;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? spacingHeight;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign??TextAlign.start,
      style: TextStyle(
        color: color,
        fontSize: getFontSize(
          fontSize??12,
        ),
        fontFamily: 'Inter',
        fontWeight: fontWeight??FontWeight.normal,
        height: spacingHeight??1,
      ),
    );
  }
}