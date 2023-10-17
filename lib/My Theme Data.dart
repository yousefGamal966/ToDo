import 'package:flutter/material.dart';

class MyThemeData{
  static Color primaryColor = Color(0xFF5D9CEC);
  static Color lightBackColor = Color(0xFFDEEBDA);
  static Color darkBackColor = Color(0xFF060E1E);
  static Color taskColor = Color(0xFF141922);
  static ThemeData lightTheme = ThemeData(
    cardColor: Colors.white,
    primaryColor: primaryColor,
    dividerColor: primaryColor,
    scaffoldBackgroundColor: lightBackColor,
    canvasColor: Colors.white,
    hintColor: Colors.black,
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
    datePickerTheme:DatePickerThemeData(
        backgroundColor:lightBackColor
    ) ,


  );
  static ThemeData darkTheme = ThemeData (
    primaryColor: primaryColor,
    dividerColor: primaryColor,
    scaffoldBackgroundColor: darkBackColor,
    canvasColor: taskColor,
    hintColor: Colors.white,

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
    datePickerTheme:DatePickerThemeData(
        backgroundColor:taskColor,dayStyle: TextStyle(color: Colors.white),
      weekdayStyle: TextStyle(color: Colors.white),
      yearStyle: TextStyle(color: Colors.white),
      headerHeadlineStyle: TextStyle(color: Colors.white),
      headerHelpStyle: TextStyle(color: Colors.white),
      rangePickerHeaderHeadlineStyle: TextStyle(color: Colors.white),
      rangePickerHeaderHelpStyle: TextStyle(color: Colors.white),
      inputDecorationTheme: InputDecorationTheme(),
      shadowColor:primaryColor,
      elevation: 2,





    ) ,
    cardColor: taskColor
      );


}