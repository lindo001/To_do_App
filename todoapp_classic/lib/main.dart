// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'componets/customThemes.dart';
import 'pages/slash_screen.dart';


 void main() async {
  
  //init
  await Hive.initFlutter();
  //open
  final _ = await Hive.openBox("todo_DB");
runApp(MultiProvider(providers: [

  ChangeNotifierProvider(create: (context)=>CustomThemes())
],child: const MainApp(),));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final df = Provider.of<CustomThemes>(context);
    return MaterialApp(
      theme: df.getCurrentTheme(),
      debugShowCheckedModeBanner: false,
  home: const Slashscreen()

    );
  }
}
