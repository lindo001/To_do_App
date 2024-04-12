import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_classic/componets/customThemes.dart';

class Settingspage extends StatelessWidget {
  final Function? cleanFunction;
  const Settingspage({super.key, required this.cleanFunction});

  @override
  Widget build(BuildContext context) {
    final customtheme = Provider.of<CustomThemes>(context);
    return Scaffold(
      appBar: AppBar(title:const Text("Settings"),centerTitle: true,),
      body: Column(children: [
        SizedBox(height: 20,),
        GestureDetector(
          onTap: ()=> customtheme.setCurrentTheme(),
          child: ListTile(
            leading: customtheme.getZoeIcon(),
            title: const Text("Theme"),
          ),
        ),
        GestureDetector(
          onTap: () => cleanFunction!(),
          child:const  ListTile(
            leading: Icon(Icons.clear_all),
            title: Text("Clear all"),
          ),
        ),
     


      ],),
    );
  
  }
}