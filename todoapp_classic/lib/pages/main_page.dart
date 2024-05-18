
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todoapp_classic/componets/task_tile.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
    bool? _isComplete = false; // Move _isComplete here
  Edit(){}
  Remove(){}
    updateCompletion(var sa) {
     setState(() {
        _isComplete= sa;
     });

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("_Task Manager"),
        centerTitle: true,
        titleTextStyle: TextStyle(fontFamily: "Orbitron",fontSize: 26),
      ),
      body:Container(
        height: double.infinity,
        width:  double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.grey,Colors.white10],end: Alignment.bottomLeft,begin: Alignment.centerRight)
        ),
        child: ListView.builder(
          itemCount: 6,
          itemBuilder: (context,index){
          return TaskTile(isComplete: _isComplete!, callEdit: Edit, callRemove: Remove, updateCompletion: updateCompletion); 
        }),
      ),
    );
  }





}