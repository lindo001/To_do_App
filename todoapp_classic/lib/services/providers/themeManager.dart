

import 'package:flutter/material.dart';
import 'package:todoapp_classic/utils/colors.dart';


class Thememanager extends ChangeNotifier {
  late ThemeData currentTheme;
  
  bool get isLight => currentTheme == ThemeData.light();

  Thememanager() {
    currentTheme = ThemeData.dark();
  }

  void changeTheme() {
    currentTheme = isLight ? ThemeData.dark() : ThemeData.light();
    notifyListeners();
  }

  ThemeData newdarkTheme (){
    return ThemeData(
      brightness:  Brightness.dark,
      colorScheme: ColorScheme.dark(
        surface: lightGray,
      )
    );
  }
}