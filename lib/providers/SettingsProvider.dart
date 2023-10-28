import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


//provider
class SettingsProvider extends ChangeNotifier{
  ThemeMode currentTheme = ThemeMode.light;
  Locale currentLocale = Locale('en');
  SharedPreferences? prefs;
  void changeTheme(ThemeMode newTheme){
    if (newTheme == currentTheme)return;
    currentTheme = newTheme;
    saveTheme(newTheme);
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
  Future<void> saveTheme(ThemeMode themeMode) async {
    String newTheme = themeMode == ThemeMode.dark ? 'dark' : 'light';
    await prefs!.setString('theme', newTheme);
  }

  String? getTheme() {
    return prefs!.getString('theme');
  }

  Future<void> loadThemeData() async {
    prefs = await SharedPreferences.getInstance();
    String? oldTheme = getTheme();
    if (oldTheme != null) {
      currentTheme = oldTheme == 'dark' ? ThemeMode.dark : ThemeMode.light;
    }
  }

}