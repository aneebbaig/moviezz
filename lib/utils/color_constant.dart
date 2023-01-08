import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color bluegray900 = fromHex('#252634');

  static Color? primaryColor = Color(0xFF070818);

  static Color backgroundColor = fromHex('#1B1C2A');

  static Color blueColor = fromHex('#007CFF');
  static Color white = fromHex('#FFFFFF');


  static Color black900 = fromHex('#070818');

  static Color black900E0 = fromHex('#e0090a19');

  static Color blue500 = fromHex('#1f8cff');

  static Color gray90000 = fromHex('#00141633');

  static Color gray900 = fromHex('#1b1c2a');

  static Color black901 = fromHex('#080917');
  static Color transparent = fromHex('#00000000');

  static Color lightBlueA700 = fromHex('#007cff');

  static Color bluegray100 = fromHex('#cdced1');

  static Color blue100 = fromHex('#cce5ff');

  static Color whiteA700 = fromHex('#ffffff');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
