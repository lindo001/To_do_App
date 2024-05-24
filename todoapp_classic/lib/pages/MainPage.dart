import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import '../services/functions/persistentDB.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';
import '../utils/styles.dart';
import '../widgets/datePickerField.dart';
import '../widgets/frostedGlassContainer.dart';
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
  void save(String data,String date){
setState(() {

      db.add([data,date]);
clean();
closeNOpenTask();
});
  }
  //Read
  read(int index)=>setState(()=> db.getAt(index));
//   read(){
// setState(() {
//       return db.getAt(index);
// });
//   }
  //Modify
  edit(int index, Persistentdb value){
   setState(() {
      db.putAt(index, value);
   });
  }
  //Delete
  void remove(int index){
    setState(() {
      db.deleteAt(index);
    });
  }


  TextEditingController _dateController = TextEditingController();
  TextEditingController _taskController = TextEditingController();
  String _selectedDate = "";
  String _taskData = "";
  bool isTaskOpen = false;

  void closeNOpenTask(){

    setState(() {
      isTaskOpen =! isTaskOpen;
    });
  }
void clean(){
      _taskController.clear();
    _dateController.clear();
}
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: 
      isTaskOpen?SizedBox():FloatingActionButton(onPressed: ()=>closeNOpenTask(),backgroundColor: limeGreen,),
      bottomNavigationBar: isTaskOpen? Container(height:screen.width ,color: darkGray,
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(cat,style: tiltNeon),
        Text("Title"),
        inputField(inputFieldController: _taskController,hintText: "Input"),
      SizedBox(height:screen.height*0.015,),
        Text("Date"),

 DatePickerField(
              inputFieldController: _dateController,
              hintText: "Due Date",
              onDateSelected: (date) {
                setState(() {
                  _selectedDate = date; 
                  _dateController.text = _selectedDate; 

                });
              },
            ),
 SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Mainbutton(text: "Cancel", onCall: (){clean();closeNOpenTask();},color: null),
            Mainbutton(text: "Next", onCall: ()=>save(_taskController.text,_dateController.text),color: limeGreen),
          ]
        )
      ],),
      
      ):null,
      body: db.length>0?Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: ListView.builder(
              itemCount: db.length,
              itemBuilder: (context,index){
                return Todatasktile(list: db.getAt(index),function:()=>remove(index),);
              }),
          ),
          isTaskOpen?FrostedGlassBox():SizedBox()
        ],
      ):Center(child: isTaskOpen?FrostedGlassBox():Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Image.asset("assets/sad.png",height: screen.width*0.30,),
        SizedBox(height: screen.width*0.25),
        Text("There seems to be nothing here",style: TextStyle(fontFamily: "tiltNeon",fontSize: 20),)
           
      ],),)
    );
  }
}