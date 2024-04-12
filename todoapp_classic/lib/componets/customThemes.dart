

import 'package:flutter/material.dart';

class CustomThemes extends ChangeNotifier{
  bool _isLightTheme = false;

  void setCurrentTheme(){
    _isLightTheme =! _isLightTheme;
    notifyListeners();}
   ThemeData getCurrentTheme(){ 
    return _isLightTheme?newLightTheme:newDarkTheme;}
ThemeData newLightTheme =ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.grey.shade300 

);
ThemeData newDarkTheme =ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,
  primaryColor: Colors.grey,
  

);
  }