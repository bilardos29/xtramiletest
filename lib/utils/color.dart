import 'package:flutter/material.dart';

class AppColor {
  static const int _skatePrimary = 0xFF587081;
  static const MaterialColor skate = MaterialColor(
    _skatePrimary,
    <int, Color>{
      100: Color(0xFFdee2e6),
      200: Color(0xFFbcc6cd),
      300: Color(0xFF9ba9b3),
      400: Color(0xFF798d9a),
      500: Color(0xFF587081),
    },
  );


  static const info = Color(0xFFffd872);
  static const success = Color(0xFF00a76a);
  static const warning = Color(0xFFf45c08);
  static const error = Color(0xFFfa2f2f);
}
