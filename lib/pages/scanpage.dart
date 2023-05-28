import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:qrollcall/info/profile.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:quickalert/quickalert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  String result = "Hello World...!";
  bool isfetch = false;
  Future _scanQR() async {
    if (await Permission.camera.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
      try {
        String? cameraScanResult = await scanner.scan();
        setState(() {
          result = cameraScanResult!;
          isfetch = true; // setting string result with cameraScanResult
        });
        markAttendance();
        print(result);
      } on PlatformException catch (e) {
        print(e);
      }
    } else {
      openAppSettings();
    }
  }

  void reqAttendance() async {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.loading,
      title: "Loading",
      text: "Marking Attendance...",
    );
    var sharedpref = await SharedPreferences.getInstance();
    var stud_id = await sharedpref.getString(LoginStatus.id);
    String? reqreturn;
    try {
      var response = await http.put(
        Uri.parse(result),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{"studentId": "$stud_id"}),
      );
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        //atendance marked
        var decodedData = jsonDecode(response.body);
        reqreturn = decodedData["message"];
        print(reqreturn);
        await QuickAlert.show(
            context: context,
            type: QuickAlertType.success,
            text: reqreturn,
            autoCloseDuration: Duration(seconds: 6));
      } else {
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   content: Container(
        //     child: Text("Server not responding!"),
        //   ),
        //   behavior: SnackBarBehavior.floating,
        // ));
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: "Error",
          text: "Server not responding!",
        );
      }
    } catch (e) {
      print(e);
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   content: Container(
      //     child: Text("Something went wrong!"),
      //   ),
      //   behavior: SnackBarBehavior.floating,
      // ));
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: "Error",
        text: "Something went wrong!",
      );
    }
    Navigator.pop(context);
  }

  void markAttendance() {
    //check if api link in result

    var source = 'https://q-roll-backend.onrender.com/api/';
    if (result.contains(source)) {
      print('Our source matched!..Initializing mark attendance');
      // QuickAlert.show(
      //   context: context,
      //   type: QuickAlertType.loading,
      //   title: "Loading",
      //   text: "Marking Attendance...",
      //   autoCloseDuration: Duration());
      reqAttendance();
    } else {
      print("Bad URL");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scanQR();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(),
      body: SafeArea(
          child: Center(
              child: Container(
        child: "Loading".text.make(),
        decoration: BoxDecoration(color: Colors.black),
      ))),
    );
  }
}
