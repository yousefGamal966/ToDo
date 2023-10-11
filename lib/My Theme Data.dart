import 'package:flutter/material.dart';

class MyThemeData{
  static Color primaryColor = Color(0xFF5D9CEC);
  static Color lightBackColor = Color(0xFFDEEBDA);
  static Color darkBackColor = Color(0xFF060E1E);
  static ThemeData lightTheme = ThemeData(
    dividerColor: darkBackColor,
    scaffoldBackgroundColor: lightBackColor,
    useMaterial3: false,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryColor
      ),
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          // fontFamily: 'Bar',
          fontSize: 24,
          fontWeight: FontWeight.w600,color: Colors.white

        )
      ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
    ),


  );
  static ThemeData darkTheme = ThemeData (
    dividerColor: lightBackColor,
    scaffoldBackgroundColor: darkBackColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,

    ),

    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: darkBackColor
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryColor
    ),
    textTheme: TextTheme(
        headlineLarge: TextStyle(
          // fontFamily: 'Bar',
            fontSize: 24,
            fontWeight: FontWeight.w600,color:darkBackColor

        ),
      titleMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,color:Colors.white
      ),
      bodySmall: TextStyle(
        fontSize: 15,
        color: Colors.white

      )
    ),
      );


}