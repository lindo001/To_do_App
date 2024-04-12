import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp_classic/componets/customWidgets.dart';
import 'package:todoapp_classic/componets/dateFormater.dart';
import 'package:todoapp_classic/pages/settingsPage.dart';
import 'package:todoapp_classic/pages/taskCreationPage.dart';

class Landingpage extends StatefulWidget {
  const Landingpage({super.key});

  @override
  State<Landingpage> createState() => _LandingpageState();
}





class _LandingpageState extends State<Landingpage> {
  TextEditingController controller = TextEditingController();
  Dateformater dateformater = Dateformater();
  final _dataBase = Hive.box("todo_DB");
  //NavigateTo
void editDB(index){
  setState(() {
    _dataBase.getAt(index)["isDone"] =! _dataBase.getAt(index)["isDone"];
  });
}
void markDB(){}




//////////////////////
//write
void saveToDB(String title,bool isDone){

  setState(() {
    _dataBase.add({"title":title,"isDone":isDone,"date":dateformater.getCurrentDate()});});
    Navigator.of(context).pop();
}
//retrieve
getFromDB(int index){
  return _dataBase.get(index);   
}
//delete
removeDB(int? index){
  setState(() {
    _dataBase.deleteAt(index!);
  });
}
cleanDB(){
  setState(() {
    // _dataBase.;
  });
}
void goTo(Widget WhatPage){
  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> WhatPage));
}
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    DateTime _date = DateTime.now();
    return  Scaffold(
      appBar: PreferredSize(preferredSize: Size(_screenSize.width, _screenSize.height/7), child: Container(

        color: Colors.blue,
        child: Align(alignment: Alignment.topLeft,child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios)),
              const SizedBox(width: 60),
              Text("ToDo List", style: GoogleFonts.share(fontSize: 26,fontWeight: FontWeight.bold),),
              const SizedBox(width: 60),
              IconButton(onPressed: (){
                goTo(Settingspage(cleanFunction: cleanDB()));
              }, icon: Icon(Icons.more_vert))
            ],
          ),
        ),),
      )),
      floatingActionButton: GestureDetector(
        onTap: ()=>goTo(Taskcreationpage(title: controller, isDone: true, saveFuncion: saveToDB)),
        child: Container(
          height: _screenSize.height/9,
          width: _screenSize.height/9,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(60)
          ),
          child: Icon(Icons.add,size: 40,),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SafeArea(child: Container(
          child: Column(
        
            children: [
              Expanded(flex:2,child:  Container(
                height: 10,
                width: _screenSize.width,
                //  color: Colors.amber,
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,children: [
                Text("Today", style: GoogleFonts.share(fontSize: 19,fontWeight: FontWeight.w700),),
                Text(dateformater.getCurrentDate())
        
              ],),
              )),
              Expanded(flex:10,
                child: _dataBase.length>0?ListView.builder(itemCount: _dataBase.length,itemBuilder: (context,index)=>
                Customwidgets(todo: _dataBase.getAt(index)["title"],isComplete: _dataBase.getAt(index)["isDone"], editDB: editDB, markDB: markDB, removeDB: removeDB, index: index)
                ):const Center(child: Text("Looks like theres nothing here"),)
              )
            ],
          ),
        )),
      ),
    );
  }
}