import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import '../services/functions/persistentDB.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';
import '../utils/styles.dart';
import '../widgets/datePickerField.dart';
import '../widgets/inputField.dart';
import '../widgets/mainButton.dart';
import '../widgets/todaTaskTile.dart';

class MainPage extends StatefulWidget {
  static String  id = "MainPage"; 
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final db = Hive.box("persistingdata");
  //Write
  void save(Persistentdb data){
    db.add(data);
  }
  //Read
  read(int index){
    return db.getAt(index);
  }
  //Modify
  edit(int index, Persistentdb value){
    db.putAt(index, value);
  }
  //Delete
  void remove(int index){
    db.deleteAt(index);
  }


  TextEditingController _dateController = TextEditingController();
  TextEditingController _taskController = TextEditingController();
  String _selectedDate = "";
  String _taskData = "";
  bool isTaskOpen = false;

  void closeNOpenTask(){
      print(isTaskOpen);

    setState(() {
      isTaskOpen =! isTaskOpen;
      print(isTaskOpen);
    });
  }

  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<String>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: ()=>closeNOpenTask(),backgroundColor: limeGreen,),
      bottomNavigationBar: isTaskOpen? Container(height: 500,color: darkGray,
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(cat,style: tiltNeon),
        Text("Title"),
        inputField(inputFieldController: _taskController,hintText: "Input"),
      SizedBox(height: 15,),
// 
        Text("Date"),

 DatePickerField(
              inputFieldController: _dateController,
              hintText: "Due Date",
              onDateSelected: (date) {
                setState(() {
                  _selectedDate = date; 
                  _dateController.text = _selectedDate; 
                  print(_selectedDate);

                });
              },
            ),
 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Mainbutton(text: "Cancel", onCall: ()=>closeNOpenTask(),color: null),
            Mainbutton(text: "Next", onCall: ()=>closeNOpenTask(),color: limeGreen),
          ],
        )
      ],),
      
      ):null,
      body: Column(children: [
        Todatasktile()
      ],)
    );
  }
}