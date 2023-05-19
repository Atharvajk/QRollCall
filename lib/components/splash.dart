import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qrollcall/components/welcome_screen.dart';
import 'package:qrollcall/info/profile.dart';
import 'package:qrollcall/pages/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var isvisible = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(milliseconds: 50), () {
      setState(() {
        isvisible = true;
      });
      authentication();
    });
  }

  void authentication() async{
    var sharedpref = await SharedPreferences.getInstance();
    var isauthentic = sharedpref.getBool(LoginStatus.LOGKEY);
    Timer(Duration(seconds: 3), () {
      setState(() {
        isvisible = false;
      });
      if (isauthentic != null) {
      if (isauthentic) {
        Navigator.pushReplacement(context,MaterialPageRoute(
          builder: (context) {
            return const HomePage();
          },
        ),
      );
      } else {
        Navigator.pushReplacement(context,MaterialPageRoute(
          builder: (context) {
            return const WelcomeScreen();
          },
        ),
      );
      }
    } else {
      Navigator.pushReplacement(context,MaterialPageRoute(
          builder: (context) {
            return const WelcomeScreen();
          },
        ),
      );
    }


      
      
    });
  }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
      backgroundColor: Color.fromARGB(255, 9, 28, 59),
      body: SafeArea(
          child: Center(
        child: AnimatedOpacity(
          duration: Duration(seconds: 1),
          opacity: isvisible ? 1.0 : 0.0,
          child: Container(
              color: Color.fromARGB(255, 9, 28, 59),
              width: 250,
              height: 250,
              child: Image.asset("assets/images/splashscreenimg.png")),
        ),
      )),
    );
  }
}