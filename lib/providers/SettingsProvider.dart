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
  String getSplashImage (){
    return currentTheme == ThemeMode.dark?
    'assets/images/splash_dark.png':
    'assets/images/splash_light.png';
  }
  String getRegImage (){
    return currentTheme == ThemeMode.dark?
    'assets/images/reg_back_screen_dark.png':
    'assets/images/reg_back_screen.png';
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