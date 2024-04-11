

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp_classic/pages/homePage.dart';

class Slashscreen extends StatefulWidget {
  Slashscreen({super.key});

  @override
  State<Slashscreen> createState() => _SlashscreenState();
}

class _SlashscreenState extends State<Slashscreen> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), ()=>
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>
    homePage()
    ))
    );
  }
  @override
  Widget build(BuildContext context) {
    final double screenSizeh = MediaQuery.of(context).size.height;
    final double screenSizew = MediaQuery.of(context).size.width;
    final String header = "Kiwi Production";
    final String subheader = "Track your Habits and level up";
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SizedBox(
        height: screenSizeh,
        width: screenSizew,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Image.asset("assets/castle.png",height: 100,),
            SizedBox(height: 90),

            // Text(header,style: GoogleFonts.allertaStencil(fontSize: 20,color: Colors.orange)),
            // // 
            // Text(subheader,style: GoogleFonts.allertaStencil(fontSize: 15,color: Colors.orange),),
            // SizedBox(height: 180),
            // LinearProgressIndicator(
            //   minHeight: 13,
            //   backgroundColor: Colors.grey,
            //   valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            // )
          ],
        ),
      ),
    );
  }
}