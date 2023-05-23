import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrollcall/components/splash.dart';
import 'package:qrollcall/datamodels/getclassdetails_model.dart';
import 'package:qrollcall/datamodels/studentattendance_model.dart';
import 'package:qrollcall/info/apilist.dart';
import 'package:qrollcall/info/profile.dart';
import 'package:qrollcall/pages/MyRoutes.dart';
import 'package:qrollcall/widgets/student_atttend_wid.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/userwidget.dart';
import 'multiusermodel.dart';
import "package:http/http.dart" as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController = ScrollController();
  final url = "https://reqres.in/api/users?page=2";

  static bool isloading = true;
  var fname;
  String name = "there";
  var femail;
  String email = "empty";
  var initail;

  late get_student_attendance stud_attendance;
  late GetClassroomDetails classdetails;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      isloading = true;
    });
    loaddata();
    // Future.delayed(Duration(milliseconds: 500), () {
    //   scrollController.animateTo(scrollController.position.maxScrollExtent,
    //       duration: Duration(seconds: UserModel.users.length * 10),
    //       curve: Curves.linear);
    // }
    // );
  }

  loadclassdetails() async {
    final response = await http.get(Uri.parse(QrollCallApis.getclassdetails));
    final classjson = response.body;
    print("get request senddd");
    print(response.body);
    Map<String, dynamic> classMap = jsonDecode(classjson);
    classdetails = GetClassroomDetails.fromJson(classMap);
  }

  loaddata() async {
    var sharedpref = await SharedPreferences.getInstance();
    fname = sharedpref.getString(LoginStatus.name);
    print("Name laoded $name");
    femail = await sharedpref.getString(LoginStatus.email);
    setState(() {
      name = fname;
      email = femail;
    });
    // initail = name.charAt(0);
    await Future.delayed(Duration(seconds: 2));
    // final response = await http.get(Uri.parse(url));
    // final catalogJson = response.body;
    // final decodedData = jsonDecode(catalogJson);
    // var userdata = decodedData["data"];
    // UserModel.users =
    //     List.from(userdata).map<User>((user) => User.fromMap(user)).toList();

    //atendance integration in progress
    var classid = await sharedpref.getString(LoginStatus.classroom);
    var studid = await sharedpref.getString(LoginStatus.id);

    //get student attendance
    final response = await http.post(
      Uri.parse(QrollCallApis.getstudentattendance),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{"classroomId": "$classid", "studentId": "$studid"}),
    );
    final attendjson = response.body;
    print("post request senddd");
    print(response.body);
    Map<String, dynamic> attendMap = jsonDecode(attendjson);
    stud_attendance = get_student_attendance.fromJson(attendMap);

    //get class details
    // await loadclassdetails();
    Timer(Duration(seconds: 1), () {
      setState(() {
        isloading = false;
      });
    });
  }

  void logout(BuildContext context) async {
    var sharedpref = await SharedPreferences.getInstance();
    sharedpref.setBool(LoginStatus.LOGKEY, false);
    await sharedpref.setString(LoginStatus.name, "empty");
    await sharedpref.setString(LoginStatus.id, "empty");
    await sharedpref.setString(LoginStatus.classroom, "empty");
    await sharedpref.setString(LoginStatus.department, "empty");
    await sharedpref.setString(LoginStatus.semester, "empty");
    await sharedpref.setString(LoginStatus.mobileNum, "empty");
    await sharedpref.setInt(LoginStatus.rollNo, 0);
    await sharedpref.setString(LoginStatus.email, "empty");

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const SplashScreen();
        },
      ),
    );
  }

  String getsubjnamebyid(String id) {
    String subjname=" ";
    List subjects = ["6445678776fe16f933da4c65", "644567a876fe16f933da4c67", "Chemistry", "Hindi", "English"];

    for (var i=0; i < subjects.length; i++) {
      print(subjects[i]);
    }
    return subjname;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: 250,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("$name"),
              accountEmail: Text("$email"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange,
                child: (isloading)
                    ? Text("A")
                    : Text(
                        "${name[0]}",
                        style: const TextStyle(
                          fontSize: 40.0,
                        ),
                      ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                // Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                //Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.contacts),
              title: Text("Contact Us"),
              onTap: () {
                // Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text("LogOut"),
              onTap: () {
                showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Logout"),
                        content: Text("Do you want to logout?"),
                        actions: [
                          TextButton(
                            child: Text("No"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          TextButton(
                            child: Text("Yes"),
                            onPressed: () {
                              logout(context);
                            },
                          ),
                        ],
                        elevation: 10,
                      );
                    });

                // Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        //title: Center(child: "QRollCall".text.xl2.bold.make()),
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Expanded(
                child: FittedBox(
                    child: Text("Hello, $name!",
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold))
                        .px20()),
              ),
              InkWell(
                onTap: () => {print("Profile taped!")},
                child: Ink(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.person),
                ).p20(),
              )
            ],
          ),
          const Text("Your Attendance",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
              .px24(),
          Container(
            height: 230,
            width: 500,
            decoration: const BoxDecoration(
                // color: Colors.black26, //gradient: LinearGradient(colors: [Color.fromRGBO(251,251,253,1.000)],transform: GradientRotation(45.0))
                ),
            child: (isloading)
                ? ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Shimmer(
                        color: Colors.white,
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 201, 201, 201),
                              borderRadius: BorderRadius.circular(15)),
                        ).p8(),
                      );
                    })
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: stud_attendance.studentAttendanceArray?.length,
                    //controller: scrollController,
                    itemBuilder: (context, index) {
                      return Student_attend_wid(
                          subjectname: stud_attendance
                              .studentAttendanceArray?[index].subjectName,
                          studentAttendedLecture: stud_attendance
                              .studentAttendanceArray?[index]
                              .studentAttendedLecture,
                          totalLectureOfsubject: stud_attendance
                              .studentAttendanceArray?[index]
                              .totalLectureOfsubject,
                          totalPercentageAttendance: stud_attendance
                              .studentAttendanceArray?[index]
                              .totalPercentageAttendance);
                    },
                  ),
          ),
          Center(
            child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, MyRoutes.scanpage);
                },
                child: Ink(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                        child: "Scan QR".text.white.center.scale(1.3).make()))),
          ),
          SizedBox(
            height: 24,
          ),
          const Text("Previous Attendance",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
              .px24(),
          Container(
            height: 500,
            //color: Colors.white,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 216, 170, 231),
                      borderRadius: BorderRadius.circular(15)),
                  child: ListTile(
                    leading: Text("${7 + index}:00 am"),
                    title: Text("Lecture No ${index + 1}"),
                    subtitle: Text("By Teacher No ${index + 1}"),
                    trailing: Icon(
                      Icons.check_circle,
                      color: Colors.black,
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
            ),
          ).p12()
        ]),
      )),
    );
  }
}
