

import 'package:flutter/material.dart';

class CustomThemes extends ChangeNotifier{
  bool _isLightTheme = false;

  void setCurrentTheme(){
    _isLightTheme =! _isLightTheme;
    notifyListeners();}
   ThemeData getCurrentTheme(){ 
    return _isLightTheme?newLightTheme:newDarkTheme;}

   getZoeIcon(){
    return _isLightTheme? Icon(Icons.light_mode):Icon(Icons.dark_mode);
  }
ThemeData newLightTheme =ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.grey.shade300 
  ,colorScheme: ColorScheme.light(
    brightness: Brightness.light,
    primary: Colors.blueGrey,
    tertiary: Colors.black,
    secondary: Colors.grey.shade400
  )

);
ThemeData newDarkTheme =ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,
    colorScheme: ColorScheme.dark(
    brightness: Brightness.dark,
    primary: Colors.grey.shade800,
    tertiary: Colors.white,
    secondary: Colors.blue,
    
  )
  

);
  }