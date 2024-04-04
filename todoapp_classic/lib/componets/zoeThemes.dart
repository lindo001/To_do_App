

import 'package:flutter/material.dart';

class zoeThemes extends ChangeNotifier{

  bool _amILightTheme = true;
  //  sets
  void setZoeTheme(){ _amILightTheme =! _amILightTheme; notifyListeners();
  print(_amILightTheme);}

  // gets
  ThemeData getZoeTheme(){
if (_amILightTheme){return ThemeData.light();}
    else{return ThemeData.dark();}
  }

  IconData getZoeIcon() => _amILightTheme? Icons.light_mode: Icons.dark_mode;
}