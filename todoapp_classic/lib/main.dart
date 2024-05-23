// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_classic/pages/MainPage.dart';
import 'package:todoapp_classic/pages/Settings.dart';
import 'package:todoapp_classic/services/providers/themeManager.dart';

import 'pages/slash_screen.dart';


 void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //init
  await Hive.initFlutter();
  //open
  final _ = await Hive.openBox("persistingdata");
runApp( ChangeNotifierProvider<Thememanager>(create: (context)=>Thememanager(),child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedTheme = Provider.of<Thememanager>(context);
    return MaterialApp(
      
      theme:selectedTheme.currentTheme,
      debugShowCheckedModeBanner: false,
  home: const Slashscreen(),
  routes: {
    Slashscreen.id: (_)=> const Slashscreen(),
    MainPage.id:(_)=> const MainPage(),
    Slashscreen.id:(_)=> const Settings()
  },

    );
  }
}
