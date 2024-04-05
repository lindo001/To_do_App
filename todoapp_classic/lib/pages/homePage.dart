import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp_classic/pages/settings.dart';
import 'package:todoapp_classic/pages/taskmodifcation.dart';

class homePage extends StatefulWidget {
  static String id ="HomePage";
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final hivebox = Hive.box("myDB");
  TextEditingController controllerForTitle= TextEditingController();
  TextEditingController controllerForDescription= TextEditingController();
  // List placelist = [["Songs","You said you wont listen",false]];

  addThis(String arg1,String arg2){
    setState(() {
      hivebox.add([arg1,arg2,false]);
      // placelist.add([arg1,arg2,false]);
      controllerForTitle.clear();
      controllerForDescription.clear();
    });}
  removeThis(int arg1){
    setState(() {
      // placelist.removeAt(arg1);
    });
  }
  clean(){
   setState(() {
      hivebox.clear();
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: 
        (context)=> Settings(cleanFunction: clean))), icon: Icon(Icons.settings))],
        title: const Text("Adventures of ToDo's"),
        centerTitle: true,
        ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
        taskModification(titleController: controllerForTitle, descriptionController: controllerForDescription, callThisFunction: addThis)
        ));
      },child: Icon(Icons.add),),
      body: hivebox.length>0?ListView.builder(itemCount: hivebox.length,itemBuilder: (context,index)=>
      ListTile(
        title: Text(hivebox.getAt(index)[0]),
        subtitle: Text(hivebox.getAt(index)[1]),
        subtitleTextStyle: TextStyle(),
      ),
      ): const Center(child: Text("Looks like theres nothing here"),)
      );
  }
}