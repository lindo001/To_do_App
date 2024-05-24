import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'MainPage.dart';

class Slashscreen extends StatefulWidget {
  static String id = "Slashscreen";
  const Slashscreen({super.key});

  @override
  State<Slashscreen> createState() => _SlashscreenState();
}

class _SlashscreenState extends State<Slashscreen> {
  
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), ()=>
    // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>
    // const MainPage()
    // ))
    Navigator.of(context).pushNamed(MainPage.id)

    );
  }
  @override
  Widget build(BuildContext context) {
    final double screenSizeh = MediaQuery.of(context).size.height;
    final double screenSizew = MediaQuery.of(context).size.width;
    const String studioName = "Hop into Productivity!";
    const String appName = "_Rabbit Notes";
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: screenSizeh,
        width: screenSizew,
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             SizedBox(height: screenSizeh*0.100),
            Image.asset("assets/rabbit1.jpg",height:screenSizeh*0.15,),
            // const SizedBox(height: 1,),
            Text(appName,style: TextStyle(fontFamily: "Orbitron",fontSize: 29,color: Colors.grey.shade800),),
            const SizedBox(height: 10),
            Text(studioName,style: TextStyle(fontFamily: "Orbitron",fontSize:10,color: Colors.grey.shade700),),


          ],
        ),
      ),
    );
  }
}