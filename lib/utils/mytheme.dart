import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0.1,
        iconTheme: IconThemeData(color: Colors.black),
       
      ));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
    brightness: Brightness.dark,
      // primarySwatch: Colors.deepPurple,
      // fontFamily: GoogleFonts.poppins().fontFamily,
      // appBarTheme: const AppBarTheme(
      //   color: Colors.white,
      //   elevation: 0.1,
      //   iconTheme: IconThemeData(color: Colors.black),
      // )
       
      );
}
