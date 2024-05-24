


import 'package:flutter/material.dart';
import 'package:todoapp_classic/utils/colors.dart';

class Todatasktile extends StatelessWidget {
  List<String> list;
  final Function function;
    Todatasktile({super.key, required this.list,required this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(15),
      height: 110,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(list[1] ,style: TextStyle(fontFamily: "YanoneKaffeesatz",color: Colors.black)),
            IconButton(onPressed: (){
              showDialog(context: context, 
              builder: (context)=>AlertDialog(
                title: Text("Are you sure you want to remove this Task ?"),
                actions: [
                IconButton(onPressed: (){
                  function();
                }, icon: Icon(Icons.check)),
                ],
              ));
            }, icon: Icon(Icons.more_vert_sharp))

            ],
          ),
        ),Divider(),
          Row(children: [
            Icon(Icons.check),
            SizedBox(width: 8,),
            Text(list[0] ,style: TextStyle(fontFamily: "Orbitron",color: Colors.black)),
          ],),
        ],
      )
    );
  }
}