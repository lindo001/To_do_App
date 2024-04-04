

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_classic/componets/zoeTaskTracker.dart';

class taskModification extends StatelessWidget {
  static String id = "taskModificationPage";
  const taskModification({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController zoeController = TextEditingController();
    final _zoeCanYou = Hive.box("myDB");
    final zoeDo = Provider.of<zoeTaskTracker>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit page"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        // zoeDo.writeToHive(zoeController.text);
        if(zoeController.text.isNotEmpty){
          _zoeCanYou.add(zoeController.text);
        }
        // ChangeNotifier();
        Navigator.pop(context);
      }),
      body: SafeArea(child: Padding(padding: EdgeInsets.only(top:9,right: 10,left: 10),
      child: TextField(
        controller: zoeController,
        decoration: InputDecoration(
          hintText: "Task Name II"
        ),
      ),
      ),
      ),
    );
  }
}