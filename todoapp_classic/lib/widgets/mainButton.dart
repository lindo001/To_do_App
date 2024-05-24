

import 'package:flutter/material.dart';
import 'package:todoapp_classic/utils/colors.dart';

class Mainbutton extends StatelessWidget {
  final String text;
  final Function onCall;
  final Color? color; 
  Mainbutton({super.key, required this.text, required this.onCall, required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onCall(),
      child: Container(
        width: 300/2,
        height: 400/7,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: (color==null)?Colors.transparent:color,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(style: (color==null)?BorderStyle.solid:BorderStyle.none,
          color: lightGray)
          
      
        ),
      child: Center(child: Text(text,style: TextStyle(color: Colors.black),)),
      ),
    );
  }
}