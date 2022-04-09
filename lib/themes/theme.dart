import 'package:flutter/material.dart';

class BillingThemes {
  static TextTheme textTheme = const TextTheme(
    headline1: TextStyle(
      color: Color(0xffD1D1D1),
      fontSize: 18,
      fontWeight: FontWeight.w700,
    ),
    headline2: TextStyle(
      color: Color(0xff999999),
      fontSize: 14,
      fontWeight: FontWeight.w700,
    ),
    headline3: TextStyle(
      color: Color(0xffA6A6A6),
      fontSize: 10,
      fontWeight: FontWeight.w500,
    ),
    headline4: TextStyle(
      color: Color(0xff999999),
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),
    headline5: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
    headline6: TextStyle(
      color: Color(0xffE7E7E7),
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    bodyText1: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    bodyText2: TextStyle(
      color: Color(0xff999999),
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  );

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: const Color(0xff141416),
      textSelectionTheme:
          const TextSelectionThemeData(selectionColor: Colors.white),
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: const Color(0xffA6A6A6)),
    );
  }
}
