import 'package:flutter/material.dart';
import 'package:todo_db/helpers/theme_helper.dart';

enum MyThemeMode { dark, light }

class ThemeProvider extends ChangeNotifier {
  ThemeData themeData = ThemeHelper.lightTheme;
  setThemeData(MyThemeMode mode) {
    themeData = mode == MyThemeMode.light
        ? ThemeHelper.lightTheme
        : ThemeHelper.darkTheme;
    notifyListeners();
  }
}
