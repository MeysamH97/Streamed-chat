import 'package:chat_by_socket_samle/core/themes/light_mode.dart';
import 'package:flutter/material.dart';
import 'dark_mode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeProvider() {
    _loadThemeFromPreferences(); // بارگذاری تم در هنگام ایجاد Provider
  }

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  set themeData(ThemeData newThemeData) {
    _themeData = newThemeData;
    _saveThemeToPreferences(); // ذخیره‌سازی تم جدید در Preferences
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }

  // ذخیره‌سازی تم در SharedPreferences
  Future<void> _saveThemeToPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', _themeData == darkMode);
  }

  // بارگذاری تم از SharedPreferences
  Future<void> _loadThemeFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool('isDarkMode') ?? false;
    _themeData = isDarkMode ? darkMode : lightMode;
    notifyListeners(); // اعلان به گوش‌دهنده‌ها برای به‌روزرسانی UI
  }
}
