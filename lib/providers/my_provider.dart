import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class MyProviderApp extends ChangeNotifier {
  String AppLanguage = 'en';
  ThemeMode themeMode = ThemeMode.dark;

  void changeLanguage(String languageCode) {
    AppLanguage = languageCode;
    notifyListeners();
  }

  void changeTheme(ThemeMode theme) {
    themeMode = theme;
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
