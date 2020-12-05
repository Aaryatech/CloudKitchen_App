import 'package:flutter/material.dart';

final ThemeData kLightTheme = _buildLightTheme();

ThemeData _buildLightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(

    primaryColor: Color(0xffe23744),
    primaryColorDark: Color(0xffe23744),
    accentColor:  Color(0xFFfafafa),
    canvasColor: const Color(0xFFfafafa),
    cardColor: Colors.white,
    buttonColor: Color(0xff212121),
    cardTheme: CardTheme(
      elevation: 4,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
    ),
    textTheme: TextTheme(

      headline6: TextStyle(
          fontFamily: "Metropolis",
          color: Colors.black

      ),

      subtitle2: TextStyle(
          fontFamily: "Metropolis",
          color: Colors.black

      ),
      subtitle1: TextStyle(
          fontFamily: "Metropolis",
          color: Colors.black

      ),
      headline4: TextStyle(
          fontFamily: "Metropolis",
          color: Colors.black

      ),
      headline5: TextStyle(
        fontFamily: "Metropolis",
        color: Colors.black

      ),
      bodyText2: TextStyle(
          fontFamily: "Open Sans regular",
          color: Colors.black

      ),
      bodyText1: TextStyle(
          fontFamily: "Open Sans regular",
          color: Colors.black

      ),
      //
      button: TextStyle(
          fontFamily: "Open Sans regular",
          color: Colors.black

      ),

      //open sans
      caption:TextStyle(
          fontFamily: "Open Sans regular",
          color: Colors.black
      ),
    ),




    appBarTheme: AppBarTheme(
      color:Color(0xffe23744),
      iconTheme: IconThemeData(
        color: Colors.white, //change your color here
      ),
    ),
  );
}