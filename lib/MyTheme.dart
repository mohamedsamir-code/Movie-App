import 'dart:ui';

import 'package:flutter/material.dart';

class MyTheme {
  static Color blackColor = Color(0xFF121312);
  static Color greySectionColor = Color(0xFF707070);
  static Color goldColor = Color(0xFFF7B539);
  static Color greyCheckColor = Color(0xFF514F4F);
  static Color yellowColor = Color(0xFFFFBB3B);
  static Color silverColor = Color(0xFFC6C6C6);

  static ThemeData appTheme = ThemeData(
      primaryColor: greySectionColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 0,
          selectedItemColor: yellowColor,
          unselectedItemColor: Colors.cyan,
          showSelectedLabels: true,
          showUnselectedLabels: true));
}
