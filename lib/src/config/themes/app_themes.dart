import 'package:flutter/material.dart';
import 'package:a_few_words/src/utils/constants/colors.dart';

abstract class AppTheme {
  static ThemeData get light {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.white,
      ), 
      scaffoldBackgroundColor: Colors.white,
      primaryColor: primaryColor,
      splashColor: Colors.transparent,
      fontFamily: 'RobotoMono',
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
    );
  }
}