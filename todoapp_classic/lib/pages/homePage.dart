

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_classic/componets/zoeTaskTile.dart';
import 'package:todoapp_classic/componets/zoeTaskTracker.dart';
import 'package:todoapp_classic/pages/settings.dart';
import 'package:todoapp_classic/pages/taskmodifcation.dart';

class homePage extends StatefulWidget {
  static String id = "HomePage"; 
   homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    final _zoeCanYou = Hive.box("myDB");

  final linekedToTracker = Provider.of<zoeTaskTracker>(context);

    var iop = 0;
    //write
    void test2(){
    
      // int sizeOfDB = _zoeCanYou.length;
      setState(() {
        Navigator.pushNamed(context, Settings.id);
        iop++;
        // _zoeCanYou.
      }
      
      );
        // _zoeCanYou.add([false,whatToDo]);
        print(linekedToTracker.get_length());
          
    }
    //read
    String readFromHive( int index){
      print(_zoeCanYou.get(index));
      return _zoeCanYou.get(index);
    }
    //remove
    void removeFromHive(int index){
      _zoeCanYou.delete(index);
      _zoeCanYou.clear();
      _zoeCanYou.deleteFromDisk();
    }


    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=> test2()
        , icon: Icon(Icons.menu)),
        title: Text("zoeToDO",style: GoogleFonts.aboreto(fontSize:30),),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(onPressed: ()=>Navigator.pushNamed(context, taskModification.id)), // this is page where i update the database
      body: SafeArea(child:Center(
        child: ListView.builder(itemCount:linekedToTracker.get_length(),itemBuilder: (ctx,index){
          // print();
          return zoeTaskTile(taskDetail: linekedToTracker.readFromHive(index));
        })
      )),
    );
  }
}