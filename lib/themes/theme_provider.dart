import 'package:flutter/material.dart';
import 'package:monews_app/themes/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;
  ThemeData _themeData = lightMode;

  bool get isDarkMode => _isDarkMode;
  ThemeData get themeData => _themeData;

  Future<void> toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    _themeData = _isDarkMode ? darkMode : lightMode;

    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', _isDarkMode);

    notifyListeners();
  }

  Future<void> temaInicial() async {
    final preferencia = await SharedPreferences.getInstance();
    _isDarkMode = preferencia.getBool('isDarkMode') ?? false;
    _themeData = _isDarkMode ? darkMode : lightMode;
    notifyListeners();
  }
}
// class ThemeProvider with ChangeNotifier {
//   bool _isDarkMode = false;
//   ThemeData get themeData => _isDarkMode ? darkMode : lightMode;
//   bool get isDarkMode => _isDarkMode;

//   void toggleTheme() {
//     _isDarkMode = !_isDarkMode;
//     notifyListeners();
//   }
// }
// class ThemeProvider with ChangeNotifier {
//   ThemeData _themeData = lightMode;
//   ThemeData get themeData => _themeData;

//   set themeData(ThemeData themeData) {
//     _themeData = themeData;
//     notifyListeners();
//   }

//   void toggleTheme() {
//     if (_themeData == lightMode) {
//       themeData = darkMode;
//     } else {
//       themeData = lightMode;
//     }
//   }
// }
