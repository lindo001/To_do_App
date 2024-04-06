

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_classic/componets/zoeThemes.dart';

class Settings extends StatelessWidget {
  static String id = "SettingsPage"; 
  final Function cleanFunction;
   Settings({super.key,required this.cleanFunction});
  final _zoeCanYou = Hive.box("myDB");


  @override
  Widget build(BuildContext context) {
    final holdZoe = Provider.of<zoeThemes>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Settings"),centerTitle: true,),
      body: Column(children: [
        Text("App Setteings"),
        Divider(),
        GestureDetector(
          onTap: ()=> holdZoe.setZoeTheme(),
          child: ListTile(
            leading:  Icon(holdZoe.getZoeIcon()),
            title: Text("Theme"),
          ),
        ),
        GestureDetector(
          onTap: () => cleanFunction(),
          child: ListTile(
            leading: Icon(Icons.clear_all),
            title: Text("Clear all "),
          ),
        ),
        Text("Character Settings"),
        Divider(),
        ListTile(
          leading: Icon(Icons.query_stats),
          title: Text("Level"),
        ),
        ListTile(
          leading: Icon(Icons.hub_outlined),
          title: Text("Quests"),
        ),
        ListTile(
          leading: Icon(Icons.star),
          title: Text("Achivements"),
        )


      ],),
    );
  }
}

// 