import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProviderApp extends ChangeNotifier {
  String AppLanguage = 'ar';
  ThemeMode themeMode = ThemeMode.dark;

  void changeLanguage(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    AppLanguage = languageCode;
    prefs.setString('language', languageCode);
    notifyListeners();
  }

  void changeTheme(ThemeMode theme) async {
    final prefs = await SharedPreferences.getInstance();
    themeMode = theme;
    prefs.setString('theme', theme == ThemeMode.dark ? 'dark' : 'light');
    notifyListeners();
  }

  String getBackGround() {
    if (themeMode == ThemeMode.light) {
      return 'assets/images/main_bg.png';
    } else {
      return 'assets/images/main_dark_bg.png';
    }
  }
}
