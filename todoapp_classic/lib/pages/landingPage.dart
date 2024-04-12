import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp_classic/componets/customWidgets.dart';
import 'package:todoapp_classic/pages/taskCreationPage.dart';

class Landingpage extends StatefulWidget {
  const Landingpage({super.key});

  @override
  State<Landingpage> createState() => _LandingpageState();
}


//write
void writeToDB(){

}
//read
//delete


class _LandingpageState extends State<Landingpage> {
  TextEditingController controller = TextEditingController();
  //NavigateTo
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
              IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))
            ],
          ),
        ),),
      )),
      floatingActionButton: GestureDetector(
        onTap: ()=>goTo(Taskcreationpage(title: controller, isDone: false)),
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
                Text(_date.month.toString() + _date.day.toString() +_date.year.toString())
        
              ],),
              )),
              Expanded(flex:10,
                child: ListView.builder(itemCount: 6,itemBuilder: (context,index)=>
                Customwidgets(todo: "todo",isComplete: true,)
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}