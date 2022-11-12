import 'package:flutter/material.dart';

import 'constants.dart';


class Themes {
  static final light = ThemeData.light().copyWith(
      scaffoldBackgroundColor: scaffoldBackgroundLight,
      backgroundColor: backgroundLight,
      iconTheme: const IconThemeData(
          color: colorOnPrimary
      ),
      primaryColor: scaffoldBackgroundLight,
      canvasColor: Colors.black,
      primaryTextTheme: const TextTheme(
        headline1: TextStyle(fontFamily: "SofiaPro", fontSize: 34, color: colorSecondary, fontWeight: FontWeight.w900),
        headline2: TextStyle(fontFamily: "SofiaPro", fontSize: 24, color: colorSecondary, fontWeight: FontWeight.w900),
        headline3: TextStyle(fontFamily: "SofiaPro", fontSize: 20, color: colorSecondary, fontWeight: FontWeight.w700),
        headline4: TextStyle(fontFamily: "SofiaPro", fontSize: 18, color: colorSecondary, fontWeight: FontWeight.w700),
        headline5: TextStyle(fontFamily: "SofiaPro", fontSize: 16, color: colorSecondary, fontWeight: FontWeight.w700),
        headline6: TextStyle(fontFamily: "SofiaPro", fontSize: 14, color: colorSecondary,),
        subtitle1: TextStyle(fontFamily: "SofiaPro", fontSize: 16, color: colorSecondary,),
        subtitle2: TextStyle(fontFamily: "SofiaPro", fontSize: 16, color: colorSecondary,),
        bodyText1: TextStyle(fontFamily: "SofiaPro", fontSize: 16, color: colorSecondary,),
        bodyText2: TextStyle(fontFamily: "SofiaPro", fontSize: 14, color: colorSecondary,),
        button: TextStyle(fontFamily: "SofiaPro", fontSize: 20, color: colorSecondary, fontWeight: FontWeight.w700),
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(fontFamily: "SofiaPro", fontSize: 34, color: colorOnPrimary, fontWeight: FontWeight.w900),
        headline2: TextStyle(fontFamily: "SofiaPro", fontSize: 24, color: colorOnPrimary, fontWeight: FontWeight.w900),
        headline3: TextStyle(fontFamily: "SofiaPro", fontSize: 20, color: colorOnPrimary, fontWeight: FontWeight.w900),
        headline4: TextStyle(fontFamily: "SofiaPro", fontSize: 18, color: colorOnPrimary, fontWeight: FontWeight.w700),
        headline5: TextStyle(fontFamily: "SofiaPro", fontSize: 16, color: colorOnPrimary, fontWeight: FontWeight.w700),
        headline6: TextStyle(fontFamily: "SofiaPro", fontSize: 14, color: colorOnPrimary,),
        subtitle1: TextStyle(fontFamily: "SofiaPro", fontSize: 16, color: colorOnPrimary,),
        subtitle2: TextStyle(fontFamily: "SofiaPro", fontSize: 16, color: colorOnPrimary,),
        bodyText1: TextStyle(fontFamily: "SofiaPro", fontSize: 16, color: colorOnPrimary,),
        bodyText2: TextStyle(fontFamily: "SofiaPro", fontSize: 14, color: colorOnPrimary,),
        button: TextStyle(fontFamily: "SofiaPro", fontSize: 20, color: colorOnPrimary,),
      ),
      brightness: Brightness.light,
      dividerTheme: const DividerThemeData(
        color: colorButtonDisable,
        thickness: 0.2,
      ),
      appBarTheme: const AppBarTheme(
          elevation: 0,
          color: scaffoldBackgroundLight,
          titleTextStyle: TextStyle(
              color: colorOnPrimary
          )
      )
  );

  static final dark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: scaffoldBackgroundDark,
    backgroundColor: backgroundDark,
    iconTheme: const IconThemeData(
        color: colorOnSecondary
    ),
    primaryColor: scaffoldBackgroundDark,
    canvasColor: colorOnPrimary,
    primaryTextTheme: const TextTheme(
      headline1: TextStyle(fontSize: 34, color: colorSecondary, fontWeight: FontWeight.w900),
      headline2: TextStyle(fontSize: 24, color: colorSecondary, fontWeight: FontWeight.w900),
      headline3: TextStyle(fontSize: 20, color: colorSecondary, fontWeight: FontWeight.w700),
      headline4: TextStyle(fontSize: 18, color: colorSecondary, fontWeight: FontWeight.w700),
      headline5: TextStyle(fontSize: 16, color: colorSecondary, fontWeight: FontWeight.w700),
      headline6: TextStyle(fontSize: 14, color: colorSecondary,),
      subtitle1: TextStyle(fontSize: 16, color: colorSecondary,),
      subtitle2: TextStyle(fontSize: 16, color: colorSecondary,),
      bodyText1: TextStyle(fontSize: 16, color: colorSecondary,),
      bodyText2: TextStyle(fontSize: 14, color: colorSecondary,),
      button: TextStyle(fontSize: 20, color: colorSecondary, fontWeight: FontWeight.w700),
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 34, color: colorOnSecondary, fontWeight: FontWeight.w900),
      headline2: TextStyle(fontSize: 24, color: colorOnSecondary, fontWeight: FontWeight.w900),
      headline3: TextStyle(fontSize: 20, color: colorOnSecondary, fontWeight: FontWeight.w900),
      headline4: TextStyle(fontSize: 18, color: colorOnSecondary, fontWeight: FontWeight.w700),
      headline5: TextStyle(fontSize: 16, color: colorOnSecondary, fontWeight: FontWeight.w700),
      headline6: TextStyle(fontSize: 14, color: colorOnSecondary,),
      subtitle1: TextStyle(fontSize: 16, color: colorOnSecondary,),
      subtitle2: TextStyle(fontSize: 16, color: colorOnSecondary,),
      bodyText1: TextStyle(fontSize: 16, color: colorOnSecondary,),
      bodyText2: TextStyle(fontSize: 14, color: colorOnSecondary,),
      button: TextStyle(fontSize: 20, color: colorOnSecondary,),
    ),
    brightness: Brightness.dark,
    dividerTheme: const DividerThemeData(
      color: colorButtonDisable,
      thickness: 0.2,
    ),
    appBarTheme: const AppBarTheme(
        elevation: 0,
        color: scaffoldBackgroundDark,
        titleTextStyle: TextStyle(
            color: Colors.black54
        )
    ),
  );
}