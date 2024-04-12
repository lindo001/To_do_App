

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Customwidgets extends StatelessWidget {
    String todo;
    bool isComplete =false;
    final Function editDB;
    final Function markDB;
    final Function removeDB;
    final int index;
    // DateTime _time = DateTime.now();
  Customwidgets({super.key,required this.isComplete,required this.todo,required this.editDB,required this.markDB,required this.removeDB,required this.index});

  @override
  Widget build(BuildContext context) {

    DateTime _time = DateTime.now();
    final double _height = MediaQuery.of(context).size.height/8;
    return GestureDetector(
      //Edit
      onTap: ()=> editDB(index),
      //done
      onDoubleTap: (){},
      //remove
      onLongPress: ()=>removeDB(index),
      child: Container(
        height: _height,
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ContainerTileDetails(isComplete!, todo),
            Text(DateTime.now().hour.toString())
          ],
        ),
      ),
    );
  }

  Row ContainerTileDetails(bool isComplete, String todo) {
    return Row(children: [
    isComplete? Icon(Icons.radio_button_unchecked,color: Colors.white,):Icon(Icons.check_circle_outline,color: Colors.grey,),
    const SizedBox(width: 5),
    Text(todo, style: TextStyle(decoration: isComplete?TextDecoration.none:TextDecoration.lineThrough,
    
    color: isComplete?Colors.white:Colors.grey))

    ],);
  }
}

class Task extends HiveObject{
  late String title;
  late bool isDone;

}