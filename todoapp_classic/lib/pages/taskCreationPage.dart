

import 'package:flutter/material.dart';

class Taskcreationpage extends StatelessWidget {
  final TextEditingController title;
  final bool isDone;
  final Function saveFuncion;
  int? index;
  Taskcreationpage({super.key,
  required this.title,
  required this.isDone,
  required this.saveFuncion,
  this.index
  });

  @override
  Widget build(BuildContext context) {
    index = (index == null)?0:index;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: title,
                decoration: InputDecoration(
                  hintText: "Write down tour to do here"
                ),
              ),
              SizedBox(height: 10,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                OutlinedButton(onPressed: ()=>Navigator.of(context).pop(), child: Text("Cancel"),),
                OutlinedButton(onPressed: ()=>saveFuncion(title.text,isDone), child: Text("Save"))
              ],)
            ],
          ),
        ),
      ),
    );
  }
}