

import 'package:flutter/material.dart';

class Customwidgets extends StatelessWidget {
    String todo;
    bool isComplete =false;
    // DateTime _time = DateTime.now();
  Customwidgets({super.key,required this.isComplete,required this.todo});

  @override
  Widget build(BuildContext context) {

    DateTime _time = DateTime.now();
    final double _height = MediaQuery.of(context).size.height/8;
    return GestureDetector(
      onTap: (){},
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
    isComplete? Icon(Icons.check_circle_outline,color: Colors.grey,):Icon(Icons.radio_button_unchecked,color: Colors.white,),
    const SizedBox(width: 5),
    Text(todo, style: TextStyle(decoration: isComplete?TextDecoration.lineThrough:TextDecoration.none,
    
    color: isComplete?Colors.grey:Colors.white))

    ],);
  }
}