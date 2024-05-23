


import 'package:flutter/material.dart';
import 'package:todoapp_classic/utils/colors.dart';

class Todatasktile extends StatelessWidget {
  const Todatasktile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(15),
      height: 90,
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: lightGray,
            offset: Offset(4.0, 4),
            spreadRadius: 0.2
          )
        ],
        color: limeGreen
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(DateTime.now().toString().split(" ")[0] ,style: TextStyle(fontFamily: "YanoneKaffeesatz",color: Colors.black)),
        ),Divider(),
          Row(children: [
            Icon(Icons.check),
            SizedBox(width: 8,),
            Text("This is placeHolder Text" ,style: TextStyle(fontFamily: "Orbitron",color: Colors.black)),
          ],),
        ],
      )
    );
  }
}