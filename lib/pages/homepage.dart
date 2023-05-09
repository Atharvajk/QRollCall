import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
 
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          FittedBox(child: Text("Hello, Atharva!",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)).p20()),
          const Text("Your Attendance",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)).px24(),
          Container(
            height: 230,width: 500,
            decoration:
             const BoxDecoration(color: Colors.black26,//gradient: LinearGradient(colors: [Color.fromRGBO(251,251,253,1.000)],transform: GradientRotation(45.0))
             ),
          )
        ]
      )),
    );
  }
}
