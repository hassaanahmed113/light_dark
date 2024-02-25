import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProvider extends ChangeNotifier {
  ThemeData currentTheme = ThemeData.light();
  HomeProvider(bool isDark) {
    if (isDark == true) {
      currentTheme = ThemeData.dark();
    } else {
      currentTheme = ThemeData.light();
    }
    notifyListeners();
  }
  void toggleTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (currentTheme == ThemeData.light()) {
      currentTheme = ThemeData.dark();
      prefs.setBool('isDark', true);
    } else {
      currentTheme = ThemeData.light();
      prefs.setBool('isDark', false);
    }
    notifyListeners();
  }
}
