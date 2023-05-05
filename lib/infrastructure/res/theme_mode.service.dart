import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeModeService {
  static ThemeModeService? _instance;

  ThemeModeService._();

  static ThemeModeService get instance {
    _instance ??= ThemeModeService._();
    return _instance!;
  }

  Future<bool> saveThemeMode(bool darkMode) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setBool('darkMode', darkMode);
      return true;
    } catch (e) {
      if (kDebugMode) print(e);
    }
    return false;
  }

  Future<bool> isDarkMode() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      return preferences.getBool("darkMode") ?? false;
    } catch (e) {
      if (kDebugMode) print(e);
    }
    return false;
  }
}
