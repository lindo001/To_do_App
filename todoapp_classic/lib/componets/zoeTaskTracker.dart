



import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class zoeTaskTracker extends ChangeNotifier{

    final _zoeCanYou = Hive.box("myDB");
    // var get_length = _
    int get_length()=> _zoeCanYou.length;

    //write
       void writeToHive(String whatToDo){
        _zoeCanYou.add([false,whatToDo]);
        
        notifyListeners();
          
    }
    //edit
    void editToHive(index,value){
      _zoeCanYou.putAt(index, value);
        notifyListeners();

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


}