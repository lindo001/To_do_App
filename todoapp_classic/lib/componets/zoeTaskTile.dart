

import 'package:flutter/material.dart';

class zoeTaskTile extends StatelessWidget{
  // task progress
  bool _taskProgress = false;
  // task description
  String _taskDetail = "";
  zoeTaskTile({required String taskDetail}){
   this._taskDetail = taskDetail;  
  }

  @override 
  Widget build(BuildContext context){
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(bottom: 5,left: 10,right: 10),
      color: Colors.purple,
        height: _height/10,
        width: _width,
        child: Row(children: [
          Expanded(flex: 2,child: Center(child: !_taskProgress? Icon(Icons.done):Icon(Icons.warning))),

          Expanded(flex: 6,child: Text(_taskDetail))
        ],),

    );
  }
}