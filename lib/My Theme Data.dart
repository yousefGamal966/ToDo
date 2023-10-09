import 'package:flutter/material.dart';

class MyThemeData{
  static Color primaryColor = Color(0xFF5D9CEC);
  static Color lightBackColor = Color(0xFFDEEBDA);
  static Color darkBackColor = Color(0xFF060E1E);
  static ThemeData lightTheme = ThemeData(
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

      );
  /*class MyThemeData{
  static Color lightPrimary = Color(0xFFB7935F);
  static Color darkPrimary = Color(0xFF141A2E);
  static Color darkSecondary = Color(0xFFFACC1D);

  static  ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      dividerColor: lightPrimary,
      canvasColor: Colors.black,
      textTheme: const TextTheme(
        titleMedium: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w400,
            color: Colors.black
        ),
        bodyMedium: TextStyle(
            fontSize: 20,
            fontFamily: 'Quran',
            color: Colors.black
        ),
        labelMedium: TextStyle(
          fontSize: 20,
          color: Colors.black,


        ),
        labelLarge: TextStyle(
            fontSize: 25,
            fontFamily: 'Quran',
            color: Colors.black
        ),

      ),

      cardTheme: CardTheme(
          color: Color(0xFFE7DED5)
      ),
      appBarTheme: AppBarTheme(
        color: Colors.transparent,
        iconTheme: IconThemeData(
            color: Colors.black
        ),
        centerTitle: true,
        titleTextStyle: TextStyle(fontSize: 28, color: Colors.black,),
        elevation: 0,),
      scaffoldBackgroundColor: Colors.transparent,
      colorScheme: ColorScheme.fromSeed(
        seedColor: lightPrimary,
        primary: lightPrimary,
        secondary: Color(0xFFC9B496),
        onPrimary: Colors.white,
        onSecondary: Colors.black,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        selectedIconTheme: IconThemeData(size: 32),
      ),
      bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.white

      )
  );
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      canvasColor: darkSecondary,

      textTheme: const TextTheme(
        titleMedium: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w400,
            color: Colors.white
        ),
        bodyMedium: TextStyle(
            fontSize: 20,
            fontFamily: 'Quran',
            color: Colors.white
        ),
        labelMedium: TextStyle(
          fontSize: 25,
          color: Colors.white,


        ),
        labelLarge: TextStyle(
            fontSize: 25,
            fontFamily: 'Quran',
            color: Colors.white
        ),

      ),
      dividerColor: darkSecondary,

      cardTheme: CardTheme(
          color: darkPrimary,
          surfaceTintColor: Colors.white

      ),
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: darkSecondary,
          ),
          color: Colors.transparent,
          centerTitle: true,
          titleTextStyle: TextStyle(fontSize: 28, color: Colors.white,),
          elevation: 0),
      scaffoldBackgroundColor: Colors.transparent,
      colorScheme: ColorScheme.fromSeed(
        seedColor: darkPrimary,
        primary: darkPrimary,
        secondary: darkSecondary,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
      ),
      bottomNavigationBarTheme:  BottomNavigationBarThemeData(
        selectedItemColor:darkSecondary ,
        unselectedItemColor: Colors.white,
        selectedIconTheme: IconThemeData(size: 32),
      ),
      bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: darkPrimary

      )
  );
}*/

}