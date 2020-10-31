

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData kLightTheme = _buildLightTheme();

ThemeData _buildLightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(

    primaryColor: Color(0xffee5b5a),
    primaryColorDark: Color(0xffE23D22),
    accentColor:  Color(0xFFfafafa),
    canvasColor: const Color(0xFFfafafa),
    cardColor: Colors.white,
    buttonColor: Color(0xff212121),
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
    ),
    textTheme: TextTheme(

      headline6: TextStyle(
          fontFamily: "Proxima Nova",
          color: Colors.black

      ),
      subtitle2: TextStyle(
          fontFamily: "Proxima Nova",
          color: Colors.black

      ),
      subtitle1: TextStyle(
          fontFamily: "Proxima Nova",
          color: Colors.black

      ),
      headline4: TextStyle(
          fontFamily: "Proxima Nova",
          color: Colors.black

      ),
      headline5: TextStyle(
        fontFamily: "Proxima Nova",
        color: Colors.black

      ),
      bodyText2: TextStyle(
          fontFamily: "Proxima Nova",
          color: Colors.black

      ),
      bodyText1: TextStyle(
          fontFamily: "Proxima Nova",
          color: Colors.black

      ),
      button: TextStyle(
          fontFamily: "Proxima Nova",
          color: Colors.black

      ),
      caption:TextStyle(
          fontFamily: "Proxima Nova",
          color: Colors.black
      ),
    ),




    appBarTheme: AppBarTheme(
      color: Color(0xffee5b5a),
      iconTheme: IconThemeData(
        color: Colors.white, //change your color here
      ),
    ),
  );
}