import 'package:flutter/material.dart';

class taskModification extends StatelessWidget {
  TextEditingController titleController;
  TextEditingController descriptionController;
  final Function callThisFunction;
  taskModification({
  required this.titleController,
  required this.descriptionController,
  required this.callThisFunction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:8.0),
          child: Column(children: [
            SizedBox(height: 20,),
            TextField(controller: titleController,decoration: InputDecoration(hintText: "Title"),),
            SizedBox(height: 30,),
           
            TextField(controller: descriptionController,maxLines: null,decoration: InputDecoration(hintText: "Description"),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                   TextButton(onPressed: (){
                  titleController.clear();
                  descriptionController.clear();
                  Navigator.of(context).pop();
          
                }, child: Text("Cancel")),
                TextButton(onPressed: (){
                 if(titleController.text.isNotEmpty && descriptionController.text.isNotEmpty){
                   callThisFunction(titleController.text,descriptionController.text);
                 }
                  Navigator.of(context).pop();
                }, child: Text("Save")),
             
              ],
            )
          ],),
        ),
      ),
    );
  }
}