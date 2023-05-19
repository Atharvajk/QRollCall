import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrollcall/components/splash.dart';
import 'package:qrollcall/pages/MyRoutes.dart';
import 'package:qrollcall/pages/homepage.dart';
import 'package:qrollcall/pages/scanpage.dart';
import 'package:qrollcall/utils/mytheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: const SplashScreen(),
     // initialRoute: "/home",
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      routes: {
        MyRoutes.homepage: (context) => HomePage(),
        MyRoutes.scanpage:(context) => ScanPage(),
        // MyRoutes.loginpage:(context) => loginpage(),
        // MyRoutes.modelpage:(context) => ModelPage(),
        // MyRoutes.scrollpage:(context) => scroller_page(),
      },
    );
  }
}
