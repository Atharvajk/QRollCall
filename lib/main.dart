import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrollcall/pages/MyRoutes.dart';
import 'package:qrollcall/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      initialRoute: "/home",
      themeMode: ThemeMode.light,
      theme:ThemeData(primarySwatch: Colors.deepPurple, fontFamily: GoogleFonts.lato().fontFamily,),
      darkTheme: ThemeData(brightness: Brightness.dark),

      routes: {
        MyRoutes.homepage:(context) => HomePage(),
        // MyRoutes.loginpage:(context) => loginpage(),
        // MyRoutes.modelpage:(context) => ModelPage(),
        // MyRoutes.scrollpage:(context) => scroller_page(),

      },
    );
  }
}