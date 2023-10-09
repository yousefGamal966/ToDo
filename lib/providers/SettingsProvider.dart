import 'package:flutter/material.dart';


//provider
class SettingsProvider extends ChangeNotifier{
  ThemeMode currentTheme = ThemeMode.light;
  Locale currentLocale = Locale('en');
  void changeTheme(ThemeMode newTheme){
    if (newTheme == currentTheme)return;
    currentTheme = newTheme;
    notifyListeners();
  }
  String getBackgroundImage (){
    return currentTheme == ThemeMode.dark?
    'assets/images/dark_background.png':
    'assets/images/main_background.jpg';
  }
  bool isDarkEnabled(){
    return currentTheme == ThemeMode.dark;
  }
  void changeLanguage(Locale newLocale){
    if (newLocale == currentLocale)return;
      currentLocale  = newLocale;
    notifyListeners();
  }
  bool isEnglishEnabled (){
    return currentLocale == Locale('en');
  }
  String getSebhaBodyImage (){
      return currentTheme == ThemeMode.dark?
      'assets/images/sebha_body_dark.png':
      'assets/images/sebha_body.png';
  }
  String getSebhaHeadImage (){
    return currentTheme == ThemeMode.dark?
    'assets/images/sebha_head_dark.png':
    'assets/images/sebha_head.png';
  }
}