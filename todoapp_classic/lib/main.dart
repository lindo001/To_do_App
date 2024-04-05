// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_classic/componets/zoeTaskTracker.dart';
import 'package:todoapp_classic/componets/zoeThemes.dart';
import 'package:todoapp_classic/pages/homePage.dart';
import 'package:todoapp_classic/pages/settings.dart';

 void main() async {
  
  await Hive.initFlutter();
  var myDB = await Hive.openBox('myDB');
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=> zoeThemes()),
    ChangeNotifierProvider(create: (context)=> zoeTaskTracker()),
  ],child: MainApp(),));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final holdZoe = Provider.of<zoeThemes>(context);
    return MaterialApp(
      theme: holdZoe.getZoeTheme(),
      debugShowCheckedModeBanner: false,
// 
      initialRoute: homePage.id,
      routes: {
        homePage.id:(context) =>  homePage(),
        // Settings.id:(context) =>  Settings(),
        // taskModification.id:(context) =>  taskModification()
      },

    );
  }
}
