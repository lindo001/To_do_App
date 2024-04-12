

import 'package:flutter/material.dart';

class Taskcreationpage extends StatelessWidget {
  final TextEditingController title;
  final bool isDone;
  Taskcreationpage({super.key,
  required this.title,
  required this.isDone
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Write down tour to do here"
                ),
              ),
            ),
            Row(
                
              children: [
              ElevatedButton(onPressed: (){}, child: Text("data"),),
              OutlinedButton(onPressed: (){}, child: Text("JJk"))
            ],)
          ],
        ),
      ),
    );
  }
}